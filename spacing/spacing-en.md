# Spacing System — AtomSN Editorial Theme

> Language: English (canonical for AI agents). Versión en español: [spacing-es.md](spacing-es.md)

> **Version:** 2.0 · **Platform:** Flutter (mobile-first + web) · **Base unit:** 4px

## Visual direction

Spacing system based on multiples of 4px. It guarantees consistent visual rhythm between elements, sections, and screens of the app.

Spacing should feel comfortable, predictable, and structural. The default density is medium: neither too compressed for data-heavy screens, nor too open for an app built for quick score checks.

In AtomSN spacing adopts the language of the newspaper: layout is organized with rules (1px hairline edges, 2px section rule), columns with a fixed gutter, and kickers/overlines tucked against their headline. Corners tend toward the straight edge: the newspaper prefers the sharp edge, and `radius.none` is the default editorial edge for rules, stamps, and tables. `radius.md` remains the standard for cards.

---

## Principles

- All spacing comes from the 4px base scale; no arbitrary values are used.
- Components consume semantic spacing tokens, not raw values directly.
- Visual density can be adjusted by changing the semantic tokens without touching the base scale.
- Horizontal screen padding is fixed and uniform across the entire app.
- Border radius belongs to this system: visual consistency of cards, buttons, and inputs.
- Editorial: corners tend toward the straight edge. Rules, stamps ("FINAL"), and standings tables use `radius.none`. Rounded radii are reserved for interaction surfaces (cards, sheets, buttons).
- Rules (hairline and section rules) are layout elements: their thickness comes from `border.*`, not from the spacing scale.
- Multi-column layouts (tables, grids, web) use a single, fixed column gutter.

---

## Base constraints

- Minimum spacing value: `space.1` (4px)
- Maximum system value: `space.20` (80px)
- Do not use values outside the scale (e.g., 6px, 10px, 15px)
- Maximum border radius for rectangular elements: `radius.xl` (24px)
- `radius.full` is reserved for circular elements (avatars, status dots, badges, pills)
- `radius.none` is the default edge for editorial furniture (rules, stamps, tables)
- Rule thicknesses: only `border.hairline` (1px) and `border.section` (2px); do not invent intermediate thicknesses

---

## Naming convention

```text
# Escala base de espaciado:
space.{n}       → n × 4px

# Radio de borde:
radius.{nivel}

# Grosor de regla editorial:
border.{nivel}

# Tokens semánticos de componente:
spacing.{componente}.{propiedad}.{tamaño}
```

Examples: `space.4` (16px), `space.6` (24px), `radius.md`, `radius.none`, `border.hairline`, `spacing.card.padding.md`, `spacing.column.gap`, `spacing.overline.gap`

---

## Base scale

```yaml
raw_spacing:
  - token: space.1
    value: 4px
    role: micro espacio
    usage: separación entre icono y texto; entre elementos muy próximos; gap overline → titular

  - token: space.2
    value: 8px
    role: espacio compacto
    usage: padding de chips, badges y botones pequeños

  - token: space.3
    value: 12px
    role: espacio medio-compacto
    usage: padding vertical de inputs y botones

  - token: space.4
    value: 16px
    role: unidad base
    usage: padding horizontal estándar de pantalla en mobile; padding general de componentes; gutter de columna

  - token: space.5
    value: 20px
    role: espacio generoso
    usage: separación entre elementos de lista

  - token: space.6
    value: 24px
    role: separación de sección
    usage: separación entre secciones dentro de una pantalla

  - token: space.8
    value: 32px
    role: separación mayor
    usage: separación entre bloques de contenido

  - token: space.10
    value: 40px
    role: espacio de respiro
    usage: layouts de dashboard o pantallas de detalle

  - token: space.12
    value: 48px
    role: separación grande
    usage: padding vertical de secciones hero o cabeceras de pantalla

  - token: space.16
    value: 64px
    role: espaciado muy grande
    usage: separación entre secciones en empty states o onboarding

  - token: space.20
    value: 80px
    role: espacio máximo
    usage: padding superior/inferior en pantallas de presentación
```

---

## Border radius

Editorial: restrained radii. The newspaper prefers straight or slightly rounded corners. `radius.md` remains the standard for cards; `radius.none` is the straight edge of editorial furniture (rules, stamps, tables).

```yaml
border_radius:
  - token: radius.none
    value: 0px
    role: sin redondeo — borde recto editorial
    usage: reglas/filos, sellos de tinta ("FINAL"), tablas de clasificación, celdas; el filo recto del periódico

  - token: radius.xs
    value: 4px
    role: redondeo mínimo
    usage: chips compactos, badges, etiquetas pequeñas

  - token: radius.sm
    value: 8px
    role: redondeo bajo
    usage: inputs, botones secundarios, tooltips

  - token: radius.md
    value: 12px
    role: redondeo estándar
    usage: cards, sheets y modales — el más frecuente del sistema

  - token: radius.lg
    value: 16px
    role: redondeo amplio
    usage: cards grandes, bottom sheets, paneles destacados

  - token: radius.xl
    value: 24px
    role: redondeo pronunciado
    usage: cards hero, elementos con protagonismo visual fuerte

  - token: radius.2xl
    value: 32px
    role: redondeo muy pronunciado
    usage: elementos de onboarding o marketing interno

  - token: radius.full
    value: 9999px
    role: redondeo completo
    usage: avatares, dots de estado, badges circulares, botones pill
```

