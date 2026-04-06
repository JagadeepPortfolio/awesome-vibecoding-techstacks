# Contributing to TechStacks 2026

Thanks for your interest in contributing! This project aims to be the most useful, up-to-date reference for developers choosing their tech stack.

## How to Contribute

### Adding a New Technology

Each technology is an object in the `TECH` array inside the HTML file. Here's the format:

**Frontend** (`Frontend-Stacks-Visual-Guide.html`):
```js
{
  id: "unique-id",        // lowercase, no spaces
  name: "Display Name",   // as developers know it
  cat: "fw",              // category id (fw, meta, style, state, data, form, build, test, ui, host)
  summary: "One paragraph description. What it is, why it matters in 2026.",
  pros: ["Pro 1", "Pro 2", "Pro 3"],
  cons: ["Con 1", "Con 2"],
  bestFor: "When to use this",
  free: true,             // has a usable free tier?
  ts: true,               // TypeScript-first?
  prod: true,             // production-proven at scale?
  stages: ["hobby", "mvp", "growth", "scale"]  // which stages it fits
}
```

**Backend** (`Backend-Stacks-Visual-Guide.html`):
```js
{
  id: "unique-id",
  name: "Display Name",
  cat: "lang",            // category id (lang, baas, host, db, auth, jobs, store, pay, email, obs)
  summary: "One paragraph description.",
  pros: ["Pro 1", "Pro 2", "Pro 3"],
  cons: ["Con 1", "Con 2"],
  bestFor: "When to use this",
  free: true,             // has a usable free tier?
  self: true,             // self-hostable?
  prod: true,             // production-proven?
  stages: ["hobby", "mvp", "growth", "scale"]
}
```

### Updating Existing Tech

If pricing, features, or stages have changed, update the relevant fields and the `summary` text.

### Suggesting New Guide Categories

Open an issue with:
- The category name (e.g., "AI/ML Stacks")
- A list of 10+ technologies that should be included
- Proposed subcategories

## Guidelines

1. **Be objective.** Write pros AND cons. Every tool has tradeoffs.
2. **Be current.** This is a 2026 guide. Reference the latest versions.
3. **Be concise.** Summaries should be 1-2 sentences. Pros/cons should be short phrases.
4. **No marketing.** Describe what the tech actually does, not what the landing page says.
5. **Stage accuracy.** Don't put enterprise-only tools in "Hobby". Don't put toys in "Scale".

## Pull Request Process

1. Fork the repo
2. Make your changes
3. Test by opening the HTML file in a browser — make sure the mind map renders and cards display correctly
4. Submit a PR with:
   - What you added or changed
   - Why (is this a correction? new tech? pricing update?)
5. We'll review and merge quickly

## Code Style

- The HTML files are intentionally self-contained (single file, no build step)
- Keep this simplicity — no frameworks, no npm, no build tools
- Tailwind classes for styling
- Vanilla JS for interactivity

## Questions?

Open an issue or start a discussion. We're happy to help!
