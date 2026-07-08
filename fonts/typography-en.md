# Typographic System — UScoreNow (AtomSN editorial theme)

> Language: English (canonical for AI agents). Versión en español: [typography-es.md](typography-es.md)

> **Version:** 2.1 · **Platform:** Flutter (mobile-first + web) · **Model:** SINGLE FAMILY (ElmsSans)

## Visual direction

The system keeps the **sports-newspaper voice**: a paper page (warm cream)
printed with warm ink, crisp editorial hierarchy. That hierarchy comes from the rhythm of
size, weight, line height and tracking on a **single typeface family, ElmsSans**.

The header set (masthead, story headlines) and the interface apparatus (body, data,
scoreboards) share the same family; the difference in voice comes from the large size and
tight tracking of the headlines versus the tabular, neutral reading of everything else.

> Change from 2.0: the system unified typography on ElmsSans. The header serif
> (Libre Caslon Display, via `google_fonts`) was retired. The token
> `font.family.serif` remains as a historical alias and resolves to ElmsSans.

---

## The single family

The system uses one family, defined in `font.family.*` of `tokens.json`:

| Token | Family | Stack | Use |
|---|---|---|---|
| `font.family.sans` | **ElmsSans** | `["ElmsSans", "sans-serif"]` | Entire system |
| `font.family.serif` | **ElmsSans** (alias) | `["ElmsSans", "sans-serif"]` | Historical header alias; resolves to ElmsSans w400 |

### Distribution by hierarchy (not by family)

- **Header (`text.masthead.*`, `text.headline.*`)** — ElmsSans at weight **400 (regular)**,
  sizes ≥20px, with tight tracking on the masthead (`tight -0.02em`) and normal on headlines.
  The large size and the tracking give the nameplate its "printed" presence.
- **Interface and data** — ElmsSans everywhere else: card and UI titles (`text.title.*`),
  body (`text.body.*`), labels (`text.label.*`), overlines/kickers (`text.overline`),
  captions (`text.caption`), statistics (`text.stat.*`) and display scoreboards
  (`text.display.*`). Scoreboards and stats use **tabular figures**.

Operating rule: one single family (ElmsSans); hierarchy is built with size, weight,
line height and tracking. No other families are allowed.

---

## Font registration

ElmsSans is the only family and is registered locally from assets (variable, with italic).
There is no longer a dependency on `google_fonts`.

### ElmsSans — local from assets (variable, with italic)

Files in `assets/fonts/elms_sans/` (OFL license included in `OFL.txt`):

- `ElmsSans-VariableFont.ttf`
- `ElmsSans-Italic-VariableFont.ttf`

Registration in `pubspec.yaml`:

```yaml
flutter:
  fonts:
    - family: ElmsSans
      fonts:
        - asset: assets/fonts/elms_sans/ElmsSans-VariableFont.ttf
        - asset: assets/fonts/elms_sans/ElmsSans-Italic-VariableFont.ttf
          style: italic
```

> **Variable font:** by registering the variable font without declaring `weight`, Flutter accepts
> any `FontWeight` (including intermediate ones like `FontWeight.w450`) and the font
> interpolates the stroke. There is no need to register static per-weight files.

---

## Base scale

Raw values from `tokens.json` (`font.*`). They are not used directly in components; they are
composed via `text.*`.

### `font.family`

| Token | Value |
|---|---|
| `font.family.sans` | `["ElmsSans", "sans-serif"]` — entire system |
| `font.family.serif` | `["ElmsSans", "sans-serif"]` — historical alias, resolves to ElmsSans |

### `font.size`

| Token | Value |
|---|---|
| `font.size.sm` | 12px |
| `font.size.md` | 14px |
| `font.size.lg` | 16px |
| `font.size.xl` | 18px |
| `font.size.2xl` | 20px |
| `font.size.3xl` | 24px |
| `font.size.4xl` | 32px |
| `font.size.5xl` | 40px |
| `font.size.6xl` | 48px |
| `font.size.7xl` | 60px |

### `font.weight`

| Token | Value |
|---|---|
| `font.weight.regular` | 400 |
| `font.weight.medium` | 500 |
| `font.weight.semibold` | 600 |
| `font.weight.bold` | 700 |
| `font.weight.extrabold` | 800 |
| `font.weight.black` | 900 |

> ElmsSans (variable) covers all weights `400`–`900`. The header uses `400`;
> `800`/`900` are reserved for high-impact display figures (`display.score`, `stat`).

### `font.lineHeight`

| Token | Value |
|---|---|
| `font.lineHeight.tight` | 1.1 |
| `font.lineHeight.snug` | 1.25 |
| `font.lineHeight.normal` | 1.5 |
| `font.lineHeight.relaxed` | 1.65 |

### `font.tracking`

