import 'dart:typed_data';

import 'package:awesome_notifications/src/models/notification_localization.dart';

import 'awesome_notifications_platform_interface.dart'
if (dart.library.html) 'awesome_notifications_web_interface.dart';
import 'i_awesome_notifications.dart';

import 'src/enumerators/notification_life_cycle.dart';
import 'src/enumerators/notification_permission.dart';
import 'src/models/notification_button.dart';
import 'src/models/notification_channel.dart';
import 'src/models/notification_channel_group.dart';
import 'src/models/notification_content.dart';
import 'src/models/notification_model.dart';
import 'src/models/notification_schedule.dart';
import 'src/models/received_models/received_action.dart';
import 'src/models/received_models/received_notification.dart';

export 'src/definitions.dart';
export 'src/enumerators/action_type.dart';
export 'src/enumerators/default_ringtone_type.dart';
export 'src/enumerators/emojis.dart';
export 'src/enumerators/group_alert_behaviour.dart';
export 'src/enumerators/group_sort.dart';
export 'src/enumerators/media_source.dart';
export 'src/enumerators/notification_category.dart';
export 'src/enumerators/notification_importance.dart';
export 'src/enumerators/notification_layout.dart';
export 'src/enumerators/notification_life_cycle.dart';
export 'src/enumerators/notification_permission.dart';
export 'src/enumerators/notification_privacy.dart';
export 'src/enumerators/notification_source.dart';
export 'src/enumerators/notification_play_state.dart';
export 'src/enumerators/time_and_date.dart';

export 'src/exceptions/awesome_exception.dart';
export 'src/exceptions/isolate_callback_exception.dart';

export 'src/extensions/extension_navigator_state.dart';

export 'src/helpers/bitmap_helper.dart';
export 'src/helpers/cron_helper.dart';

export 'src/models/notification_android_crontab.dart';
export 'src/models/notification_button.dart';
export 'src/models/notification_calendar.dart';
export 'src/models/notification_channel.dart';
export 'src/models/notification_channel_group.dart';
export 'src/models/notification_content.dart';
export 'src/models/notification_interval.dart';
export 'src/models/notification_localization.dart';
export 'src/models/notification_model.dart';
export 'src/models/notification_schedule.dart';
export 'src/models/received_models/push_notification.dart';
export 'src/models/received_models/received_action.dart';
export 'src/models/received_models/received_notification.dart';

export 'src/utils/assert_utils.dart';
export 'src/utils/bitmap_utils.dart';
export 'src/utils/date_utils.dart';
export 'src/utils/map_utils.dart';
export 'src/utils/resource_image_provider.dart';
export 'src/utils/string_utils.dart';

import 'awesome_notifications_method_channel.dart';

typedef ActionHandler = Future<void> Function(ReceivedAction receivedAction);
typedef NotificationHandler = Future<
    void> Function(ReceivedNotification receivedNotification);

// Vibration patterns
Int64List lowVibrationPattern = Int64List.fromList([0, 200, 200, 200]);
Int64List mediumVibrationPattern = Int64List.fromList(
    [0, 500, 200, 200, 200, 200]);
Int64List highVibrationPattern = Int64List.fromList(
    [0, 1000, 200, 200, 200, 200, 200, 200]);

class AwesomeNotifications implements IAwesomeNotifications {
  static int get maxID => 2147483647;
  static String localTimeZoneIdentifier = DateTime
      .now()
      .timeZoneName;
  static String utcTimeZoneIdentifier = 'UTC';

  /// NON-NULLABLE INSTANCE
  late final MethodChannelAwesomeNotifications _methodChannelAwesomeNotifications;

  /// Constructor → initialize only ONCE
  AwesomeNotifications() {
    _methodChannelAwesomeNotifications = MethodChannelAwesomeNotifications();
  }


  @override
  Future<void> cancel(int id) {
    return _methodChannelAwesomeNotifications.cancel(id);
  }


  @override
  Future<void> cancelAll() {
    return _methodChannelAwesomeNotifications.cancelAll();
  }


  @override
  Future<void> cancelAllSchedules() {
    return _methodChannelAwesomeNotifications.cancelAllSchedules();
  }


