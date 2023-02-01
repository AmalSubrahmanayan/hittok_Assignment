import 'package:flutter/material.dart';
import 'package:hittok_assignment/constants/colors/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blackcolor,
      body: Center(
          child: Text(
        "Home page",
        style: TextStyle(color: AppColors.whiteColor, fontSize: 30),
      )),
    );
  }
}