### Editorial radius guide

- Rules, edges, and separators: `radius.none`. A rounded rule does not exist in a newspaper.
- Ink stamps (`accent.ink`, e.g. "FINAL"): `radius.none`. The stamp is a straight-edged block.
- Standings tables and their cells/rows: `radius.none`. Dotted leaders and tabular figures live on a straight grid.
- Cards, sheets, modals: `radius.md`.
- Inputs and secondary buttons: `radius.sm`. Primary buttons may use `radius.sm`/`radius.md` depending on visual weight.
- Circular elements (avatars, dots, pills): `radius.full`.

---

## Rule thicknesses (border)

Rules are the newspaper's layout tool. Their thickness lives in `border.*` and their color in the semantic tokens `border.hairline` / `border.section` (see color.md). Thickness is independent of color and of the spacing scale.

```yaml
border_width:
  - token: border.hairline
    value: 1px
    role: filo fino editorial
    color: border.hairline   # paper.300 (light) / paper.700 (dark)
    usage: separadores entre filas de tabla, divisores de lista, bordes de card, reglas finas internas

  - token: border.section
    value: 2px
    role: regla de sección
    color: border.section    # ink.500 (light) / paper.400 (dark)
    usage: regla bajo masthead/nameplate de sección; separación de bloques editoriales mayores

raw_spacing usage note: |
  El grosor de la regla NO consume la escala de espaciado. El AIRE alrededor de la
  regla (margen superior/inferior) sí: usar space.* (p. ej. space.4 sobre/bajo una
  regla de sección). Combinar siempre border.* (grosor) + radius.none (recto) + space.* (aire).
```

---

## Semantic tokens

Spacing ready to use in product. Components must consume these tokens.

```yaml
semantic_spacing:

  screen:
    # Nota: estos tokens se aplican DENTRO del área segura del dispositivo.
    # SafeArea (status bar, home indicator, notch) es responsabilidad del
    # sistema/Scaffold y se gestiona por separado. Ver sección SafeArea más abajo.
    - token: spacing.screen.horizontal
      description: padding lateral de todas las pantallas, dentro del área segura
      value: space.4   # 16px

    - token: spacing.screen.vertical.top
      description: padding superior del body, después de que AppBar o SafeArea resuelven el status bar
      value: space.4   # 16px

    - token: spacing.screen.vertical.bottom
      description: padding inferior del body, antes de NavigationBar o SafeArea resuelven el home indicator
      value: space.6   # 24px

    - token: spacing.screen.section.gap
      description: separación entre secciones dentro de una pantalla
      value: space.6   # 24px

  card:
    - token: spacing.card.padding.sm
      description: padding interno de cards compactas (listas de partidos, filas de tabla)
      horizontal: space.3  # 12px
      vertical: space.3    # 12px

    - token: spacing.card.padding.md
      description: padding interno de cards estándar
      horizontal: space.4  # 16px
      vertical: space.4    # 16px

    - token: spacing.card.padding.lg
      description: padding interno de cards destacadas o de detalle
      horizontal: space.5  # 20px
      vertical: space.5    # 20px

    - token: spacing.card.gap
      description: separación entre cards en listas o grids
      value: space.3   # 12px

  list:
    - token: spacing.list.item.gap
      description: separación entre ítems de lista
      value: space.1   # 4px — la separación la da el padding del ítem (y el filo hairline), no el gap entre ellos

    - token: spacing.list.item.padding.horizontal
      description: padding horizontal de un ítem de lista
      value: space.4   # 16px

    - token: spacing.list.item.padding.vertical
      description: padding vertical de un ítem de lista
      value: space.3   # 12px

  button:
    - token: spacing.button.padding.sm
      description: padding de botones pequeños y compactos
      horizontal: space.3  # 12px
      vertical: space.2    # 8px

    - token: spacing.button.padding.md
      description: padding de botones estándar
      horizontal: space.4  # 16px
      vertical: space.3    # 12px

    - token: spacing.button.padding.lg
      description: padding de botones grandes o CTA principales
      horizontal: space.6  # 24px
      vertical: space.4    # 16px

    - token: spacing.button.icon.gap
      description: separación entre icono y texto dentro de un botón
      value: space.2   # 8px

  input:
    - token: spacing.input.padding.horizontal
      description: padding lateral de campos de texto e inputs
      value: space.4   # 16px

    - token: spacing.input.padding.vertical
      description: padding vertical de campos de texto
      value: space.3   # 12px

  navigation:
    - token: spacing.navigation.bottom.height
      description: altura de la bottom navigation bar
      value: space.16  # 64px — referencia, el sistema Flutter define la altura final

    - token: spacing.navigation.item.gap
      description: separación entre ítems de bottom nav (gestionado por NavigationBar)
      value: space.1   # 4px — ajustar según densidad del dispositivo

  inline:
    - token: spacing.inline.xs
      description: separación mínima entre elementos en línea (icono + label)
      value: space.1   # 4px

    - token: spacing.inline.sm
      description: separación compacta entre elementos en línea
      value: space.2   # 8px

    - token: spacing.inline.md
      description: separación estándar entre elementos en línea
      value: space.3   # 12px

  # --- Tokens editoriales AtomSN ---

  column:
    - token: spacing.column.gap
      description: >
        gutter entre columnas en layouts multi-columna (tablas de clasificación,
        grids de partidos, maquetación web a 2+ columnas). Único y fijo, como el
        medianil de un periódico.
      value: space.4   # 16px

  overline:
    - token: spacing.overline.gap
      description: >
        separación entre un kicker/overline en mayúsculas (text.overline: "GRUPO A",
        "EN VIVO", "JORNADA 12") y el titular o bloque que encabeza. El overline se
        pega a su titular para leerse como una unidad editorial.
      value: space.1   # 4px
```