  @override
  Future<void> cancelNotificationsByChannelKey(String channelKey) {
    return _methodChannelAwesomeNotifications.cancelNotificationsByChannelKey(
        channelKey);
  }


  @override
  Future<void> cancelNotificationsByGroupKey(String groupKey) {
    return _methodChannelAwesomeNotifications.cancelNotificationsByGroupKey(
        groupKey);
  }


  @override
  Future<void> cancelSchedule(int id) {
    return _methodChannelAwesomeNotifications.cancelSchedule(id);
  }


  @override
  Future<void> cancelSchedulesByChannelKey(String channelKey) {
    return _methodChannelAwesomeNotifications.cancelSchedulesByChannelKey(
        channelKey);
  }


  @override
  Future<void> cancelSchedulesByGroupKey(String groupKey) {
    return _methodChannelAwesomeNotifications.cancelSchedulesByGroupKey(
        groupKey);
  }


  @override
  Future<List<NotificationPermission>> checkPermissionList({
    String? channelKey,
    List<NotificationPermission> permissions = const [
      NotificationPermission.Badge,
      NotificationPermission.Alert,
      NotificationPermission.Sound,
      NotificationPermission.Vibration,
      NotificationPermission.Light
    ],
  }) {
    return _methodChannelAwesomeNotifications.checkPermissionList(
      channelKey: channelKey,
      permissions: permissions,
    );
  }


  @override
  Future<bool> createNotification({
    required NotificationContent content,
    NotificationSchedule? schedule,
    List<NotificationActionButton>? actionButtons,
    Map<String, NotificationLocalization>? localizations,
  }) {
    return _methodChannelAwesomeNotifications.createNotification(
      content: content,
      schedule: schedule,
      actionButtons: actionButtons,
      localizations: localizations,
    );
  }


  @override
  Future<bool> createNotificationFromJsonData(Map<String, dynamic> mapData) {
    return _methodChannelAwesomeNotifications.createNotificationFromJsonData(
        mapData);
  }


  @override
  Future<int> decrementGlobalBadgeCounter() {
    return _methodChannelAwesomeNotifications.decrementGlobalBadgeCounter();
  }


  @override
  Future<void> dismiss(int id) {
    return _methodChannelAwesomeNotifications.dismiss(id);
  }


  @override
  Future<void> dismissAllNotifications() {
    return _methodChannelAwesomeNotifications.dismissAllNotifications();
  }


  @override
  Future<void> dismissNotificationsByChannelKey(String channelKey) {
    return _methodChannelAwesomeNotifications.dismissNotificationsByChannelKey(
        channelKey);
  }


  @override
  Future<void> dismissNotificationsByGroupKey(String groupKey) {
    return _methodChannelAwesomeNotifications.dismissNotificationsByGroupKey(
        groupKey);
  }


  @override
  void dispose() {
    _methodChannelAwesomeNotifications.dispose();
  }


  @override
  Future<NotificationLifeCycle> getAppLifeCycle() {
    return _methodChannelAwesomeNotifications.getAppLifeCycle();
  }


  @override
  Future<Uint8List?> getDrawableData(String drawablePath) {
    return _methodChannelAwesomeNotifications.getDrawableData(drawablePath);
  }


  @override
  Future<ReceivedAction?> getInitialNotificationAction(
      {bool removeFromActionEvents = false}) {
    return _methodChannelAwesomeNotifications.getInitialNotificationAction(
      removeFromActionEvents: removeFromActionEvents,
    );
  }


  @override
  Future<int> getGlobalBadgeCounter() {
    return _methodChannelAwesomeNotifications.getGlobalBadgeCounter();
  }


  @override
  Future<String> getLocalTimeZoneIdentifier() {
    return _methodChannelAwesomeNotifications.getLocalTimeZoneIdentifier();
  }


  @override
  Future<DateTime?> getNextDate(NotificationSchedule schedule,
      {DateTime? fixedDate}) {
    return _methodChannelAwesomeNotifications.getNextDate(
      schedule,
      fixedDate: fixedDate,
    );
  }


  @override
  Future<String> getUtcTimeZoneIdentifier() {
    return _methodChannelAwesomeNotifications.getUtcTimeZoneIdentifier();
  }


