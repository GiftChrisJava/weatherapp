import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:register/dummy_data/dummy_data.dart';
import 'package:register/pages/alerts/alert_form.dart';

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

  // List of dummy disaster notifications for Malawi
  List<Map<String, String>> dummyNotifications = DummyData.dummyNotifications;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alerts Management"),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       icon: const Icon(Icons.add_alert),
        //       onPressed: () => Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => NotificationForm())))
        // ],
      ),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.notification_add),
        onPressed: showNotification,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyNotifications.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(dummyNotifications[index]['title']!),
              titleTextStyle: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium!
                  .copyWith(
                      color: Color(0xFF2B4A54),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
              subtitle: Text(dummyNotifications[index]['subtitle']!),
            );
          },
        ),
      ),
    );
  }
}