---

## SafeArea and system zones

`SafeArea` and the `spacing.screen.*` tokens are **distinct, complementary layers**. They do not replace each other.

---

## Flutter integration

### EdgeInsets from the scale

```dart
// Equivalentes directos de los tokens base
const double space1 = 4;
const double space2 = 8;
const double space3 = 12;
const double space4 = 16;
const double space6 = 24;

// Padding estándar de pantalla (spacing.screen.horizontal)
const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: space4);

// Padding de card estándar (spacing.card.padding.md)
const EdgeInsets cardPaddingMd = EdgeInsets.all(space4);

// Padding de botón estándar (spacing.button.padding.md)
const EdgeInsets buttonPaddingMd = EdgeInsets.symmetric(
  horizontal: space4,
  vertical: space3,
);
```

### BorderRadius from the scale

```dart
// radius.none — borde recto editorial: reglas, sellos, tablas
const BorderRadius radiusNone = BorderRadius.zero;

// radius.sm — inputs y botones secundarios
const BorderRadius radiusSm = BorderRadius.all(Radius.circular(8));

// radius.md — el más frecuente (cards estándar)
const BorderRadius radiusMd = BorderRadius.all(Radius.circular(12));

// radius.full — avatares y elementos circulares
const BorderRadius radiusFull = BorderRadius.all(Radius.circular(9999));
```

### Editorial rules (border)

```dart
// border.hairline — filo fino (1px). Color: border.hairline (paper.300 light)
// Separador entre filas de tabla / divisor de lista.
const double borderHairline = 1;
const Divider hairlineRule = Divider(
  height: 1,
  thickness: borderHairline,
  // color: tomar de border.hairline en el theme activo
);

// border.section — regla de sección (2px). Color: border.section (ink.500 light)
// Bajo masthead/nameplate. Recta (radius.none) y con aire space.4 alrededor.
const double borderSection = 2;
const Border sectionRule = Border(
  bottom: BorderSide(width: borderSection /*, color: border.section */),
);
```

### SizedBox and gaps

```dart
// Separación vertical entre secciones (spacing.screen.section.gap)
const SizedBox sectionGap = SizedBox(height: 24);

// Separación entre icono y texto (spacing.inline.sm)
const SizedBox inlineGapSm = SizedBox(width: 8);

// Separación entre cards (spacing.card.gap)
const SizedBox cardGap = SizedBox(height: 12);

// Gutter de columna en layouts multi-columna (spacing.column.gap)
const SizedBox columnGap = SizedBox(width: 16);

// Separación overline → titular (spacing.overline.gap)
const SizedBox overlineGap = SizedBox(height: 4);
```

---

## Relationship between spacing and typography

| Context | Typography token | Recommended padding / gap |
|---|---|---|
| Button with `text.label.lg` | 14px / medium | `spacing.button.padding.md` |
| List item with `text.body.md` | 14px / regular | `spacing.list.item.padding.*` |
| Card with `text.title.lg` | 20px / semibold | `spacing.card.padding.md` |
| Chip with `text.label.md` | 12px / medium | `spacing.button.padding.sm` |
| Input with `text.body.lg` | 16px / regular | `spacing.input.padding.*` |
| Overline `text.overline` above headline `text.headline.*` | 12px / semibold uppercase | `spacing.overline.gap` (4px) |
| `text.stat.*` columns / standings table | tabular | `spacing.column.gap` (16px) + `radius.none` |
| Masthead `text.masthead.*` with bottom rule | serif display | `border.section` (2px) + `space.4` of air |
