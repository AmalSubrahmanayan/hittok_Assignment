import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hittok_assignment/view/login_screen/login_page.dart';

class OnBoardProvider with ChangeNotifier {
  late PageController pageController;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  void toSignInScreen(context) async {
    await storage.write(key: 'onboard', value: 'completed');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ));
  }
}
