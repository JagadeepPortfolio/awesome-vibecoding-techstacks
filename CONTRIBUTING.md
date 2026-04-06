# Contributing to Open TechStack

Thanks for your interest! This is a **community-driven** project. Every contribution — from fixing a typo to adding a new guide — makes this resource better for all developers.

## Quick Start

```bash
# Fork, clone, open — no build step
git clone https://github.com/YOUR-USERNAME/awesome-vibecoding-techstacks.git
cd awesome-vibecoding-techstacks
open index.html   # or python3 -m http.server 8080
```

## Ways to Contribute

### 1. Add a Technology (Easiest)

Each guide stores technologies in a `TECH` array inside the HTML file. To add one:

1. Open the relevant HTML file (see [guide list](#which-file) below)
2. Find the `const TECH = [` array
3. Add your entry at the end (before the closing `]`)
4. Open the file in a browser to verify
5. Submit a PR

**Entry format (Frontend/Backend/AI-ML/DevOps/Mobile):**
```js
{
  id: "unique-id",           // lowercase, hyphens, no spaces
  name: "Display Name",      // as developers know it
  cat: "category-code",      // see category codes below
  summary: "1-2 sentences. What it does and why it matters in 2026.",
  pros: ["Pro 1", "Pro 2", "Pro 3"],
  cons: ["Con 1", "Con 2"],
  bestFor: "One-liner: when to pick this",
  free: true,                // usable free tier?
  ts: true,                  // TypeScript-first? (frontend/backend only)
  self: true,                // self-hostable? (backend/devops only)
  prod: true,                // production-proven at scale?
  stages: ["hobby", "mvp", "growth", "scale"]
}
```

### 2. Fix Outdated Info

Pricing changed? Feature added? Version bumped? Just update the relevant fields in the `TECH` array entry and submit a PR. Mention your source in the PR description.

### 3. Request a Comparison

[Open an issue](https://github.com/JagadeepPortfolio/awesome-vibecoding-techstacks/issues/new?template=comparison-request.md) with:
- The technologies to compare (2-3 max)
- Why developers search for this comparison
- Key dimensions to compare

### 4. Suggest a Stack Combo

[Open an issue](https://github.com/JagadeepPortfolio/awesome-vibecoding-techstacks/issues/new?template=stack-combo.md) with:
- The use case (e.g., "Real-time collaboration app")
- Your recommended stack per layer
- Why each pick fits

### 5. Build a Comparison Page

Comparison pages live in `/compare/`. Each is a self-contained HTML file. To build one:

1. Copy an existing comparison (e.g., `compare/react-vs-vue-vs-svelte.html`) as a template
2. Update the content: title, meta tags, comparison table, verdicts, "when to pick each"
3. Include dark mode support:
   ```html
   <script>tailwind.config={darkMode:"class"}</script>
   <link rel="stylesheet" href="../dark-mode.css">
   <script src="../dark-mode.js"></script>
   ```
4. Add JSON-LD structured data
5. Submit a PR — we'll add it to the hub and sitemap

---

## Which File?

| Guide | File | Category Codes |
|-------|------|---------------|
| Frontend | `Frontend-Stacks-Visual-Guide.html` | `fw` (frameworks), `meta` (meta-frameworks), `style`, `state`, `data`, `form`, `build`, `test`, `ui`, `host` |
| Backend | `Backend-Stacks-Visual-Guide.html` | `lang`, `baas`, `host`, `db`, `auth`, `jobs`, `store`, `pay`, `email`, `obs` |
| AI/ML | `AIML-Stacks-Visual-Guide.html` | `llm`, `orch`, `vec`, `embed`, `rag`, `agent`, `ft`, `eval`, `infra`, `label` |
| AI Coding | `AI-Coding-Tools-Visual-Guide.html` | `editor`, `agent`, `vibe`, `review`, `test`, `design`, `docs`, `mcp`, `guard`, `ops` |
| DevOps | `DevOps-Stacks-Visual-Guide.html` | `ci`, `iac`, `container`, `cloud`, `monitor`, `sec`, `net`, `gitops`, `registry`, `platform` |
| Mobile | `Mobile-Stacks-Visual-Guide.html` | `xplat`, `native`, `ui`, `nav`, `state`, `backend`, `test`, `deploy`, `analytics`, `design` |
| Stack Combos | `Stack-Combos.html` | N/A (different format) |
| Comparisons | `compare/*.html` | N/A (standalone pages) |

---

## Guidelines

1. **Be objective.** Write pros AND cons. Every tool has tradeoffs.
2. **Be current.** This is a 2026 guide. Reference the latest versions and pricing.
3. **Be concise.** Summaries: 1-2 sentences. Pros/cons: short phrases.
4. **No marketing.** Describe what the tech actually does, not what its landing page says.
5. **Stage accuracy.** Don't put enterprise-only tools in "Hobby". Don't put toys in "Scale".
6. **Source your claims.** If you're updating pricing or benchmarks, link to the source.

## Code Style

- HTML files are intentionally self-contained (single file, no build step)
- Keep this simplicity — no frameworks, no npm, no build tools
- Tailwind classes for styling (CDN, not compiled)
- Vanilla JS for interactivity
- All pages must include dark mode support (`dark-mode.css` + `dark-mode.js`)

## Pull Request Process

1. Fork → Branch → Make changes
2. Test by opening the HTML file in a browser:
   - Mind map renders correctly
   - Cards display with all fields
   - Search works
   - Dark mode works
3. Submit a PR using the template
4. We review and merge quickly (usually within 24 hours)

## First Time Contributing to Open Source?

No worries! Look for issues labeled [`good first issue`](https://github.com/JagadeepPortfolio/awesome-vibecoding-techstacks/labels/good%20first%20issue). These are small, well-defined tasks perfect for getting started.

## Questions?

- [Start a discussion](https://github.com/JagadeepPortfolio/awesome-vibecoding-techstacks/discussions)
- [Open an issue](https://github.com/JagadeepPortfolio/awesome-vibecoding-techstacks/issues/new)
