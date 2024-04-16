class NotificationModel {
  final int id;
  final String title;
  final String body;
  final String payload; 
  final DateTime scheduledTime;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    this.payload = '',
    required this.scheduledTime,
  });

  // You can also add a method to convert the model to the format required by the notification plugin
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'payload': payload,
      'scheduledTime': scheduledTime.toIso8601String(),
    };
  }
}
