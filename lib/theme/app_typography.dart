// UScoreNow design-system-v2 — tema editorial 'newsprint'.
// Composiciones tipograficas derivadas 1:1 de tokens.json (bloque "text").
//
// Duotono:
//   - serif  = Libre Caslon Display (solo w400) via google_fonts. SOLO
//     masthead/headline/display-titular. Nunca <20px ni en cuerpo.
//   - sans   = ElmsSans (variable, registrada en pubspec). Cuerpo, UI,
//     labels, captions y stats.
//
// Convenciones aplicadas desde tokens:
//   - letterSpacing en px = tracking(em) * fontSize. tokens.font.tracking:
//       tight = -0.02em, normal = 0em, wide = 0.02em, xwide = 0.06em,
//       kicker = 0.08em.
//   - height = lineHeight (multiplicador relativo al fontSize).
//   - tabular: estilos con "tabular": true en tokens llevan
//     fontFeatures: const [FontFeature.tabularFigures()]:
//       display.score, display.stat, stat.lg, stat.md. Los estilos de
//       TABLA (clasificacion: puntos/posicion) deben construirse a partir
//       de body/label aplicando tambien tabularFigures (helper tabular()).
//   - overline: el texto DEBE ir en MAYUSCULAS por el consumidor
//     (transform: uppercase no existe en TextStyle); aqui solo se aplica
//     el letterSpacing de kicker (0.08em * size).

import 'dart:ui' show FontFeature;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Composiciones [TextStyle] del tema 'newsprint'.
///
/// Cada getter corresponde a una entrada `text.*` de tokens.json. El color
/// NO se fija aqui: lo aporta el [TextTheme] del tema (AppColors) o el
/// consumidor. Asi un mismo estilo sirve en light y dark.
abstract final class AppTypography {
  AppTypography._();

  // -- font.family ----------------------------------------------------------

  /// tokens.font.family.sans -> ElmsSans (registrada en pubspec).
  static const String _sans = 'ElmsSans';

  // -- font.weight ----------------------------------------------------------

  static const FontWeight _regular = FontWeight.w400;
  static const FontWeight _medium = FontWeight.w500;
  static const FontWeight _semibold = FontWeight.w600;
  static const FontWeight _bold = FontWeight.w700;
  static const FontWeight _extrabold = FontWeight.w800;

  // -- font.lineHeight ------------------------------------------------------

  static const double _tight = 1.1;
  static const double _snug = 1.25;
  static const double _normal = 1.5;

  // -- font.tracking (em) ---------------------------------------------------

  static const double _trackTight = -0.02;
  static const double _trackNormal = 0.0;
  static const double _trackKicker = 0.08;

  // -- helpers --------------------------------------------------------------

  /// letterSpacing en px desde tracking en em y el fontSize.
  static double _ls(double em, double size) => em * size;

  static const List<FontFeature> _tabularFeatures =
      <FontFeature>[FontFeature.tabularFigures()];

  /// Estilo sans (ElmsSans).
  static TextStyle _sansStyle({
    required double size,
    required FontWeight weight,
    required double height,
    double trackingEm = _trackNormal,
    bool tabular = false,
  }) {
    return TextStyle(
      fontFamily: _sans,
      fontSize: size,
      fontWeight: weight,
      height: height,
      letterSpacing: _ls(trackingEm, size),
      fontFeatures: tabular ? _tabularFeatures : null,
    );
  }

  /// Estilo serif (Libre Caslon Display, solo w400) via google_fonts.
  static TextStyle _serifStyle({
    required double size,
    required double height,
    double trackingEm = _trackNormal,
  }) {
    return GoogleFonts.libreCaslonDisplay(
      fontSize: size,
      fontWeight: _regular,
      height: height,
      letterSpacing: _ls(trackingEm, size),
    );
  }

  // -- text.masthead (serif) ------------------------------------------------

  /// text.masthead.xl — nameplate de pantalla/seccion. 60px, snug→tight.
  static TextStyle get mastheadXl =>
      _serifStyle(size: 48, height: _tight, trackingEm: _trackTight)
          .copyWith(fontSize: 60);

  /// text.masthead.lg — 32px, snug, tight tracking.
  static TextStyle get mastheadLg =>
      _serifStyle(size: 32, height: _snug, trackingEm: _trackTight);

  // -- text.headline (serif) ------------------------------------------------

  /// text.headline.xl — titular editorial/cronica. 32px, snug.
  static TextStyle get headlineXl =>
      _serifStyle(size: 32, height: _snug, trackingEm: _trackNormal);

  /// text.headline.lg — 24px, snug.
  static TextStyle get headlineLg =>
      _serifStyle(size: 24, height: _snug, trackingEm: _trackNormal);

  // -- text.display (sans, tabular) -----------------------------------------

