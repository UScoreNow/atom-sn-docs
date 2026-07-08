# AtomSN — Design System · AtomSN editorial theme

> Language: English (canonical for AI agents). Versión en español: [README-es.md](README-es.md)

> **Version:** 2.0
> **Status:** In development
> **Platform:** Flutter · mobile-first · with Flutter Web support
> **Modes:** light ("AtomSN Light") · dark ("AtomSN Dark")
> **Stack:** Dart / Flutter · Hugeicons · ElmsSans (sans)

Design system for the football tournament management app UScoreNow. It evolves the minimalist v1 system toward the feel of a **real sports newspaper**: a cream paper-like base on which warm ink is printed, with grass green and ink black as the only accents. Content —scores, standings, match reports— rules; the editorial toolkit (hairline rules, uppercase kickers, dotted leaders, tabular figures, ink stamps) gives it a press voice without chromatic noise.

---

## General principles

Hard constraints of the system. They apply to every file and every implementation decision:

- **Ink on paper.** The base is paper-like cream (`color.paper.*`); text and highlights are warm ink (`color.ink.*`). There are no cool grays.
- **Pure blacks and whites forbidden.** `#000000` and `#FFFFFF` are banned. The darkest legal black is `color.ink.900` `#0E0D0A`; the lightest paper, `color.paper.50` `#FBF8F0`.
- **Green is scarce.** `color.green.*` is reserved for actions, active/selected states and positive deltas. Never as decorative fill.
- **Fill vs. text.** The `*.500` tokens (green/yellow/red) are FILL/ICON tokens; their `*.700`/`*.800` are the TEXT ones on paper (AA compliant). In dark, status text uses lighter variants (`*.300`/`*.400`).
- **Semantic tokens in product.** Base tokens are the foundational layer; components consume ONLY semantic tokens (`semantic.light.*` / `semantic.dark.*`).
- **One icon library.** Only `Hugeicons`, `strokeRounded` style as the mandatory base.
- **One exception, one explicit rule.** Consistency over expressiveness: one semantics → one visual resource. Every deviation is documented as a bounded exception (see below).

---

## Exceptions to hard rules

The historical system imposed two invariants that v2 breaks in an **explicit and bounded** way:

- **Second type family (serif).** v1 required a single family. v2 adds `Libre Caslon Display` as a **documented exception**, restricted to `masthead`, `headline` and `display` headlines. It is **never** used below 20px, nor in body, UI, labels, captions or stats: all of that remains `ElmsSans`. The serif only has weight 400; it is used at large sizes, where Caslon's high contrast already provides presence.
- **Ink black `ink.900` allowed.** v1 treated black as unreachable. v2 enables `color.ink.900` `#0E0D0A` for highlights, stamps ("FINAL") and mastheads. **This does not lift the ban on pure `#000000`**, which remains forbidden: `ink.900` is the darkest legal black, not absolute black.

---

## Artifact index

```
atom-sn-design-system/
├── tokens/
│   └── tokens.json       # FUENTE ÚNICA DE VERDAD (formato DTCG). Color, tipografía,
│                         #   espaciado, radios, reglas. Toda decisión sale de aquí.
├── colors/
│   └── colors.md         # Rampas paper/ink/green/yellow/red/indigo + semánticos light/dark
├── fonts/
│   └── typography.md     # Duotono serif/sans, escala, composiciones text.*, cifras tabulares
├── icons/
│   └── icons.md          # Sistema iconográfico con Hugeicons (strokeRounded)
├── spacing/
│   └── spacing.md        # Escala 4px, padding, gap, radios (radius.none editorial)
├── editorial/            # Capítulo nuevo: reglas hairline/section, kickers/overlines,
│                         #   líderes punteados, highlight marker, sellos de tinta
├── preview/
│   └── index.html        # Preview HTML del sistema para inspección en navegador
└── assets/
    └── fonts/
        └── elms_sans/    # ElmsSans variable (Regular + Italic) · OFL.txt
```

> Status: `colors/`, `fonts/`, `icons/`, `spacing/` and `tokens/` are populated. `editorial/` and `preview/` are directories of the target structure, under construction. `Libre Caslon Display` (serif, w400) is resolved via system font/CDN; only `ElmsSans` is versioned in `assets/fonts/`.

