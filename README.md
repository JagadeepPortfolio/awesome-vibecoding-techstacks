# TechStacks 2026

**Interactive visual guides to modern frontend and backend tech stacks.**

> Compare 100+ technologies across 20 categories. Filter by project stage (Hobby / MVP / Growth / Scale), search, and find the stack that fits.

**Live site:** [stacks.stitchwebsite.com](https://stacks.stitchwebsite.com)

---

## What's Inside

### [Frontend Stacks Guide](https://stacks.stitchwebsite.com/Frontend-Stacks-Visual-Guide.html)
60+ technologies across UI frameworks, meta-frameworks, styling, state management, data fetching, forms, build tools, testing, UI libraries, and hosting.

**Covers:** React, Vue, Svelte, Solid, Angular, Next.js, Nuxt, Astro, SvelteKit, Tailwind, shadcn/ui, Zustand, TanStack Query, tRPC, Vite, Vitest, Playwright, and more.

### [Backend Stacks Guide](https://stacks.stitchwebsite.com/Backend-Stacks-Visual-Guide.html)
50+ technologies across languages/frameworks, BaaS, hosting, databases, auth, jobs/queues, storage, payments, email, and observability.

**Covers:** Node.js, Python, Go, Rust, Rails, Elixir, Supabase, Firebase, Postgres, Neon, Clerk, Auth0, Stripe, Inngest, Temporal, Sentry, and more.

---

## Features

- **Interactive Mind Map** — Visual overview of the landscape. Click nodes to jump to detail cards.
- **Stage-Based Filtering** — Hobby ($0), MVP ($25-60), Growth ($50-500), Scale ($500+). Pick your stage to see what fits.
- **Search & Filter** — Full-text search, category chips, filter by free tier / self-hostable / production-proven / TypeScript-first.
- **Decision Cheat Sheets** — Quick picks by team situation, constraints, and anti-patterns to avoid.
- **Keyboard Shortcuts** — `/` to search, `1-4` for stages, `Esc` to reset.
- **Zero Dependencies** — Pure HTML + Tailwind CDN + vanilla JS. No build step. Just open the HTML.

---

## Tech Stack (meta!)

- Vanilla HTML / CSS / JavaScript
- Tailwind CSS (CDN)
- SVG mind maps (generated at runtime)
- No frameworks, no build tools, no node_modules

---

## Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

**Quick ways to contribute:**
- Add a new technology entry (just add an object to the `TECH` array)
- Update outdated information (pricing, features, stages)
- Fix typos or improve descriptions
- Suggest new guide categories (DevOps, AI/ML, Mobile)

---

## Roadmap

- [ ] DevOps & Infrastructure Stacks Guide
- [ ] AI / ML Stacks Guide
- [ ] Mobile Stacks Guide
- [ ] Full-Stack Combo Recommendations
- [ ] Stack Comparison Tool (side-by-side)
- [ ] Community voting on technologies

---

## Running Locally

No build step needed. Just open the HTML files:

```bash
git clone https://github.com/JagadeepPortfolio/2026TechStack.git
cd 2026TechStack
open index.html
# or use any local server:
python3 -m http.server 8080
```

---

## License

[MIT](LICENSE) — use it however you want.

---

**Found this useful? Give it a star!**
