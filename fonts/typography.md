# Sistema Tipográfico — UScoreNow (tema editorial "newsprint")

> **Versión:** 2.0 · **Plataforma:** Flutter (mobile-first + web) · **Modelo:** DUOTONO (serif editorial + sans utilitaria)

## Dirección visual

La v2 lleva el sistema de una sans neutra a una **voz de periódico deportivo**. La página es papel (crema cálido) impreso con tinta cálida; la jerarquía editorial nace del contraste entre dos voces tipográficas con repartos estrictos:

- **Serif de cabecera** — el masthead y los titulares de crónica con la presencia de alto contraste de una Caslon de prensa.
- **Sans utilitaria** — todo el aparato de interfaz, cuerpo, datos y marcadores, donde mandan la legibilidad y las cifras tabulares.

La serif aporta la voz "impresa" del nameplate y los headlines; la sans sostiene la lectura, los controles y los datos numéricos. La personalidad ya no viene solo del ritmo de pesos y tamaños (como en v1), sino del **duotono** serif/sans bien acotado.

---

## Las dos familias y su reparto

El sistema usa exactamente dos familias, definidas en `font.family.*` de `tokens.json`:

| Token | Familia | Stack | Uso permitido |
|---|---|---|---|
| `font.family.serif` | **Libre Caslon Display** | `["Libre Caslon Display", "Georgia", "serif"]` | SOLO masthead, headline y display de titulares |
| `font.family.sans` | **ElmsSans** | `["ElmsSans", "sans-serif"]` | Cuerpo, UI, labels, captions, stats y marcadores |

### Reparto estricto

- **Serif (Libre Caslon Display)** se usa ÚNICAMENTE en `text.masthead.*` y `text.headline.*`.
  - Nunca por debajo de **20px**. El contraste fino de la Caslon Display se rompe a tamaño pequeño; está pensada para titulares grandes donde ese contraste da presencia.
  - Nunca en cuerpo de texto, labels, captions, controles ni datos.
  - Único peso disponible: **400 (regular)**. La Caslon Display no trae más pesos; a tamaño grande, su contraste de trazo ya aporta el peso visual, así que no se necesitan ni se simulan negritas.
- **Sans (ElmsSans)** se usa en TODO lo demás: títulos de card y UI (`text.title.*`), cuerpo (`text.body.*`), labels (`text.label.*`), overlines/kickers (`text.overline`), captions (`text.caption`), estadísticas (`text.stat.*`) y los marcadores display (`text.display.*`). Los marcadores y stats permanecen en sans precisamente porque necesitan **cifras tabulares**, que la serif no garantiza.

### La excepción documentada a la regla de "una sola familia"

El sistema v1 imponía una **familia única** (Elms Sans) y construía toda la jerarquía con tamaño, peso, interlineado y tracking. La v2 introduce una segunda familia, la serif, como **excepción explícita y acotada**, no como apertura a mezclar fuentes libremente:

- La serif existe para la **voz editorial de cabecera**: nameplate y titulares. Es lo que convierte la app en "periódico" y no en otra UI sans.
- Está limitada a dos grupos semánticos (`masthead`, `headline`) y a tamaños ≥20px.
- La sans sigue siendo la familia de trabajo: todo el producto funcional se compone con ElmsSans.

Regla operativa: **si un texto no es masthead ni headline, es sans**. No se admiten otras familias ni otros usos de la serif fuera de los tokens listados.

---

## Registro de fuentes

Las dos familias se registran por vías distintas: ElmsSans es local (assets), Libre Caslon Display se resuelve en runtime vía `google_fonts`.

### ElmsSans — local desde assets (variable, con italic)

Archivos en `assets/fonts/elms_sans/` (licencia OFL incluida en `OFL.txt`):

- `ElmsSans-VariableFont.ttf`
- `ElmsSans-Italic-VariableFont.ttf`

Registro en `pubspec.yaml`:

```yaml
flutter:
  fonts:
    - family: ElmsSans
      fonts:
        - asset: assets/fonts/elms_sans/ElmsSans-VariableFont.ttf
        - asset: assets/fonts/elms_sans/ElmsSans-Italic-VariableFont.ttf
          style: italic
```

> **Fuente variable:** al registrar el variable font sin declarar `weight`, Flutter acepta cualquier `FontWeight` (incluidos intermedios como `FontWeight.w450`) y la fuente interpola el trazo. No hace falta registrar archivos estáticos por peso.

