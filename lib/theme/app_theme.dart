// UScoreNow design-system-v2 — tema editorial 'newsprint'.
// Ensamblado de ThemeData (light/dark) a partir de AppColors y AppTypography.
//
// El color sale de AppColors (app_colors.dart), derivado de la capa
// `semantic.{light,dark}` de tokens.json. La tipografia sale de
// AppTypography (app_typography.dart), derivada de `text.*`.

import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

/// Temas Material 3 del sistema 'newsprint'.
abstract final class AppTheme {
  AppTheme._();

  /// Tema 'Paper' (light): crema apapelada + tinta + acentos verde/negro.
  static ThemeData get light => _build(AppColors.light, Brightness.light);

  /// Tema 'Night Press' (dark): fondo tinta + texto crema + acentos.
  static ThemeData get dark => _build(AppColors.dark, Brightness.dark);

  static ThemeData _build(AppColors c, Brightness brightness) {
    final ColorScheme scheme = ColorScheme(
      brightness: brightness,
      // accion primaria = verde escaso
      primary: c.actionPrimary,
      onPrimary: c.textOnPrimary,
      // secundario = tinta/negro editorial (sellos, destacados)
      secondary: c.accentInk,
      onSecondary: c.textInverse,
      // error = rojo (live/error)
      error: c.statusError,
      onError: c.textInverse,
      // superficies
      surface: c.bgSurface,
      onSurface: c.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: c.bgBase,
      // regla fina editorial 1px (paper.300 light / paper.700 dark)
      dividerColor: c.borderHairline,
      textTheme: AppTypography.textTheme(brightness),
      dividerTheme: DividerThemeData(
        color: c.borderHairline,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
