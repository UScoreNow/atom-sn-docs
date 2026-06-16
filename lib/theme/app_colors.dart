import 'package:flutter/painting.dart';

/// Paleta base de UScoreNow design-system-v2, tema editorial "newsprint".
///
/// Fuente unica de verdad: tokens/tokens.json (formato DTCG).
/// Todos los valores son `const Color(0xFF......)` con los hex exactos de
/// la rampa base (paper / ink / green / yellow / red / indigo).
///
/// Reglas del sistema:
/// - #FFFFFF y #000000 puros estan PROHIBIDOS.
/// - ink.900 (#0E0D0A) es el negro legal mas oscuro; paper.50 (#FBF8F0) el papel mas claro.
/// - El verde es escaso: solo acciones, estados activos/seleccionados y deltas positivos.
/// - Tokens *.500 (green/yellow/red) son de RELLENO/ICONO; sus *.700/*.800 son de TEXTO sobre papel (AA+).
abstract final class AppPalette {
  // --- paper: rampa neutra crema/newsprint calida ---
  static const Color paper50 = Color(0xFFFBF8F0);
  static const Color paper100 = Color(0xFFF5F0E3);
  static const Color paper200 = Color(0xFFECE4D2);
  static const Color paper300 = Color(0xFFDCD2BC);
  static const Color paper400 = Color(0xFFC2B69D);
  static const Color paper500 = Color(0xFFA6987C);
  static const Color paper600 = Color(0xFF857862);
  static const Color paper700 = Color(0xFF615847);
  static const Color paper800 = Color(0xFF403A30);
  static const Color paper900 = Color(0xFF2B2820);

  // --- ink: negro tinta calido ---
  static const Color ink50 = Color(0xFF6E6A60);
  static const Color ink100 = Color(0xFF514D44);
  static const Color ink300 = Color(0xFF39362E);
  static const Color ink500 = Color(0xFF26241E);
  static const Color ink700 = Color(0xFF1A1814);
  static const Color ink900 = Color(0xFF0E0D0A);

  /// Fondo base del tema oscuro "Night Press".
  static const Color inkBg = Color(0xFF16140F);

  // --- green: verde cesped calido, acento unico de interaccion ---
  static const Color green50 = Color(0xFFEAF1E4);
  static const Color green100 = Color(0xFFCDDFC0);
  static const Color green200 = Color(0xFFAECF96);
  static const Color green300 = Color(0xFF8FBE6F);
  static const Color green400 = Color(0xFF5FA453);
  static const Color green500 = Color(0xFF3E8E45);
  static const Color green600 = Color(0xFF327237);
  static const Color green700 = Color(0xFF27592C);
  static const Color green800 = Color(0xFF1D4421);
  static const Color green900 = Color(0xFF163518);

  // --- yellow: mostaza newsprint (highlight 'marker' + tarjeta/warning) ---
  static const Color yellow50 = Color(0xFFFBF4D8);
  static const Color yellow100 = Color(0xFFF6E8BE);
  static const Color yellow200 = Color(0xFFF0D89B);
  static const Color yellow300 = Color(0xFFE8C863);
  static const Color yellow400 = Color(0xFFDFB740);
  static const Color yellow500 = Color(0xFFD6A52E);
  static const Color yellow600 = Color(0xFFB98A1F);
  static const Color yellow700 = Color(0xFF9A7416);
  static const Color yellow800 = Color(0xFF7A5B13);
  static const Color yellow900 = Color(0xFF5C4410);

  // --- red: ladrillo calido de tinta (live / error / critico) ---
  static const Color red50 = Color(0xFFF7E6E4);
  static const Color red100 = Color(0xFFEFC9C6);
  static const Color red200 = Color(0xFFE29E99);
  static const Color red300 = Color(0xFFD5736C);
  static const Color red400 = Color(0xFFCC554D);
  static const Color red500 = Color(0xFFC5403A);
  static const Color red600 = Color(0xFFA8332E);
  static const Color red700 = Color(0xFF8C2A26);
  static const Color red800 = Color(0xFF6E211E);
  static const Color red900 = Color(0xFF511817);