### Libre Caslon Display — paquete google_fonts en runtime

La serif NO se empaqueta como asset; se sirve vía el paquete `google_fonts`, que la descarga y cachea en runtime. En `pubspec.yaml`:

```yaml
dependencies:
  google_fonts: ^6.2.1
```

Se consume con `GoogleFonts.libreCaslonDisplay(...)` (ver sección Flutter). El stack de fallback (`Georgia`, `serif`) cubre el primer frame antes de que la fuente esté disponible.

---

## Escala base

Valores crudos de `tokens.json` (`font.*`). No se usan directamente en componentes; se componen vía `text.*`.

### `font.family`

| Token | Valor |
|---|---|
| `font.family.serif` | `["Libre Caslon Display", "Georgia", "serif"]` — SOLO masthead/headline, ≥20px, w400 |
| `font.family.sans` | `["ElmsSans", "sans-serif"]` — todo lo demás, con cifras tabulares en stats |

### `font.size`

| Token | Valor |
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

| Token | Valor |
|---|---|
| `font.weight.regular` | 400 |
| `font.weight.medium` | 500 |
| `font.weight.semibold` | 600 |
| `font.weight.bold` | 700 |
| `font.weight.extrabold` | 800 |
| `font.weight.black` | 900 |

> La serif solo admite `400`. Los pesos `500`–`900` aplican únicamente a ElmsSans. `800`/`900` quedan para cifras display de alto impacto (`display.score`, `stat`).

### `font.lineHeight`

| Token | Valor |
|---|---|
| `font.lineHeight.tight` | 1.1 |
| `font.lineHeight.snug` | 1.25 |
| `font.lineHeight.normal` | 1.5 |
| `font.lineHeight.relaxed` | 1.65 |

### `font.tracking`

| Token | Valor | Uso |
|---|---|---|
| `font.tracking.tight` | -0.02em | titulares grandes y cifras compactas |
| `font.tracking.normal` | 0em | uso general |
| `font.tracking.wide` | 0.02em | labels y texto en mayúsculas |
| `font.tracking.xwide` | 0.06em | metadata/categorías amplias |
| `font.tracking.kicker` | **0.08em** | overline/kicker en mayúsculas (`text.overline`) |

---

## Composiciones semánticas `text.*`

Composiciones exactas de `tokens.json`. Los componentes consumen SOLO estas. `fam` indica familia (serif = Libre Caslon Display w400; sans = ElmsSans). `tab` = cifras tabulares obligatorias. `upper` = transform uppercase.

| Token | fam | size | weight | lineHeight | tracking | tab | upper | Uso |
|---|---|---|---|---|---|---|---|---|
| `text.masthead.xl` | serif | 6xl / 60px | 400 | tight 1.1 | tight -0.02em | — | — | nameplate de pantalla/sección |
| `text.masthead.lg` | serif | 4xl / 32px | 400 | snug 1.25 | tight -0.02em | — | — | masthead secundario |
| `text.headline.xl` | serif | 4xl / 32px | 400 | snug 1.25 | normal 0em | — | — | titular editorial/crónica |
| `text.headline.lg` | serif | 3xl / 24px | 400 | snug 1.25 | normal 0em | — | — | titular menor |
| `text.display.score` | sans | 7xl / 60px | 800 | tight 1.1 | tight -0.02em | sí | — | marcador principal de partido |
| `text.display.stat` | sans | 5xl / 40px | 700 | tight 1.1 | tight -0.02em | sí | — | cifra display de stat |
| `text.title.lg` | sans | 2xl / 20px | 600 | snug 1.25 | normal 0em | — | — | título de card / dato (UI sans) |
| `text.title.md` | sans | xl / 18px | 500 | normal 1.5 | normal 0em | — | — | subtítulo / encabezado de lista |
| `text.body.lg` | sans | lg / 16px | 400 | normal 1.5 | — | — | — | cuerpo principal, descripciones |
| `text.body.md` | sans | md / 14px | 400 | normal 1.5 | — | — | — | interfaz estándar — el más frecuente |
| `text.body.sm` | sans | sm / 12px | 400 | normal 1.5 | — | — | — | texto auxiliar, metadatos |
| `text.label.lg` | sans | md / 14px | 500 | tight 1.1 | — | — | — | labels de botones/controles/nav |
| `text.label.md` | sans | sm / 12px | 500 | tight 1.1 | — | — | — | chips, badges, etiquetas compactas |
| `text.overline` | sans | sm / 12px | 600 | tight 1.1 | kicker 0.08em | — | **sí** | kicker: "GRUPO A", "EN VIVO", "JORNADA 12" |
| `text.stat.lg` | sans | 3xl / 24px | 700 | tight 1.1 | tight -0.02em | sí | — | stat mediana en cards de resumen |
| `text.stat.md` | sans | xl / 18px | 600 | tight 1.1 | normal 0em | sí | — | stat en listas/filas de tabla |
| `text.caption` | sans | sm / 12px | 400 | normal 1.5 | — | — | — | pie de foto, nota editorial breve |

