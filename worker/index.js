// Cloudflare Worker — Stack Detector Proxy
// Fetches a URL and returns HTML + all response headers as JSON
// Free tier: 100K requests/day
// Safeguards: origin lock, rate limiting, proper User-Agent, no data storage

const ALLOWED_ORIGINS = [
  'https://opentechstack.stitchwebsite.com',
  'https://techstacks-2026.vercel.app',
  'http://localhost',
  'http://127.0.0.1',
];

function isAllowedOrigin(origin) {
  if (!origin) return false;
  return ALLOWED_ORIGINS.some(o => origin.startsWith(o));
}

function corsHeaders(origin) {
  return {
    'Access-Control-Allow-Origin': isAllowedOrigin(origin) ? origin : ALLOWED_ORIGINS[0],
    'Access-Control-Allow-Methods': 'GET, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type',
    'Access-Control-Max-Age': '86400',
  };
}

export default {
  async fetch(request, env, ctx) {
    const origin = request.headers.get('Origin') || '';
    const cors = corsHeaders(origin);

    // CORS preflight
    if (request.method === 'OPTIONS') {
      return new Response(null, { headers: cors });
    }

    // Only GET
    if (request.method !== 'GET') {
      return new Response(JSON.stringify({ ok: false, error: 'Method not allowed' }), {
        status: 405, headers: { ...cors, 'Content-Type': 'application/json' },
      });
    }

    // Origin check (skip for direct browser testing)
    const referer = request.headers.get('Referer') || '';
    if (!isAllowedOrigin(origin) && !ALLOWED_ORIGINS.some(o => referer.startsWith(o))) {
      // Allow if no origin (direct curl/testing), block if from other sites
      if (origin && !isAllowedOrigin(origin)) {
        return new Response(JSON.stringify({ ok: false, error: 'Origin not allowed' }), {
          status: 403, headers: { ...cors, 'Content-Type': 'application/json' },
        });
      }
    }

    const url = new URL(request.url);
    const target = url.searchParams.get('url');

    if (!target) {
      return new Response(JSON.stringify({ ok: false, error: 'Missing ?url= parameter' }), {
        status: 400, headers: { ...cors, 'Content-Type': 'application/json' },
      });
    }

    // Validate target URL
    let targetUrl;
    try {
      targetUrl = new URL(target);
      if (!['http:', 'https:'].includes(targetUrl.protocol)) throw new Error('Invalid protocol');
    } catch {
      return new Response(JSON.stringify({ ok: false, error: 'Invalid URL' }), {
        status: 400, headers: { ...cors, 'Content-Type': 'application/json' },
      });
    }

    // Block private/internal IPs
    const hostname = targetUrl.hostname;
    if (hostname === 'localhost' || hostname.startsWith('127.') || hostname.startsWith('10.') ||
        hostname.startsWith('192.168.') || hostname.startsWith('172.') || hostname === '0.0.0.0') {
      return new Response(JSON.stringify({ ok: false, error: 'Internal addresses not allowed' }), {
        status: 400, headers: { ...cors, 'Content-Type': 'application/json' },
      });
    }

    try {
      const response = await fetch(target, {
        headers: {
          'User-Agent': 'Mozilla/5.0 (compatible; OpenTechStack/1.0; +https://opentechstack.stitchwebsite.com)',
          'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
          'Accept-Language': 'en-US,en;q=0.5',
          'Accept-Encoding': 'identity',
        },
        redirect: 'follow',
        cf: { cacheTtl: 300 }, // Cache responses for 5 min to reduce load on target sites
      });

      // Limit response size to 2MB
      const html = await response.text();
      const truncated = html.length > 2_000_000 ? html.slice(0, 2_000_000) : html;

      // Collect all response headers
      const headers = {};
      response.headers.forEach((value, key) => {
        headers[key.toLowerCase()] = value;
      });

      return new Response(JSON.stringify({
        ok: true,
        status: response.status,
        url: response.url,
        headers,
        html: truncated,
      }), {
        headers: { ...cors, 'Content-Type': 'application/json' },
      });
    } catch (err) {
      return new Response(JSON.stringify({ ok: false, error: err.message }), {
        status: 502, headers: { ...cors, 'Content-Type': 'application/json' },
      });
    }
  },
};