> **Documentation-only repo.** The system specification lives here (DTCG tokens, docs, brand, preview). The **Flutter implementation** (theme and components derived from `tokens.json`) lives in the code repo [`UScoreNow/atom-sn`](https://github.com/UScoreNow/atom-sn).

---

## System sections

### Colors

Editorial color system: **cream paper** as the structural base, **warm ink** for text, **grass green** and **ink black** as the only accents.

- **Paper** (`color.paper.50` `#FBF8F0` → `color.paper.900` `#2B2820`): backgrounds, surfaces, borders and hairline rules.
- **Ink** (`color.ink.50` `#6E6A60` → `color.ink.900` `#0E0D0A`, plus `color.ink.bg` `#16140F` for the dark background): text, section rules and stamps.
- **Green** (`color.green.500` `#3E8E45`): primary action and active states. `green.700` `#27592C` for text/links on paper (AA).
- **Status**: `red` (live/error), `yellow` (card/warning + highlight marker), `indigo` (only `status.info`, scarce use inherited from v1).
- **Highlight marker**: `highlight.mark` → `yellow.100` wash behind key stats/records.
- Semantics with explicit light ("AtomSN Light") / dark ("AtomSN Dark") mapping.

Convention: `color.{familia}.{escala}` (base) · `color.{categoría}.{rol}` and `text.{grupo}.{nivel}` (semantic).

→ [Color documentation](colors/colors-en.md)

---

### Typography

**Duotone** system: editorial serif for headlines, sans for everything else.

| Family | Token | Usage |
|---|---|---|
| `Libre Caslon Display` | `font.family.serif` | Only masthead/headline/display headlines. Weight 400. Never <20px nor in body. |
| `ElmsSans` (variable) | `font.family.sans` | Body, UI, labels, captions, stats (tabular figures). |

- **Tabular figures mandatory** in scoreboards, minutes and stats (`tabular: true` in `display.*`, `stat.*`).
- **Overline/kicker** (`text.overline`): uppercase, tracking `0.08em` → "GRUPO A", "EN VIVO", "JORNADA 12".
- Scale from `font.size.sm` (12px) to `font.size.7xl` (60px); weights `regular` (400) to `black` (900).

Convention: `font.{categoría}.{nivel}` (base) · `text.{grupo}.{nivel}` (compositions).

→ [Typography documentation](fonts/typography-en.md)

---

### Iconography

Single library: **Hugeicons** (`package:hugeicons/hugeicons.dart`), `strokeRounded` style. Base size `24.0`, stroke `1.5`. Selected state differentiated by color, not by style.

Convention: `icon.{dominio}.{nombre}` — e.g. `icon.navigation.home`, `icon.status.live`.

→ [Icon documentation](icons/icons-en.md)

---

### Spacing

Scale in multiples of 4px for padding, gap, margins and radii.

| Token | Value | Usage |
|---|---|---|
| `space.2` | 8px | Compact internal spacing |
| `space.4` | 16px | Base component padding |
| `space.6` | 24px | Separation between sections |
| `radius.none` | 0px | Rules, stamps, tables: straight editorial edge |
| `radius.md` | 12px | Standard card corner |
| `border.hairline` | 1px | Thin editorial rule (`paper.300`) |
| `border.section` | 2px | Section rule below masthead (`ink.500`) |

The newspaper prefers straight corners: `radius.none` for rules, stamps and tables; `radius.md` remains the card standard.

Convention: `space.{n}` (multiples of 4) · `radius.{nivel}` · `border.{grosor}`.

→ [Spacing documentation](spacing/spacing-en.md)

---

### Editorial

New v2 chapter with the press toolkit: hairline and section rules/edges, uppercase kickers/overlines, dotted leaders (`paper.400`) in standings tables, "marker" highlight (`highlight.mark`), tabular figures and `ink.900` ink stamps ("FINAL"). Under construction in `editorial/`.

---

## How to consume

### Flutter (product)

Use the generated theme in `lib/theme/` and register the fonts in `pubspec.yaml`:

```yaml
# pubspec.yaml
flutter:
  fonts:
    - family: ElmsSans
      fonts:
        - asset: assets/fonts/elms_sans/ElmsSans-VariableFont.ttf
        - asset: assets/fonts/elms_sans/ElmsSans-Italic-VariableFont.ttf
          style: italic
  # Libre Caslon Display (serif, w400): vía google_fonts o fuente del sistema.
```

```dart
// main.dart
MaterialApp(
  theme: UScoreTheme.light,      // "AtomSN Light"
  darkTheme: UScoreTheme.dark,   // "AtomSN Dark"
);
```

### Web / other platforms

Consume `tokens/tokens.json` (DTCG format) directly or via a transformation pipeline (Style Dictionary or another) to emit CSS custom properties, JS, etc. `preview/index.html` serves as a quick visual reference in the browser.

---

> **Single source of truth:** `tokens/tokens.json`. No hex value, token name or typographic decision lives outside of it. The documentation describes; the tokens decide.

## Contributing

This repository follows the [UScoreNow contribution guidelines](https://github.com/UScoreNow/.github/blob/main/CONTRIBUTING.md): branching model, Conventional Commits, pull requests and releases.
