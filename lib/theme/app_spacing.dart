import 'package:flutter/widgets.dart';

/// Espaciado del design system 'newsprint'.
///
/// Escala base 4px (space.* de tokens.json), mas tokens semanticos de uso
/// frecuente y helpers `EdgeInsets`. Tambien los grosores de regla editorial
/// (border.* de tokens.json) para hairline y reglas de seccion.
///
/// Fuente unica de verdad: tokens/tokens.json. No introducir valores fuera de
/// esa escala.
abstract final class AppSpacing {
  AppSpacing._();

  // --- Escala base (space.* — base 4px) ---
  static const double space1 = 4;
  static const double space2 = 8;
  static const double space3 = 12;
  static const double space4 = 16;
  static const double space5 = 20;
  static const double space6 = 24;
  static const double space8 = 32;
  static const double space10 = 40;
  static const double space12 = 48;
  static const double space16 = 64;
  static const double space20 = 80;

  // --- Tokens semanticos ---
  /// Margen horizontal de pantalla (mobile-first).
  static const double screenHorizontal = 16;

  /// Separacion entre secciones de contenido.
  static const double sectionGap = 24;

  /// Padding interior estandar de card.
  static const double cardPaddingMd = 16;

  /// Gutter entre columnas de una grilla editorial.
  static const double columnGap = 16;

  /// Hueco entre overline/kicker y el titular que precede.
  static const double overlineGap = 4;

  // --- Grosores de regla editorial (border.*) ---
  /// Regla fina editorial 1px (border.hairline, paper.300).
  static const double hairline = 1;

  /// Regla de seccion 2px bajo masthead (border.section, ink.500).
  static const double section = 2;

  // --- Helpers EdgeInsets const frecuentes ---
  /// Padding horizontal de pantalla.
  static const EdgeInsets screenPadding =
      EdgeInsets.symmetric(horizontal: screenHorizontal);

  /// Padding interior de card.
  static const EdgeInsets cardPaddingMdInsets = EdgeInsets.all(cardPaddingMd);

  /// Padding de boton tamano md (vertical space3, horizontal space5).
  static const EdgeInsets buttonPaddingMd =
      EdgeInsets.symmetric(vertical: space3, horizontal: space5);
}