| Token | Value | Use |
|---|---|---|
| `font.tracking.tight` | -0.02em | large headlines and compact figures |
| `font.tracking.normal` | 0em | general use |
| `font.tracking.wide` | 0.02em | labels and uppercase text |
| `font.tracking.xwide` | 0.06em | wide metadata/categories |
| `font.tracking.kicker` | **0.08em** | uppercase overline/kicker (`text.overline`) |

---

## Semantic compositions `text.*`

Exact compositions from `tokens.json`. Components consume ONLY these. The entire
`fam` column is ElmsSans. `tab` = mandatory tabular figures. `upper` = uppercase
transform.

| Token | fam | size | weight | lineHeight | tracking | tab | upper | Use |
|---|---|---|---|---|---|---|---|---|
| `text.masthead.xl` | ElmsSans | 7xl / 60px | 400 | tight 1.1 | tight -0.02em | — | — | screen/section nameplate |
| `text.masthead.lg` | ElmsSans | 4xl / 32px | 400 | snug 1.25 | tight -0.02em | — | — | secondary masthead |
| `text.headline.xl` | ElmsSans | 4xl / 32px | 400 | snug 1.25 | normal 0em | — | — | editorial/story headline |
| `text.headline.lg` | ElmsSans | 3xl / 24px | 400 | snug 1.25 | normal 0em | — | — | minor headline |
| `text.display.score` | ElmsSans | 7xl / 60px | 800 | tight 1.1 | tight -0.02em | yes | — | main match scoreboard |
| `text.display.stat` | ElmsSans | 5xl / 40px | 700 | tight 1.1 | tight -0.02em | yes | — | display stat figure |
| `text.title.lg` | ElmsSans | 2xl / 20px | 600 | snug 1.25 | normal 0em | — | — | card / data title |
| `text.title.md` | ElmsSans | xl / 18px | 500 | normal 1.5 | normal 0em | — | — | subtitle / list header |
| `text.body.lg` | ElmsSans | lg / 16px | 400 | normal 1.5 | — | — | — | main body, descriptions |
| `text.body.md` | ElmsSans | md / 14px | 400 | normal 1.5 | — | — | — | standard interface — the most frequent |
| `text.body.sm` | ElmsSans | sm / 12px | 400 | normal 1.5 | — | — | — | auxiliary text, metadata |
| `text.label.lg` | ElmsSans | md / 14px | 500 | tight 1.1 | — | — | — | button/control/nav labels |
| `text.label.md` | ElmsSans | sm / 12px | 500 | tight 1.1 | — | — | — | chips, badges, compact labels |
| `text.overline` | ElmsSans | sm / 12px | 600 | tight 1.1 | kicker 0.08em | — | **yes** | kicker: "GRUPO A", "EN VIVO", "JORNADA 12" |
| `text.stat.lg` | ElmsSans | 3xl / 24px | 700 | tight 1.1 | tight -0.02em | yes | — | medium stat in summary cards |
| `text.stat.md` | ElmsSans | xl / 18px | 600 | tight 1.1 | normal 0em | yes | — | stat in lists/table rows |
| `text.caption` | ElmsSans | sm / 12px | 400 | normal 1.5 | — | — | — | photo caption, brief editorial note |

Composition notes:

- **Header (`masthead.*`, `headline.*`)** at weight 400; presence comes from size and
  tracking, not from boldness.
- **`tabular: true`** is mandatory on `display.score`, `display.stat`, `stat.lg` and
  `stat.md`: scoreboards, minutes and stats must align digits in columns (see Flutter,
  `FontFeature.tabularFigures()`).
- **`text.overline`** is the only one with `transform: uppercase` and uses `tracking.kicker`
  0.08em. It is the system's editorial kicker.
- `text.headline.*` shares its size with `masthead.lg` (32px) but uses `tracking.normal`
  instead of `tight`: the masthead tightens, the headline breathes.

---

## Flutter integration

Mapping from `text.*` to `TextStyle`. A single family path: `fontFamily: 'ElmsSans'`.

> **`letterSpacing`** in Flutter is in logical pixels, not in `em`. Formula:
> `em_value × fontSize`. E.g.: `-0.02em` at 60px → `-1.2`; `0.08em` at 12px → `0.96`.

> **Tabular figures:** compositions marked `tab` require
> `fontFeatures: [FontFeature.tabularFigures()]` so digits do not "dance" when the
> score changes.

### Example TextStyle

