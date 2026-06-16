import 'package:flutter/widgets.dart';

/// Radios de esquina del design system 'newsprint'.
///
/// Editorial: radios contenidos; el periodico prefiere esquinas rectas/leves.
/// `md` es el estandar de cards. `none` se usa para reglas, sellos y tablas
/// (borde recto editorial). `full` para avatares, dots, badges y pills.
///
/// Fuente unica de verdad: tokens/tokens.json (radius.*).
abstract final class AppRadius {
  AppRadius._();

  // --- Escala (radius.*) ---
  /// Borde recto editorial: reglas, sellos ('FINAL'), tablas de clasificacion.
  static const double none = 0;
  static const double xs = 4;
  static const double sm = 8;

  /// Estandar de cards.
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xl2 = 32;

  /// Avatares, dots, badges, pills.
  static const double full = 9999;

  // --- BorderRadius const frecuentes ---
  /// Sin radio: reglas, sellos, tablas.
  static const BorderRadius radiusNone = BorderRadius.zero;
  static const BorderRadius radiusSm = BorderRadius.all(Radius.circular(sm));

  /// Radio estandar de cards.
  static const BorderRadius radiusMd = BorderRadius.all(Radius.circular(md));
  static const BorderRadius radiusFull =
      BorderRadius.all(Radius.circular(full));
}
