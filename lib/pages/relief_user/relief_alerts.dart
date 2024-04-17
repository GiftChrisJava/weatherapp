// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:register/pages/relief_user/alertDetails.dart';

class ReliefAlertsPage extends StatefulWidget {
  const ReliefAlertsPage({super.key});

  @override
  State<ReliefAlertsPage> createState() => _ReliefAlertsPageState();
}

class _ReliefAlertsPageState extends State<ReliefAlertsPage> {
  //  a list of messages from relief worker
  final List<Map<String, dynamic>> alerts = [
    {
      'id': 1,
      'title': "Request For More Blankets",
      'message':
          "Please we need more blankets apart from the chips you are sending",
      'sender': "Gift Chris",
      'district': "Blantyre",
      'area': "TA Kapeni"
    },
    {
      'id': 2,
      'title': "Need For More Relief Workers",
      'message': "Send 10 more people as the work at hand is a lot",
      'sender': "Temwa Dambuleni",
      'district': "Zomba",
      'area': "TA Kapeni"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2B4A54),
        title: Text(
          "Messages from fellow relief workers",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[350],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: alerts.map((alert) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AlertDetails(alert: alert))),
                child: getAlertCard(alert),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

Card getAlertCard(Map<String, dynamic> alert) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            alert['title'],
            style: TextStyle(
              color: Color(0xFF2B4A54), // Title color
              fontWeight: FontWeight.w600, // Font weight as fw400
              fontSize: 18,
            ),
          ),
          SizedBox(height: 4),
          Text(
            alert['message'],
            style: TextStyle(
              color: Colors.black, // Message color
            ),
          ),
          SizedBox(height: 16),
          Text(
            alert['sender'],
            style: TextStyle(
              color: Colors.black, // Sender color
            ),
          ),
          SizedBox(height: 4),
          Text(
            "${alert['district']}, ${alert['area']}",
            style: TextStyle(
              color: Colors.black, // Location color
              fontWeight: FontWeight.bold, // Bold font weight
            ),
          ),
        ],
      ),
    ),
  );
}
