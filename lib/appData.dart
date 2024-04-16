// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AppData {
  static final AppData _instance = AppData._internal();

  factory AppData() {
    return _instance;
  }

  AppData._internal();

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController useRoleController = TextEditingController();

  TextEditingController fullnameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // Add other controllers or data you want to share here
}
