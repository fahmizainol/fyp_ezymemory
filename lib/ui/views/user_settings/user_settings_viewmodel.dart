import 'package:fyp_ezymemory/services/notification_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';

class UserSettingsViewModel extends BaseViewModel {
  final NotificationService _notificationService =
      locator<NotificationService>();

  Future testNotiButton() async {
    print('noti will appear at 245pm');
    await _notificationService.schedulePeriodicNotifications();
    // _notificationService.showNotificationWithNoTitle();
  }
}
