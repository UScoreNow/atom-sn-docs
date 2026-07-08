# AGENTS.md — atom-sn-docs

Canonical entry file for AI agents. `CLAUDE.md` is a symlink to this file.

## What this repo is

Documentation-only repository for **AtomSN**, the design system of the UScoreNow
football-tournament app (Flutter, mobile-first, light/dark). It holds the system
specification: DTCG design tokens, per-topic docs, brand assets and an HTML preview.
The Flutter implementation lives in [`UScoreNow/atom-sn-flutter`](https://github.com/UScoreNow/atom-sn-flutter);
there is no application code here.

## Hard constraints (MUST / MUST NOT)

1. **`tokens/tokens.json` is the single source of truth.** Every hex value, token
   name and typographic decision MUST originate there; docs describe, tokens decide.
   Any token change MUST be reflected in the affected topic docs (both languages).
2. **Brand terms.** The system is named **AtomSN** (themes "AtomSN Light" /
   "AtomSN Dark"). The retired pre-rebrand system/theme names MUST NOT be
   reintroduced (see the Branding section of `CONSTRAINTS.md` for the exact list;
   `make check` enforces it). The color ramp `color.paper.*` is a color name, not
   a brand name — it MUST NOT be renamed (the Flutter repo consumes it).
3. **Bilingual docs.** Every human-facing doc exists as a `-es.md` (Spanish, for
   humans) and `-en.md` (English, canonical for humans and AI) pair. Editing one
   side MUST be mirrored in the other in the same change.
4. **Pure `#000000` and `#FFFFFF` are forbidden** anywhere in tokens or examples;
   darkest legal ink is `color.ink.900` (#0E0D0A), lightest paper `color.paper.50` (#FBF8F0).
5. **Components consume only semantic tokens** (`semantic.light.*` / `semantic.dark.*`),
   never base ramps directly. Docs and examples MUST follow this.
6. **One icon library:** Hugeicons, `strokeRounded` style.
7. **Additive git flow.** Work on `feature|fix|refactor|update/<name>` branches,
   PR to `dev`; `dev` → `main` triggers release-please. MUST NOT push to `main`/`dev`
   directly or delete releases/tags.

## How to run / verify

Docs-only repo — nothing to build. Verification:

```bash
make check   # tokens.json validity + forbidden-term/color lint + es/en pairing
```

Visual reference: open `preview/index.html` in a browser (deployed via GitHub Pages).

## Map (read on demand)

| Path | Read when… |
|---|---|
| `tokens/tokens.json` | any question about a concrete value — always authoritative |
| `colors/colors-en.md` | working with color ramps or semantic color mapping |
| `fonts/typography-en.md` | typography scale, families, `text.*` compositions |
| `icons/icons-en.md` | icon system, Hugeicons naming |
| `spacing/spacing-en.md` | spacing scale, radii, border rules |
| `editorial/editorial-en.md` | editorial devices: hairlines, kickers, dotted leaders, ink stamps |
| `CONSTRAINTS.md` | before changing tokens or docs structure |
| `PROGRESS.md` | current state of each chapter |
| `README-en.md` / `README-es.md` | human-oriented overview |

## Current work signals

See `PROGRESS.md`. Releases are automated by release-please on `main`.
