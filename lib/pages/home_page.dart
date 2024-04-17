// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:register/pages/togglers/login_or_register.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // Navigate to AuthPage
                print("pressed");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginOrRegister(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(17),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Color(0xFF2B4A54),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