  // --- indigo: informacion neutral, solo status.info, uso escaso ---
  static const Color indigo50 = Color(0xFFEEF2FF);
  static const Color indigo100 = Color(0xFFE0E7FF);
  static const Color indigo200 = Color(0xFFC7D2FE);
  static const Color indigo300 = Color(0xFFA5B4FC);
  static const Color indigo400 = Color(0xFF818CF8);
  static const Color indigo500 = Color(0xFF6366F1);
  static const Color indigo600 = Color(0xFF4F46E5);
  static const Color indigo700 = Color(0xFF4338CA);
  static const Color indigo800 = Color(0xFF3730A3);
  static const Color indigo900 = Color(0xFF312E81);
}

/// Esquema semantico de color resuelto por modo (light / dark).
///
/// Los componentes consumen SOLO estos campos, nunca la rampa base directamente.
/// Cada instancia mapea los roles semanticos a los tokens base segun
/// semantic.light / semantic.dark de tokens.json.
///
/// Usa [AppColors.light] y [AppColors.dark].
class AppColors {
  const AppColors({
    required this.bgBase,
    required this.bgSurface,
    required this.bgRaised,
    required this.bgSubtle,
    required this.bgOverlay,
    required this.bgInverse,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textMuted,
    required this.textDisabled,
    required this.textInverse,
    required this.textOnPrimary,
    required this.textLink,
    required this.actionPrimary,
    required this.actionHover,
    required this.actionActive,
    required this.actionDisabled,
    required this.actionSubtle,
    required this.accentInk,
    required this.borderDefault,
    required this.borderSubtle,
    required this.borderStrong,
    required this.borderActive,
    required this.borderHairline,
    required this.borderSection,
    required this.statusLive,
    required this.statusLiveText,
    required this.statusError,
    required this.statusErrorText,
    required this.statusSuccess,
    required this.statusSuccessText,
    required this.statusWarning,
    required this.statusWarningText,
    required this.statusInfo,
    required this.statusInfoText,
    required this.highlightMark,
  });

  // --- bg: fondos y superficies ---
  /// Fondo base de la app.
  final Color bgBase;

  /// Superficie elevada / cards.
  final Color bgSurface;

  /// Superficie con tinte / hover / raised.
  final Color bgRaised;

  /// Superficie sutil.
  final Color bgSubtle;

  /// Velo de overlay; aplicar con opacidad (0.5 light / 0.7 dark).
  final Color bgOverlay;

  /// Fondo invertido respecto al modo.
  final Color bgInverse;

  // --- text: jerarquia tipografica ---
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textMuted;
  final Color textDisabled;

  /// Texto sobre fondo invertido.
  final Color textInverse;

  /// Texto sobre relleno de accion primaria (verde); usar peso bold >=14px.
  final Color textOnPrimary;

  /// Color de enlace.
  final Color textLink;

  // --- action: interaccion (verde escaso) ---
  final Color actionPrimary;
  final Color actionHover;
  final Color actionActive;
  final Color actionDisabled;

  /// Superficie sutil de accion (chips/estados seleccionados leves).
  final Color actionSubtle;

  // --- accent: sellos de tinta de alto contraste ---
  /// Destacados / sellos ("FINAL"); negro tinta en light, papel en dark.
  final Color accentInk;

  // --- border: reglas y bordes editoriales ---
  final Color borderDefault;
  final Color borderSubtle;
  final Color borderStrong;

  /// Borde de elemento activo/seleccionado (verde).
  final Color borderActive;

  /// Regla fina editorial (1px).
  final Color borderHairline;

  /// Regla de seccion bajo masthead (2px).
  final Color borderSection;

  // --- status: estados (fill *.500 vs text *.700/*.800 sobre papel) ---
  /// Relleno/icono de "en vivo".
  final Color statusLive;

  /// Texto de "en vivo" (AA sobre papel).
  final Color statusLiveText;
  final Color statusError;
  final Color statusErrorText;
  final Color statusSuccess;
  final Color statusSuccessText;
  final Color statusWarning;
  final Color statusWarningText;