  @override
  Future<int> incrementGlobalBadgeCounter() {
    return _methodChannelAwesomeNotifications.incrementGlobalBadgeCounter();
  }


  @override
  Future<bool> initialize(String? defaultIcon,
      List<NotificationChannel> channels, {
        List<NotificationChannelGroup>? channelGroups,
        bool debug = false,
        String? languageCode,
      }) {
    return _methodChannelAwesomeNotifications.initialize(
      defaultIcon,
      channels,
      channelGroups: channelGroups,
      languageCode: languageCode,
      debug: debug,
    );
  }


  @override
  Future<bool> isNotificationAllowed() {
    return _methodChannelAwesomeNotifications.isNotificationAllowed();
  }


  @override
  Future<List<NotificationModel>> listScheduledNotifications() {
    return _methodChannelAwesomeNotifications.listScheduledNotifications();
  }


  @override
  Future<bool> removeChannel(String channelKey) {
    return _methodChannelAwesomeNotifications.removeChannel(channelKey);
  }


  @override
  Future<bool> requestPermissionToSendNotifications({
    String? channelKey,
    List<NotificationPermission> permissions = const [
      NotificationPermission.Alert,
      NotificationPermission.Sound,
      NotificationPermission.Badge,
      NotificationPermission.Vibration,
      NotificationPermission.Light
    ],
  }) {
    return _methodChannelAwesomeNotifications
        .requestPermissionToSendNotifications(
      channelKey: channelKey,
      permissions: permissions,
    );
  }


  @override
  Future<void> resetGlobalBadge() {
    return _methodChannelAwesomeNotifications.resetGlobalBadge();
  }


  @override
  Future<void> setChannel(NotificationChannel notificationChannel,
      {bool forceUpdate = false}) {
    return _methodChannelAwesomeNotifications.setChannel(
      notificationChannel,
      forceUpdate: forceUpdate,
    );
  }


  @override
  Future<void> setGlobalBadgeCounter(int amount) {
    return _methodChannelAwesomeNotifications.setGlobalBadgeCounter(amount);
  }


  @override
  Future<bool> setListeners({
    required ActionHandler onActionReceivedMethod,
    NotificationHandler? onNotificationCreatedMethod,
    NotificationHandler? onNotificationDisplayedMethod,
    ActionHandler? onDismissActionReceivedMethod,
  }) {
    return _methodChannelAwesomeNotifications.setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
    );
  }


  @override
  Future<List<NotificationPermission>> shouldShowRationaleToRequest({
    String? channelKey,
    List<NotificationPermission> permissions = const [
      NotificationPermission.Badge,
      NotificationPermission.Alert,
      NotificationPermission.Sound,
      NotificationPermission.Vibration,
      NotificationPermission.Light
    ],
  }) {
    return _methodChannelAwesomeNotifications.shouldShowRationaleToRequest(
      channelKey: channelKey,
      permissions: permissions,
    );
  }


  @override
  Future<void> showAlarmPage() {
    return _methodChannelAwesomeNotifications.showAlarmPage();
  }


  @override
  Future<void> showGlobalDndOverridePage() {
    return _methodChannelAwesomeNotifications.showGlobalDndOverridePage();
  }


  @override
  Future<void> showNotificationConfigPage({String? channelKey}) {
    return _methodChannelAwesomeNotifications.showNotificationConfigPage(
      channelKey: channelKey,
    );
  }


  @override
  Future<String> getLocalization() {
    return _methodChannelAwesomeNotifications.getLocalization();
  }


  @override
  Future<bool> setLocalization({required String? languageCode}) {
    return _methodChannelAwesomeNotifications.setLocalization(
      languageCode: languageCode,
    );
  }


  @override
  Future<bool> isNotificationActiveOnStatusBar({required int id}) {
    return _methodChannelAwesomeNotifications.isNotificationActiveOnStatusBar(
        id: id);
  }


  @override
  Future<List<int>> getAllActiveNotificationIdsOnStatusBar() {
    return _methodChannelAwesomeNotifications
        .getAllActiveNotificationIdsOnStatusBar();
  }
}