Notas de composición:

- **serif solo en `masthead.*` y `headline.*`**, siempre ≥20px y peso 400. El resto es sans sin excepción.
- **`tabular: true`** es obligatorio en `display.score`, `display.stat`, `stat.lg` y `stat.md`: marcadores, minutos y stats deben alinear cifras en columna (ver Flutter, `FontFeature.tabularFigures()`).
- **`text.overline`** es el único con `transform: uppercase` y usa `tracking.kicker` 0.08em. Es el kicker editorial del sistema.
- `text.headline.*` comparte tamaño con `masthead.lg` (32px) pero con `tracking.normal` en vez de `tight`: el masthead aprieta, el titular respira.

---

## Integración Flutter

Mapeo de `text.*` a `TextStyle`. Dos vías de familia: `GoogleFonts.libreCaslonDisplay(...)` para serif, `fontFamily: 'ElmsSans'` para sans.

> **`letterSpacing`** en Flutter va en píxeles lógicos, no en `em`. Fórmula: `valor_em × fontSize`. Ej.: `-0.02em` a 60px → `-1.2`; `0.08em` a 12px → `0.96`.

> **Cifras tabulares:** las composiciones marcadas `tab` exigen `fontFeatures: [FontFeature.tabularFigures()]` para que los dígitos no "bailen" al cambiar el marcador.

### TextStyle de ejemplo

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// text.masthead.xl — serif vía google_fonts, w400
final TextStyle mastheadXl = GoogleFonts.libreCaslonDisplay(
  fontSize: 60,
  fontWeight: FontWeight.w400, // único peso de Libre Caslon Display
  height: 1.1,                 // lineHeight.tight
  letterSpacing: -1.2,         // -0.02em x 60px
);

// text.headline.xl — serif, titular de crónica
final TextStyle headlineXl = GoogleFonts.libreCaslonDisplay(
  fontSize: 32,
  fontWeight: FontWeight.w400,
  height: 1.25,                // lineHeight.snug
  letterSpacing: 0,            // tracking.normal
);

// text.body.md — sans local, el más frecuente
const TextStyle bodyMd = TextStyle(
  fontFamily: 'ElmsSans',
  fontSize: 14,
  fontWeight: FontWeight.w400,
  height: 1.5,                 // lineHeight.normal
  letterSpacing: 0,
);

// text.display.score — marcador con cifras tabulares
const TextStyle displayScore = TextStyle(
  fontFamily: 'ElmsSans',
  fontSize: 60,
  fontWeight: FontWeight.w800,
  height: 1.1,
  letterSpacing: -1.2,         // -0.02em x 60px
  fontFeatures: [FontFeature.tabularFigures()],
);

// text.stat.md — stat de tabla, tabular
const TextStyle statMd = TextStyle(
  fontFamily: 'ElmsSans',
  fontSize: 18,
  fontWeight: FontWeight.w600,
  height: 1.1,
  letterSpacing: 0,
  fontFeatures: [FontFeature.tabularFigures()],
);

