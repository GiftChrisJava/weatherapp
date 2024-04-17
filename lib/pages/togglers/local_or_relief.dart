import 'package:flutter/material.dart';
import 'package:register/pages/relief_user/relief_page.dart';
import 'package:register/pages/weather_page.dart';

class LocalUserOrReliefWorker extends StatefulWidget {
  const LocalUserOrReliefWorker({super.key});

  @override
  State<LocalUserOrReliefWorker> createState() =>
      _LocalUserOrReliefWorkerState();
}

class _LocalUserOrReliefWorkerState extends State<LocalUserOrReliefWorker> {
  // initially show a login page
  bool isReliefWorker = true;

  @override
  Widget build(BuildContext context) {
    if (isReliefWorker) {
      return ReliefPage();
    } else {
      return weatherPage();
    }
  }
}