  /// text.display.score — marcador principal de partido. 60px, extrabold,
  /// tight, cifras tabulares.
  static TextStyle get displayScore => _sansStyle(
        size: 60,
        weight: _extrabold,
        height: _tight,
        trackingEm: _trackTight,
        tabular: true,
      );

  /// text.display.stat — 40px, bold, tight, cifras tabulares.
  static TextStyle get displayStat => _sansStyle(
        size: 40,
        weight: _bold,
        height: _tight,
        trackingEm: _trackTight,
        tabular: true,
      );

  // -- text.title (sans) ----------------------------------------------------

  /// text.title.lg — titulo de card/dato. 20px, semibold, snug.
  static TextStyle get titleLg =>
      _sansStyle(size: 20, weight: _semibold, height: _snug);

  /// text.title.md — 18px, medium, normal.
  static TextStyle get titleMd =>
      _sansStyle(size: 18, weight: _medium, height: _normal);

  // -- text.body (sans) -----------------------------------------------------

  /// text.body.lg — 16px, regular, normal.
  static TextStyle get bodyLg =>
      _sansStyle(size: 16, weight: _regular, height: _normal);

  /// text.body.md — el mas frecuente. 14px, regular, normal.
  static TextStyle get bodyMd =>
      _sansStyle(size: 14, weight: _regular, height: _normal);

  /// text.body.sm — 12px, regular, normal.
  static TextStyle get bodySm =>
      _sansStyle(size: 12, weight: _regular, height: _normal);

  // -- text.label (sans) ----------------------------------------------------

  /// text.label.lg — 14px, medium, tight.
  static TextStyle get labelLg =>
      _sansStyle(size: 14, weight: _medium, height: _tight);

  /// text.label.md — 12px, medium, tight.
  static TextStyle get labelMd =>
      _sansStyle(size: 12, weight: _medium, height: _tight);

  // -- text.overline (sans, MAYUSCULAS) -------------------------------------

  /// text.overline — kicker editorial ('GRUPO A', 'EN VIVO', 'JORNADA 12').
  /// El texto DEBE escribirse en MAYUSCULAS por el consumidor; aqui solo se
  /// aplica el tracking kicker (0.08em * size). 12px, semibold, tight.
  static TextStyle get overline => _sansStyle(
        size: 12,
        weight: _semibold,
        height: _tight,
        trackingEm: _trackKicker,
      );

  // -- text.stat (sans, tabular) --------------------------------------------

  /// text.stat.lg — 24px, bold, tight, cifras tabulares.
  static TextStyle get statLg => _sansStyle(
        size: 24,
        weight: _bold,
        height: _tight,
        trackingEm: _trackTight,
        tabular: true,
      );

  /// text.stat.md — 18px, semibold, tight, cifras tabulares.
  static TextStyle get statMd => _sansStyle(
        size: 18,
        weight: _semibold,
        height: _tight,
        tabular: true,
      );

  // -- text.caption (sans) --------------------------------------------------

  /// text.caption — 12px, regular, normal.
  static TextStyle get caption =>
      _sansStyle(size: 12, weight: _regular, height: _normal);

  // -- helper para TABLAS de clasificacion ----------------------------------

  /// Devuelve una copia del estilo con cifras TABULARES activadas. Usar en
  /// celdas de tabla (puntos, posicion, jornada) sobre body/label para que
  /// las columnas numericas alineen. Las cifras tabulares son obligatorias
  /// en marcadores/minutos/stats.
  static TextStyle tabular(TextStyle base) =>
      base.copyWith(fontFeatures: _tabularFeatures);

  // -- ensamblado del TextTheme ---------------------------------------------

  /// Mapea las composiciones del sistema al [TextTheme] Material 3.
  ///
  /// El parametro [brightness] se acepta por simetria de API; los estilos no
  /// fijan color (lo resuelve el ColorScheme del tema), por lo que el mapeo
  /// es identico en light y dark.
  static TextTheme textTheme(Brightness brightness) {
    return TextTheme(
      // display -> masthead / score editorial
      displayLarge: mastheadXl,
      displayMedium: mastheadLg,
      displaySmall: headlineXl,
      // headline -> headline editorial
      headlineLarge: headlineXl,
      headlineMedium: headlineLg,
      headlineSmall: titleLg,
      // title -> titulos de UI (sans)
      titleLarge: titleLg,
      titleMedium: titleMd,
      titleSmall: labelLg,
      // body
      bodyLarge: bodyLg,
      bodyMedium: bodyMd,
      bodySmall: bodySm,
      // label
      labelLarge: labelLg,
      labelMedium: labelMd,
      labelSmall: overline,
    );
  }

  /// [TextTheme] para light (atajo de [textTheme]).
  static TextTheme get light => textTheme(Brightness.light);

  /// [TextTheme] para dark (atajo de [textTheme]).
  static TextTheme get dark => textTheme(Brightness.dark);
}
