// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, avoid_print, prefer_const_constructors_in_immutables, unused_catch_clause, unused_import, use_super_parameters

import 'package:flutter/material.dart';
import 'package:register/appData.dart';
import 'package:register/components/button.dart';
import 'package:register/components/cool_textfields.dart';
import 'package:register/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final AppData appData = AppData();
  // create controllers
  final usernameController = TextEditingController();
  final useRoleController = TextEditingController();

  final passwordController = TextEditingController();

  final fullnameController = TextEditingController();

  final phonenumberController = TextEditingController();

  // function to navigate user to LoginPage
  void sendUserToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Text(
                    "Please register to the app",
                    style: TextStyle(
                      color: Color(0xFF2B4A54),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 25),
                  MyEmailField(
                    controller: appData.fullnameController,
                    hintText: "Full name",
                  ),
                  SizedBox(height: 20),
                  MyEmailField(
                    controller: appData.phonenumberController,
                    hintText: "Phone number",
                  ),
                  SizedBox(height: 20),
                  MyUserRoleField(
                    controller: appData.useRoleController,
                    hintText: "Role",
                  ),
                  SizedBox(height: 20),
                  MyTextField(
                    controller: appData.passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),
                  SizedBox(height: 68),
                  CoolButton(
                    text: "Create account",
                    onTap: () => sendUserToLogin(context),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Login now",
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
