import 'package:flutter/foundation.dart';

class AlertProvider with ChangeNotifier {
  List<Map<String, dynamic>> _alerts = [];

  List<Map<String, dynamic>> get alerts => _alerts;

  void addNotification(Map<String, dynamic> alert) {
    _alerts.add(alert);
    notifyListeners();
  }
}