```dart
import 'package:flutter/material.dart';

// text.masthead.xl — ElmsSans w400, tight tracking
const TextStyle mastheadXl = TextStyle(
  fontFamily: 'ElmsSans',
  fontSize: 60,
  fontWeight: FontWeight.w400,
  height: 1.1,                 // lineHeight.tight
  letterSpacing: -1.2,         // -0.02em x 60px
);

// text.headline.xl — story headline
const TextStyle headlineXl = TextStyle(
  fontFamily: 'ElmsSans',
  fontSize: 32,
  fontWeight: FontWeight.w400,
  height: 1.25,                // lineHeight.snug
  letterSpacing: 0,            // tracking.normal
);

// text.body.md — the most frequent
const TextStyle bodyMd = TextStyle(
  fontFamily: 'ElmsSans',
  fontSize: 14,
  fontWeight: FontWeight.w400,
  height: 1.5,                 // lineHeight.normal
  letterSpacing: 0,
);

// text.display.score — scoreboard with tabular figures
const TextStyle displayScore = TextStyle(
  fontFamily: 'ElmsSans',
  fontSize: 60,
  fontWeight: FontWeight.w800,
  height: 1.1,
  letterSpacing: -1.2,         // -0.02em x 60px
  fontFeatures: [FontFeature.tabularFigures()],
);

// text.overline — uppercase kicker (apply the uppercase to the String)
const TextStyle overline = TextStyle(
  fontFamily: 'ElmsSans',
  fontSize: 12,
  fontWeight: FontWeight.w600,
  height: 1.1,
  letterSpacing: 0.96,         // 0.08em x 12px (tracking.kicker)
);
// usage: Text('GRUPO A', style: overline)  // the uppercase transform is applied to the text
```

### Recommended TextTheme

All slots use ElmsSans; the header slots (`displayLarge`, `headlineLarge/Medium`)
at weight 400, and the figure slots (`displayMedium` = score) carry tabular `fontFeatures`.
The actual implementation lives in `lib/theme/app_typography.dart`.

```dart
import 'package:flutter/material.dart';

const _tabular = [FontFeature.tabularFigures()];

const TextTheme appTextTheme = TextTheme(
  // --- Header: masthead + headline (ElmsSans w400) ---
  displayLarge: TextStyle(
    fontFamily: 'ElmsSans', fontSize: 60, fontWeight: FontWeight.w400,
    height: 1.1, letterSpacing: -1.2),
  headlineLarge: TextStyle(
    fontFamily: 'ElmsSans', fontSize: 32, fontWeight: FontWeight.w400,
    height: 1.25, letterSpacing: 0),
  headlineMedium: TextStyle(
    fontFamily: 'ElmsSans', fontSize: 24, fontWeight: FontWeight.w400,
    height: 1.25, letterSpacing: 0),

  // --- Figure display (tabular) ---
  displayMedium: TextStyle(
    fontFamily: 'ElmsSans', fontSize: 60, fontWeight: FontWeight.w800,
    height: 1.1, letterSpacing: -1.2, fontFeatures: _tabular),
  displaySmall: TextStyle(
    fontFamily: 'ElmsSans', fontSize: 40, fontWeight: FontWeight.w700,
    height: 1.1, letterSpacing: -0.8, fontFeatures: _tabular),

  // --- UI titles ---
  titleLarge: TextStyle(
    fontFamily: 'ElmsSans', fontSize: 20, fontWeight: FontWeight.w600, height: 1.25),
  titleMedium: TextStyle(
    fontFamily: 'ElmsSans', fontSize: 18, fontWeight: FontWeight.w500, height: 1.5),

  // --- Body ---
  bodyLarge: TextStyle(
    fontFamily: 'ElmsSans', fontSize: 16, fontWeight: FontWeight.w400, height: 1.5),
  bodyMedium: TextStyle(
    fontFamily: 'ElmsSans', fontSize: 14, fontWeight: FontWeight.w400, height: 1.5),
  bodySmall: TextStyle(
    fontFamily: 'ElmsSans', fontSize: 12, fontWeight: FontWeight.w400, height: 1.5),

  // --- Labels ---
  labelLarge: TextStyle(
    fontFamily: 'ElmsSans', fontSize: 14, fontWeight: FontWeight.w500, height: 1.1),
  labelMedium: TextStyle(
    fontFamily: 'ElmsSans', fontSize: 12, fontWeight: FontWeight.w500, height: 1.1),
  labelSmall: TextStyle(
    fontFamily: 'ElmsSans', fontSize: 12, fontWeight: FontWeight.w600,
    height: 1.1, letterSpacing: 0.96),
);
```

> Material `TextTheme` has 15 slots and the system defines 17 compositions.
> `text.masthead.lg`, `text.stat.lg` and `text.stat.md` have no direct slot: define them
> as reusable `TextStyle`s or as a theme extension; do not force them into semantically
> unrelated slots.

---

## Composition criteria

The system reads like a **sports newspaper** with a single, well-graded typographic
voice: a header with presence (large ElmsSans, tight tracking) and a quiet, precise
working body (ElmsSans for reading and data). Coherence is maintained by the
hierarchy, not by mixing families:

- The header "speaks" in the masthead and headline: it appears rarely and large, at weight 400.
- Everything else takes care of the figures: scoreboards, minutes and stats are set in tabular
  ElmsSans to align in columns and not jump when updating.
- The kicker (`text.overline`, uppercase, `tracking.kicker` 0.08em) labels sections and
  states ("EN VIVO", "JORNADA 12").

The personality comes from hierarchy on a single family. Everything is ElmsSans.
