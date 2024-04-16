import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  // Singleton pattern
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialize the notification service
  Future<void> init() async {
    // Define the initialization settings for Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    // Set the initialization settings for both platforms
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Schedule a notification
  // Future<void> scheduleNotification(
  //     int id, String title, String body, DateTime scheduledTime) async {
  //   // Define the details for the notification
  //   const NotificationDetails notificationDetails = NotificationDetails(
  //     android: AndroidNotificationDetails('channel_id', 'channel_name',
  //         channelDescription: 'channel_description'),
  //   );

  //   // Schedule the notification
  //   await flutterLocalNotificationsPlugin.schedule(
  //       id, title, body, scheduledTime, notificationDetails);
  // }

  // Other methods like showNotification, cancelNotification, etc.
}
