#!/bin/bash
# =============================================================================
# Open TechStack — Automated Social Sharing Script
# Run: chmod +x share.sh && ./share.sh
# =============================================================================

set -e

SITE_URL="https://opentechstack.stitchwebsite.com"
REPO_URL="https://github.com/JagadeepPortfolio/awesome-vibecoding-techstacks"
TITLE="Open TechStack — Interactive Visual Guides to 200+ Technologies for 2026"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo ""
echo "=========================================="
echo "  🚀 Open TechStack — Share Automation"
echo "=========================================="
echo ""

# ─── 1. Hacker News (Show HN) ───────────────────────────────────────────────
echo -e "${YELLOW}[1/5] Hacker News${NC}"
if [ -n "$HN_COOKIE" ]; then
  echo "  Submitting to Hacker News..."
  curl -s -X POST "https://news.ycombinator.com/submit" \
    -H "Cookie: user=$HN_COOKIE" \
    -d "title=Show HN: Open TechStack – Interactive visual guides to 200+ technologies for 2026&url=$SITE_URL" \
    -o /dev/null -w "  HTTP %{http_code}\n"
  echo -e "  ${GREEN}✓ Submitted to HN${NC}"
else
  echo -e "  ${RED}⊘ Skipped — set HN_COOKIE to enable${NC}"
  echo "    Get it: Log into news.ycombinator.com → DevTools → Application → Cookies → 'user' value"
fi

# ─── 2. Reddit ──────────────────────────────────────────────────────────────
echo ""
echo -e "${YELLOW}[2/5] Reddit${NC}"
SUBREDDITS=("webdev" "programming" "reactjs" "javascript" "opensource" "SideProject")

if [ -n "$REDDIT_TOKEN" ]; then
  for sub in "${SUBREDDITS[@]}"; do
    echo "  Posting to r/$sub..."
    curl -s -X POST "https://oauth.reddit.com/api/submit" \
      -H "Authorization: Bearer $REDDIT_TOKEN" \
      -H "User-Agent: OpenTechStack/1.0" \
      -d "sr=$sub&kind=link&title=Open TechStack — Interactive visual guides to 200+ modern technologies (2026)&url=$SITE_URL&resubmit=true" \
      -o /dev/null -w "  HTTP %{http_code}\n"
    sleep 2  # Rate limit
  done
  echo -e "  ${GREEN}✓ Posted to ${#SUBREDDITS[@]} subreddits${NC}"
else
  echo -e "  ${RED}⊘ Skipped — set REDDIT_TOKEN to enable${NC}"
  echo "    Get it: https://www.reddit.com/prefs/apps → Create Script App → use client_id:secret for OAuth"
fi

# ─── 3. Dev.to ──────────────────────────────────────────────────────────────
echo ""
echo -e "${YELLOW}[3/5] Dev.to${NC}"
if [ -n "$DEVTO_API_KEY" ]; then
  echo "  Publishing article to Dev.to..."
  curl -s -X POST "https://dev.to/api/articles" \
    -H "api-key: $DEVTO_API_KEY" \
    -H "Content-Type: application/json" \
    -d "$(cat <<DEVTO_EOF
{
  "article": {
    "title": "I built Open TechStack — Interactive Visual Guides to 200+ Technologies for 2026",
    "published": true,
    "tags": ["webdev", "opensource", "javascript", "beginners"],
    "canonical_url": "$SITE_URL",
    "body_markdown": "## What is Open TechStack?\n\nOpen TechStack is a free, open-source, interactive visual guide to modern tech stacks. Compare **200+ technologies** across **50 categories**, filter by project stage (Hobby / MVP / Growth / Scale), and find the stack that fits.\n\n**🌐 Live:** [$SITE_URL]($SITE_URL)\n**⭐ GitHub:** [$REPO_URL]($REPO_URL)\n\n## What's Inside\n\n| Guide | Technologies |\n|-------|--------------|\n| Frontend | React, Vue, Svelte, Next.js, Astro, Tailwind, shadcn/ui, Zustand, TanStack Query, Vite |\n| Backend | Node.js, Python, Go, Rust, Supabase, Firebase, Postgres, Clerk, Stripe, Sentry |\n| AI/ML | OpenAI, Claude, Gemini, LangChain, Pinecone, CrewAI, vLLM, Hugging Face |\n| DevOps | GitHub Actions, Terraform, Docker, Kubernetes, AWS, Grafana, ArgoCD |\n| Mobile | React Native, Expo, Flutter, SwiftUI, Jetpack Compose, KMP |\n| Stack Combos | 12 pre-built recipes: Indie Hacker, AI Startup, SaaS, Enterprise, and more |\n\n## Features\n\n- **Interactive SVG Mind Maps** — visual overview, click to explore\n- **Stage-Based Filtering** — Hobby (\\\$0), MVP (\\\$25-60), Growth (\\\$50-500), Scale (\\\$500+)\n- **Full-Text Search** — find any technology instantly\n- **Decision Cheat Sheets** — quick picks by constraints\n- **Keyboard Shortcuts** — \\\`/\\\` to search, \\\`1-4\\\` for stages\n- **Zero Dependencies** — pure HTML + Tailwind CDN + vanilla JS\n\n## Tech Stack (meta!)\n\nBuilt with vanilla HTML, CSS, and JavaScript. Tailwind via CDN. SVG mind maps generated at runtime. No frameworks, no build tools, no node_modules.\n\n## Contributing\n\nContributions welcome! Adding a technology is as simple as adding an object to the TECH array.\n\n---\n\n**If this is useful, [star the repo]($REPO_URL) — it helps others find it!**"
  }
}
DEVTO_EOF
)" -o /dev/null -w "  HTTP %{http_code}\n"
  echo -e "  ${GREEN}✓ Published on Dev.to${NC}"
