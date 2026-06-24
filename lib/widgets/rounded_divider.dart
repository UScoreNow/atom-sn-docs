// AtomSN — regla editorial con extremos redondeados.
//
// Equivalente a [Divider] de Material, pero la linea se dibuja como un
// contenedor con [BorderRadius], de modo que los extremos quedan redondeados
// (por defecto stadium, AppRadius.full). El [Divider] nativo no lo permite.

import 'package:flutter/material.dart';

import '../theme/app_radius.dart';

/// Regla horizontal con extremos redondeados.
///
/// Respeta la misma semantica de [Divider]: ocupa un alto total [height] con la
/// linea de grosor [thickness] centrada y sangrias [indent]/[endIndent].
/// Los defaults salen, por orden, del [DividerThemeData] del tema y, si falta,
/// de [ThemeData.dividerColor] para el color.
class RoundedDivider extends StatelessWidget {
  const RoundedDivider({
    super.key,
    this.height,
    this.thickness,
    this.indent = 0,
    this.endIndent = 0,
    this.color,
    this.radius,
  });

  /// Alto total reservado; la linea queda centrada. Default: DividerTheme.space.
  final double? height;

  /// Grosor de la linea. Default: DividerTheme.thickness o 1.
  final double? thickness;

  /// Sangria al inicio (izquierda en LTR).
  final double indent;

  /// Sangria al final (derecha en LTR).
  final double endIndent;

  /// Color de la linea. Default: DividerTheme.color o ThemeData.dividerColor.
  final Color? color;

  /// Radio de los extremos. Default: [AppRadius.full] (stadium).
  final double? radius;

  @override
  Widget build(BuildContext context) {
    final DividerThemeData dividerTheme = DividerTheme.of(context);
    final double resolvedHeight = height ?? dividerTheme.space ?? 16;
    final double resolvedThickness = thickness ?? dividerTheme.thickness ?? 1;
    final Color resolvedColor =
        color ?? dividerTheme.color ?? Theme.of(context).dividerColor;
    final double resolvedRadius = radius ?? AppRadius.full;

    return SizedBox(
      height: resolvedHeight,
      child: Center(
        child: Container(
          height: resolvedThickness,
          margin: EdgeInsetsDirectional.only(start: indent, end: endIndent),
          decoration: BoxDecoration(
            color: resolvedColor,
            borderRadius: BorderRadius.circular(resolvedRadius),
          ),
        ),
      ),
    );
  }
}

/// Regla vertical con extremos redondeados.
///
/// Equivalente a [VerticalDivider]: ocupa un ancho total [width] con la linea
/// de grosor [thickness] centrada y sangrias [indent]/[endIndent] (arriba/abajo).
/// Los defaults salen del [DividerThemeData] del tema y, si falta, de
/// [ThemeData.dividerColor] para el color.
class RoundedVerticalDivider extends StatelessWidget {
  const RoundedVerticalDivider({
    super.key,
    this.width,
    this.thickness,
    this.indent = 0,
    this.endIndent = 0,
    this.color,
    this.radius,
  });

  /// Ancho total reservado; la linea queda centrada. Default: DividerTheme.space.
  final double? width;

  /// Grosor de la linea. Default: DividerTheme.thickness o 1.
  final double? thickness;

  /// Sangria superior.
  final double indent;

  /// Sangria inferior.
  final double endIndent;

  /// Color de la linea. Default: DividerTheme.color o ThemeData.dividerColor.
  final Color? color;

  /// Radio de los extremos. Default: [AppRadius.full] (stadium).
  final double? radius;

  @override
  Widget build(BuildContext context) {
    final DividerThemeData dividerTheme = DividerTheme.of(context);
    final double resolvedWidth = width ?? dividerTheme.space ?? 16;
    final double resolvedThickness = thickness ?? dividerTheme.thickness ?? 1;
    final Color resolvedColor =
        color ?? dividerTheme.color ?? Theme.of(context).dividerColor;
    final double resolvedRadius = radius ?? AppRadius.full;

    return SizedBox(
      width: resolvedWidth,
      child: Center(
        child: Container(
          width: resolvedThickness,
          margin: EdgeInsetsDirectional.only(top: indent, bottom: endIndent),
          decoration: BoxDecoration(
            color: resolvedColor,
            borderRadius: BorderRadius.circular(resolvedRadius),
          ),
        ),
      ),
    );
  }
}