  /// Relleno/icono de info (indigo, escaso).
  final Color statusInfo;
  final Color statusInfoText;

  // --- highlight: wash de marcador editorial ---
  /// Wash "marker" tras stats/records clave.
  final Color highlightMark;

  /// Tema "Paper": fondo crema + tinta + acentos verde/negro.
  static const AppColors light = AppColors(
    // bg
    bgBase: AppPalette.paper50,
    bgSurface: AppPalette.paper100,
    bgRaised: AppPalette.paper200,
    bgSubtle: AppPalette.paper100,
    bgOverlay: AppPalette.ink900,
    bgInverse: AppPalette.ink900,
    // text
    textPrimary: AppPalette.ink700,
    textSecondary: AppPalette.paper700,
    textTertiary: AppPalette.paper600,
    textMuted: AppPalette.paper500,
    textDisabled: AppPalette.paper400,
    textInverse: AppPalette.paper50,
    textOnPrimary: AppPalette.paper50,
    textLink: AppPalette.green700,
    // action
    actionPrimary: AppPalette.green500,
    actionHover: AppPalette.green600,
    actionActive: AppPalette.green700,
    actionDisabled: AppPalette.paper300,
    actionSubtle: AppPalette.green50,
    // accent
    accentInk: AppPalette.ink900,
    // border
    borderDefault: AppPalette.paper300,
    borderSubtle: AppPalette.paper200,
    borderStrong: AppPalette.paper400,
    borderActive: AppPalette.green500,
    borderHairline: AppPalette.paper300,
    borderSection: AppPalette.ink500,
    // status
    statusLive: AppPalette.red500,
    statusLiveText: AppPalette.red700,
    statusError: AppPalette.red500,
    statusErrorText: AppPalette.red700,
    statusSuccess: AppPalette.green500,
    statusSuccessText: AppPalette.green700,
    statusWarning: AppPalette.yellow500,
    statusWarningText: AppPalette.yellow800,
    statusInfo: AppPalette.indigo500,
    statusInfoText: AppPalette.indigo700,
    // highlight
    highlightMark: AppPalette.yellow100,
  );

  /// Tema "Night Press": fondo tinta + texto crema + acentos verde/papel.
  static const AppColors dark = AppColors(
    // bg
    bgBase: AppPalette.inkBg,
    bgSurface: AppPalette.ink300,
    bgRaised: AppPalette.paper800,
    bgSubtle: AppPalette.ink300,
    bgOverlay: AppPalette.ink900,
    bgInverse: AppPalette.paper50,
    // text
    textPrimary: AppPalette.paper100,
    textSecondary: AppPalette.paper400,
    textTertiary: AppPalette.paper500,
    textMuted: AppPalette.paper500,
    textDisabled: AppPalette.paper700,
    textInverse: AppPalette.ink900,
    textOnPrimary: AppPalette.ink900,
    textLink: AppPalette.green300,
    // action
    actionPrimary: AppPalette.green300,
    actionHover: AppPalette.green200,
    actionActive: AppPalette.green100,
    actionDisabled: AppPalette.paper700,
    actionSubtle: AppPalette.ink300,
    // accent
    accentInk: AppPalette.paper100,
    // border
    borderDefault: AppPalette.paper700,
    borderSubtle: AppPalette.ink300,
    borderStrong: AppPalette.paper500,
    borderActive: AppPalette.green300,
    borderHairline: AppPalette.paper700,
    borderSection: AppPalette.paper400,
    // status
    statusLive: AppPalette.red400,
    statusLiveText: AppPalette.red300,
    statusError: AppPalette.red400,
    statusErrorText: AppPalette.red300,
    statusSuccess: AppPalette.green300,
    statusSuccessText: AppPalette.green300,
    statusWarning: AppPalette.yellow300,
    statusWarningText: AppPalette.yellow300,
    statusInfo: AppPalette.indigo400,
    statusInfoText: AppPalette.indigo400,
    // highlight
    highlightMark: AppPalette.yellow700,
  );
}
