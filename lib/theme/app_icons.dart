import 'package:hugeicons/hugeicons.dart';

/// Mapa semantico de iconos del tema 'newsprint'.
///
/// Fuente de verdad de la semantica: icons/icons.md (convencion
/// `icon.{dominio}.{nombre}`). Cada constante aliasa el identificador real de
/// Hugeicons (estilo `strokeRounded`, unico permitido) para consumirse con el
/// widget `HugeIcon`:
///
/// ```dart
/// HugeIcon(icon: AppIcons.navigationHome, size: 24, strokeWidth: 1.5)
/// ```
///
/// Una semantica, un icono. No referenciar `HugeIcons.*` directamente en los
/// componentes: pasar siempre por aqui para mantener "una semantica, un icono".
///
/// Nota: algunos nombres difieren de icons.md porque ese doc usa una convencion
/// antigua (`HugeIconsStrokeRounded.trophy01`, `radioButton01`, `stadium`...)
/// y se han mapeado al identificador real existente en hugeicons 1.1.7
/// (Champion por trophy, RadioButton por radioButton01, FootballPitch por
/// stadium, etc.).
abstract final class AppIcons {
  AppIcons._();

  // -- navigation -----------------------------------------------------------

  /// icon.navigation.home
  static const List<List<dynamic>> navigationHome =
      HugeIcons.strokeRoundedHome01;

  /// icon.navigation.matches
  static const List<List<dynamic>> navigationMatches =
      HugeIcons.strokeRoundedCalendar03;

  /// icon.navigation.standings
  static const List<List<dynamic>> navigationStandings =
      HugeIcons.strokeRoundedChartLineData02;

  /// icon.navigation.competitions
  static const List<List<dynamic>> navigationCompetitions =
      HugeIcons.strokeRoundedChampion;

  /// icon.navigation.profile
  static const List<List<dynamic>> navigationProfile =
      HugeIcons.strokeRoundedUserCircle;

  // -- actions --------------------------------------------------------------

  /// icon.action.search
  static const List<List<dynamic>> actionSearch =
      HugeIcons.strokeRoundedSearch01;

  /// icon.action.filter
  static const List<List<dynamic>> actionFilter =
      HugeIcons.strokeRoundedFilterHorizontal;

  /// icon.action.notification
  static const List<List<dynamic>> actionNotification =
      HugeIcons.strokeRoundedNotification03;

  /// icon.action.bookmark
  static const List<List<dynamic>> actionBookmark =
      HugeIcons.strokeRoundedBookmark01;

  /// icon.action.share
  static const List<List<dynamic>> actionShare =
      HugeIcons.strokeRoundedShare01;

  /// icon.action.more
  static const List<List<dynamic>> actionMore =
      HugeIcons.strokeRoundedMoreVertical;

  /// icon.action.back
  static const List<List<dynamic>> actionBack =
      HugeIcons.strokeRoundedArrowLeft01;

  /// icon.action.close
  static const List<List<dynamic>> actionClose =
      HugeIcons.strokeRoundedCancel01;

  // -- status ---------------------------------------------------------------

  /// icon.status.live — sello de directo (dot pulsante, color status.live).
  static const List<List<dynamic>> statusLive =
      HugeIcons.strokeRoundedRadioButton;

  /// icon.status.time
  static const List<List<dynamic>> statusTime =
      HugeIcons.strokeRoundedClock01;

  /// icon.status.check
  static const List<List<dynamic>> statusCheck =
      HugeIcons.strokeRoundedCheckmarkCircle01;

  /// icon.status.alert
  static const List<List<dynamic>> statusAlert =
      HugeIcons.strokeRoundedAlert02;

  /// icon.status.info
  static const List<List<dynamic>> statusInfo =
      HugeIcons.strokeRoundedInformationCircle;

  /// icon.status.lock
  static const List<List<dynamic>> statusLock =
      HugeIcons.strokeRoundedLock;

  // -- entities -------------------------------------------------------------

  /// icon.entity.team
  static const List<List<dynamic>> entityTeam =
      HugeIcons.strokeRoundedUserGroup;

  /// icon.entity.player
  static const List<List<dynamic>> entityPlayer =
      HugeIcons.strokeRoundedUserStar01;

  /// icon.entity.stadium
  static const List<List<dynamic>> entityStadium =
      HugeIcons.strokeRoundedFootballPitch;

  /// icon.entity.ball
  static const List<List<dynamic>> entityBall =
      HugeIcons.strokeRoundedFootball;

  /// icon.entity.competition
  static const List<List<dynamic>> entityCompetition =
      HugeIcons.strokeRoundedChampion;

  // -- feedback -------------------------------------------------------------

  /// icon.feedback.success — color semantic.status.success
  static const List<List<dynamic>> feedbackSuccess =
      HugeIcons.strokeRoundedCheckmarkCircle02;

  /// icon.feedback.warning — color semantic.status.warning
  static const List<List<dynamic>> feedbackWarning =
      HugeIcons.strokeRoundedAlert02;

  /// icon.feedback.error — color semantic.status.error
  static const List<List<dynamic>> feedbackError =
      HugeIcons.strokeRoundedCancelCircle;

  /// icon.feedback.info — color semantic.status.info
  static const List<List<dynamic>> feedbackInfo =
      HugeIcons.strokeRoundedInformationCircle;

  /// icon.feedback.empty
  static const List<List<dynamic>> feedbackEmpty =
      HugeIcons.strokeRoundedInbox;
}
