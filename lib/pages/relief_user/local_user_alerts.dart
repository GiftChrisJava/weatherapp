// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LocalUserAlertsPage extends StatefulWidget {
  const LocalUserAlertsPage({super.key});

  @override
  State<LocalUserAlertsPage> createState() => _LocalUserAlertsPage();
}

class _LocalUserAlertsPage extends State<LocalUserAlertsPage> {
  //  a list of messages from relief a local user
  final List<Map<String, dynamic>> messages = [
    {
      'id': 1,
      'title': "Kugwa kwa manyumba kamba ka Mvula",
      'message':
          "Kudera kwathu kuno Mvula yagwa yambiri ndipo manyumba agwa ochuluka",
      'sender': "Bambo a Jane",
      'district': "Balaka",
      'area': "Chingeni"
    },
    {
      'id': 2,
      'title': "Tabeledwa Zofunda",
      'message': "Akatundu munatumiza aja atibera onse kuno",
      'sender': "Jailosi",
      'district': "Zomba",
      'area': "Chinamwali"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2B4A54),
        title: Text(
          "Messages from the locals",
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
