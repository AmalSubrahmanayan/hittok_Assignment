import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hittok_assignment/controller/login_service.dart';
import 'package:hittok_assignment/view/home_screen/home_screen.dart';

class LoginController with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passwordHidden = true;
  bool loading = false;
  FlutterSecureStorage storage = const FlutterSecureStorage();
  FlutterSecureStorage name = const FlutterSecureStorage();

  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter correct email';
    } else {
      return null;
    }
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the password';
    } else if (value.length < 6) {
      return 'The password must contain atleast 6 charactors';
    } else {
      return null;
    }
  }

  void togglePassword() {
    passwordHidden = !passwordHidden;
    notifyListeners();
  }

  void login(BuildContext context) async {
    loading = true;
    notifyListeners();
    await LoginService()
        .login(emailController.text, passwordController.text)
        .then((value) {
      log(value.toString());

      if (value != null) {
        print("hgvd");
        storage.write(key: 'Token', value: value);
        log(value.toString());

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
        loading = false;
        notifyListeners();
      } else {
        log('value null');
        loading = false;
        notifyListeners();
      }
    });
  }
}