// text.overline — kicker en mayúsculas (aplicar el uppercase en el String)
const TextStyle overline = TextStyle(
  fontFamily: 'ElmsSans',
  fontSize: 12,
  fontWeight: FontWeight.w600,
  height: 1.1,
  letterSpacing: 0.96,         // 0.08em x 12px (tracking.kicker)
);
// uso: Text('GRUPO A', style: overline)  // el transform uppercase se aplica al texto
```

### TextTheme recomendado

Las ranuras de cabecera (`displayLarge`, `headlineLarge/Medium`) usan la serif; el resto, ElmsSans. Material no permite mezclar familias dentro de una sola `TextStyle`, así que cada ranura declara la suya. Las ranuras de cifras (`displayMedium` = score) llevan `fontFeatures` tabular.

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _tabular = [FontFeature.tabularFigures()];

final TextTheme appTextTheme = TextTheme(
  // --- Serif: masthead + headline ---
  // text.masthead.xl
  displayLarge: GoogleFonts.libreCaslonDisplay(
    fontSize: 60, fontWeight: FontWeight.w400, height: 1.1, letterSpacing: -1.2),
  // text.headline.xl
  headlineLarge: GoogleFonts.libreCaslonDisplay(
    fontSize: 32, fontWeight: FontWeight.w400, height: 1.25, letterSpacing: 0),
  // text.headline.lg
  headlineMedium: GoogleFonts.libreCaslonDisplay(
    fontSize: 24, fontWeight: FontWeight.w400, height: 1.25, letterSpacing: 0),

  // --- Sans: display de cifras (tabular) ---
  // text.display.score
  displayMedium: const TextStyle(
    fontFamily: 'ElmsSans', fontSize: 60, fontWeight: FontWeight.w800,
    height: 1.1, letterSpacing: -1.2, fontFeatures: _tabular),
  // text.display.stat
  displaySmall: const TextStyle(
    fontFamily: 'ElmsSans', fontSize: 40, fontWeight: FontWeight.w700,
    height: 1.1, letterSpacing: -0.8, fontFeatures: _tabular),

  // --- Sans: títulos UI ---
  // text.title.lg
  titleLarge: const TextStyle(
    fontFamily: 'ElmsSans', fontSize: 20, fontWeight: FontWeight.w600, height: 1.25),
  // text.title.md
  titleMedium: const TextStyle(
    fontFamily: 'ElmsSans', fontSize: 18, fontWeight: FontWeight.w500, height: 1.5),

  // --- Sans: cuerpo ---
  // text.body.lg / md / sm
  bodyLarge: const TextStyle(
    fontFamily: 'ElmsSans', fontSize: 16, fontWeight: FontWeight.w400, height: 1.5),
  bodyMedium: const TextStyle(
    fontFamily: 'ElmsSans', fontSize: 14, fontWeight: FontWeight.w400, height: 1.5),
  bodySmall: const TextStyle(
    fontFamily: 'ElmsSans', fontSize: 12, fontWeight: FontWeight.w400, height: 1.5),

  // --- Sans: labels ---
  // text.label.lg / md
  labelLarge: const TextStyle(
    fontFamily: 'ElmsSans', fontSize: 14, fontWeight: FontWeight.w500, height: 1.1),
  labelMedium: const TextStyle(
    fontFamily: 'ElmsSans', fontSize: 12, fontWeight: FontWeight.w500, height: 1.1),
  // text.overline (kicker uppercase) — el uppercase se aplica al String
  labelSmall: const TextStyle(
    fontFamily: 'ElmsSans', fontSize: 12, fontWeight: FontWeight.w600,
    height: 1.1, letterSpacing: 0.96),
);
```

> Material `TextTheme` tiene 15 ranuras y el sistema define 17 composiciones. `text.masthead.lg`, `text.stat.lg` y `text.stat.md` no tienen ranura directa: defínelas como `TextStyle` reutilizables (ver ejemplos `statMd`) o como extensión de tema, no las fuerces en ranuras semánticamente ajenas.

---

## Criterio de composición

El sistema debe leerse como un **periódico deportivo**: cabecera con voz impresa (serif) y un cuerpo de trabajo silencioso y preciso (sans). La regla que mantiene esa coherencia es el reparto estricto:

- La serif solo "habla" en masthead y titular. Aparece poco y grande; ahí está su valor.
- La sans hace el resto y se hace cargo de las cifras: marcadores, minutos y stats van en sans tabular para alinear en columna y no saltar al actualizarse.
- El kicker (`text.overline`, uppercase, `tracking.kicker` 0.08em) es el conector editorial entre voces: etiqueta secciones y estados ("EN VIVO", "JORNADA 12") sin invocar la serif.

La personalidad nace del **duotono acotado**, no de mezclar fuentes a discreción. Fuera de masthead y headline, todo es ElmsSans.
