// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:register/pages/relief_user/monitor_disaster.dart';
import 'package:register/pages/relief_user/relief_alerts.dart';
import 'package:register/pages/relief_user/track_relief.dart';
import 'package:register/pages/relief_user/local_user_alerts.dart';

class ReliefPage extends StatelessWidget {
  const ReliefPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2B4A54),
        title: Text(
          "Relief Worker Related Tasks",
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80),
              KNavigationButtonL(
                  targetPage: ReliefAlertsPage(),
                  message: "See Relief Worker Alerts"),
              SizedBox(height: 40),
              KNavigationButtonL(
                  targetPage: LocalUserAlertsPage(),
                  message: "See Local User Alerts"),
              SizedBox(height: 40),
              KNavigationButtonL(
                  targetPage: MonitorDisaster(), message: "Monitor Disaster"),
              SizedBox(height: 40),
              KNavigationButtonL(
                  targetPage: TrackReliefSupplies(),
                  message: "Follow Up On Relief Supplies")
            ],
          ),
        ),
      ),
    );
  }
}

class KNavigationButtonL extends StatelessWidget {
  const KNavigationButtonL({
    super.key,
    required this.targetPage,
    required this.message,
  });

  final Widget targetPage;
  final String message;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => targetPage,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.symmetric(horizontal: 35),
        decoration: BoxDecoration(
          color: Color(0xFF2B4A54),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
