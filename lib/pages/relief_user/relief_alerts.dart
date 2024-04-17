// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ReliefAlertsPage extends StatefulWidget {
  const ReliefAlertsPage({super.key});

  @override
  State<ReliefAlertsPage> createState() => _ReliefAlertsPageState();
}

class _ReliefAlertsPageState extends State<ReliefAlertsPage> {
  //  a list of messages from relief worker
  final List<Map<String, dynamic>> messages = [
    {
      'id': 1,
      'title': "Request For More Blankets",
      'message':
          "Please we need more blankets apart from the chips you are sending",
      'sender': "Gift Chris",
      'district': "Blantyre",
      'area': "Ndirande"
    },
    {
      'id': 2,
      'title': "Need For More Relief Workers",
      'message': "Send 10 more people as the work at hand is a lot",
      'sender': "Temwa Dambuleni",
      'district': "Zomba",
      'area': "Matawale"
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
            children: messages.map((message) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        message['title'],
                        style: TextStyle(
                          color: Color(0xFF2B4A54), // Title color
                          fontWeight: FontWeight.w600, // Font weight as fw400
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        message['message'],
                        style: TextStyle(
                          color: Colors.black, // Message color
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        message['sender'],
                        style: TextStyle(
                          color: Colors.black, // Sender color
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "${message['district']}, ${message['area']}",
                        style: TextStyle(
                          color: Colors.black, // Location color
                          fontWeight: FontWeight.bold, // Bold font weight
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
