// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:register/appData.dart';
import 'package:register/components/button.dart';
import 'package:register/components/cool_textfields.dart';
import 'package:register/pages/weather_page.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AppData appData = AppData();

  // create controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final useRoleController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2B4A54)),
          ),
        );
      },
    );

    // pop the loading circle
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => weatherPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2B4A54),
        title: Text(
          "Sign in to system",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[350],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80),
                  SizedBox(height: 80),
                  MyEmailField(
                    controller: appData.usernameController,
                    hintText: "Username / dzina",
                  ),
                  SizedBox(height: 40),
                  MyTextField(
                    controller: appData.passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  SizedBox(height: 50),
                  CoolButton(text: "Sign in", onTap: () => signUserIn()),
                  SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member?",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "create account",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
