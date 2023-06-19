import 'package:fyp_ezymemory/services/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class UserSettingsViewModel extends FutureViewModel {
  final NotificationService _notificationService =
      locator<NotificationService>();
  final DialogService _dialogService = locator<DialogService>();

  DateTime? reminderTime;
  SharedPreferences? prefs;

  @override
  Future futureToRun() => fetchReminderTime();

  Future fetchReminderTime() async {
    prefs = await SharedPreferences.getInstance();
    print(prefs!.getInt('hour'));
    print(prefs!.getInt('minute'));
    try {
      reminderTime = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          prefs!.getInt('hour') ?? 0,
          prefs!.getInt('minute') ?? 0,
          0);
    } catch (e) {
      reminderTime = DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 0, 0, 0);
    }
  }

  void changeReminderTime(DateTime? val) {
    print(val!.hour);
    reminderTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, val.hour, val.minute, 0);
  }

  Future updateReminder() async {
    print(reminderTime!.hour);
    await _notificationService.schedulePeriodicNotifications(
        hour: reminderTime!.hour, minute: reminderTime!.minute);

    // update shared preferences
    await prefs!.setInt('hour', reminderTime!.hour);
    await prefs!.setInt('minute', reminderTime!.minute);
    await _dialogService.showDialog(
        title: "Successfully updated reminder time!");
    // _notificationService.showNotificationWithNoTitle();
  }
}