else
  echo -e "  ${RED}⊘ Skipped — set DEVTO_API_KEY to enable${NC}"
  echo "    Get it: https://dev.to/settings/extensions → Generate API Key"
fi

# ─── 4. Twitter/X ───────────────────────────────────────────────────────────
echo ""
echo -e "${YELLOW}[4/5] Twitter/X${NC}"
if [ -n "$TWITTER_BEARER" ] && [ -n "$TWITTER_ACCESS_TOKEN" ] && [ -n "$TWITTER_ACCESS_SECRET" ] && [ -n "$TWITTER_API_KEY" ] && [ -n "$TWITTER_API_SECRET" ]; then
  echo "  Posting tweet..."
  # Using OAuth 1.0a via curl is complex — recommend using twurl or tweepy
  echo -e "  ${RED}⊘ Direct OAuth 1.0a posting requires twurl. Install: gem install twurl${NC}"
else
  echo -e "  ${RED}⊘ Skipped — Twitter API tokens not set${NC}"
  echo "    Need: TWITTER_BEARER, TWITTER_ACCESS_TOKEN, TWITTER_ACCESS_SECRET, TWITTER_API_KEY, TWITTER_API_SECRET"
  echo "    Get them: https://developer.twitter.com/en/portal/dashboard"
fi

# ─── 5. LinkedIn ────────────────────────────────────────────────────────────
echo ""
echo -e "${YELLOW}[5/5] LinkedIn${NC}"
if [ -n "$LINKEDIN_TOKEN" ] && [ -n "$LINKEDIN_PERSON_URN" ]; then
  echo "  Posting to LinkedIn..."
  curl -s -X POST "https://api.linkedin.com/v2/ugcPosts" \
    -H "Authorization: Bearer $LINKEDIN_TOKEN" \
    -H "Content-Type: application/json" \
    -d "{
      \"author\": \"urn:li:person:$LINKEDIN_PERSON_URN\",
      \"lifecycleState\": \"PUBLISHED\",
      \"specificContent\": {
        \"com.linkedin.ugc.ShareContent\": {
          \"shareCommentary\": {\"text\": \"Excited to share Open TechStack — an open-source project with interactive visual guides to 200+ modern technologies across Frontend, Backend, AI/ML, DevOps, and Mobile.\n\nEach guide features an interactive mind map, stage-based filtering (Hobby to Enterprise), full-text search, and decision cheat sheets.\n\nBuilt with zero dependencies. Fully open source. Contributions welcome.\n\nCheck it out: $SITE_URL\nStar on GitHub: $REPO_URL\n\n#opensource #webdev #techstack #vibecoding #buildinpublic\"},
          \"shareMediaCategory\": \"ARTICLE\",
          \"media\": [{
            \"status\": \"READY\",
            \"originalUrl\": \"$SITE_URL\",
            \"title\": {\"text\": \"$TITLE\"},
            \"description\": {\"text\": \"Compare 200+ technologies across 50 categories. Filter by project stage. Zero dependencies.\"}
          }]
        }
      },
      \"visibility\": {\"com.linkedin.ugc.MemberNetworkVisibility\": \"PUBLIC\"}
    }" -o /dev/null -w "  HTTP %{http_code}\n"
  echo -e "  ${GREEN}✓ Posted to LinkedIn${NC}"
else
  echo -e "  ${RED}⊘ Skipped — set LINKEDIN_TOKEN and LINKEDIN_PERSON_URN to enable${NC}"
fi

# ─── Summary ────────────────────────────────────────────────────────────────
echo ""
echo "=========================================="
echo "  📋 Summary"
echo "=========================================="
echo ""
echo -e "  ${GREEN}✓ Already done (via GitHub CLI):${NC}"
echo "    • GitHub Discussion: ${REPO_URL}/discussions/1"
echo "    • GitHub Release v1.0.0: ${REPO_URL}/releases/tag/v1.0.0"
echo "    • 20 repo topics for discoverability"
echo ""
echo -e "  ${BLUE}📌 Quick manual shares (open in browser):${NC}"
echo ""
echo "    Twitter:"
echo "    https://x.com/intent/tweet?text=Just%20found%20Open%20TechStack%20%E2%80%94%20interactive%20visual%20guides%20comparing%20200%2B%20technologies%20across%20Frontend%2C%20Backend%2C%20AI%2FML%2C%20DevOps%2C%20and%20Mobile%20for%202026.%0A%0AMind%20maps%2C%20stage-based%20filtering%2C%20decision%20cheat%20sheets.%20Zero%20dependencies%2C%20fully%20open%20source.%0A%0Ahttps%3A%2F%2Fopentechstack.stitchwebsite.com%0A%0A%23vibecoding%20%23techstack%20%23webdev%20%23opensource"
echo ""
echo "    Reddit (r/webdev):"
echo "    https://www.reddit.com/r/webdev/submit?url=https%3A%2F%2Fopentechstack.stitchwebsite.com&title=Open%20TechStack%20%E2%80%94%20Interactive%20visual%20guides%20to%20200%2B%20modern%20technologies%20(2026)"
echo ""
echo "    Hacker News:"
echo "    https://news.ycombinator.com/submitlink?u=https%3A%2F%2Fopentechstack.stitchwebsite.com&t=Show%20HN%3A%20Open%20TechStack%20%E2%80%93%20Interactive%20visual%20guides%20to%20200%2B%20technologies%20for%202026"
echo ""
echo "    LinkedIn:"
echo "    https://www.linkedin.com/sharing/share-offsite/?url=https%3A%2F%2Fopentechstack.stitchwebsite.com"
echo ""
echo "  Done! 🎉"
