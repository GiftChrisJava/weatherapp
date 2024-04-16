import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  late FlutterLocalNotificationsPlugin localNotification;

  @override
  void initState() {
    super.initState();
    var androidInitialize = const AndroidInitializationSettings('app_icon');
    var initializationSettings =
        InitializationSettings(android: androidInitialize);
    localNotification = FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);
  }

  Future showNotification() async {
    var androidDetails = const AndroidNotificationDetails(
        "channelId", "Local Notification",
        channelDescription: "This is the description of the Notification",
        importance: Importance.high);
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails);

    await localNotification.show(0, "Notification Title",
        "The body of the Notification", generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alerts Management"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Text("All alerts will be here"),
      )),
      floatingActionButton: IconButton(
        icon: Icon(Icons.notification_add),
        onPressed: showNotification,
      ),
    );
  }
}
