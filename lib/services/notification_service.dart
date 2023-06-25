import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  //instance of FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  SharedPreferences? prefs;

  Future<void> init() async {
    //Initialization Settings for Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    prefs = await SharedPreferences.getInstance();

    //Initializing settings for both platforms (Android & iOS)
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    if (prefs!.containsKey('hour') && prefs!.containsKey('minute')) {
      await schedulePeriodicNotifications(
          hour: prefs!.getInt('hour'), minute: prefs!.getInt('minute'));
    }

    // bool CheckValue = prefs.containsKey('value');
  }

  // void onDidReceiveNotificationResponse(
  //     NotificationResponse notificationResponse) async {
  //   final String? payload = notificationResponse.payload;
  //   if (notificationResponse.payload != null) {
  //     debugPrint('notification payload: $payload');
  //   }
  //   await Navigator.push(
  //     context,
  //     MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
  //   );
  // }

  requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> showNotifications({id, title, body, payload}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin
        .show(id, title, body, platformChannelSpecifics, payload: payload);
  }

  Future<void> showNotificationWithNoTitle() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await flutterLocalNotificationsPlugin
        .show(0, null, 'plain body', notificationDetails, payload: 'item x');
  }

  Future<void> schedulePeriodicNotifications({hour, minute}) async {
    // var dt = DateTime(DateTime.now().year, DateTime.now().month,
    //     DateTime.now().day, 22, 17, 0);
    // var dte = tz.TZDateTime.from(dt, tz.local);
    // if (hour.isNull || minute.isNull) {
    //   hour = 0;
    //   minute = 0;
    // }
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'It\'s time for your daily lesson!',
        'Don\'t miss out on your daily lesson!',
        // _nextInstanceOfTenAM(),
        tz.TZDateTime.from(_nextInstanceOfTime(hour, minute), tz.local),
        // tz.TZDateTime.from(dt, tz.local),
        // dt,
        const NotificationDetails(
          android: AndroidNotificationDetails('daily notification channel id',
              'daily notification channel name',
              channelDescription: 'daily notification description',
              importance: Importance.max,
              priority: Priority.max),
        ),
        // androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        androidAllowWhileIdle: true);
  }

  DateTime _nextInstanceOfTime(hour, minute) {
    DateTime dtNow = DateTime.now();
    DateTime dtScheduled = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hour, minute, 0);

    if (dtScheduled.isBefore(dtNow)) {
      dtScheduled = dtScheduled.add(const Duration(days: 1));
    }

    return dtScheduled;
  }

  //   Future<void> _scheduleDailyTenAMLastYearNotification() async {
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //       0,
  //       'daily scheduled notification title',
  //       'daily scheduled notification body',
  //       _nextInstanceOfTenAMLastYear(),
  //       const NotificationDetails(
  //         android: AndroidNotificationDetails('daily notification channel id',
  //             'daily notification channel name',
  //             channelDescription: 'daily notification description'),
  //       ),
  //       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime,
  //       matchDateTimeComponents: DateTimeComponents.time);
  // }

  Future<void> scheduleNotifications({id, title, body, time}) async {
    try {
      await flutterLocalNotificationsPlugin.zonedSchedule(
          id,
          title,
          body,
          tz.TZDateTime.from(time, tz.local),
          const NotificationDetails(
              android: AndroidNotificationDetails(
                  'your channel id', 'your channel name',
                  channelDescription: 'your channel description')),
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
    } catch (e) {
      print(e);
    }
  }
}
