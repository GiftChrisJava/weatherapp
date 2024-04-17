// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TrackReliefSupplies extends StatefulWidget {
  const TrackReliefSupplies({super.key});

  @override
  State<TrackReliefSupplies> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TrackReliefSupplies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2B4A54),
        title: Text(
          "Select Area to To Track Relief Supplies",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[350],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [],
          ),
        ),
      ),
    );
  }
}
