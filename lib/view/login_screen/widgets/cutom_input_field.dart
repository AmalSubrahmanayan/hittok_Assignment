import 'package:flutter/material.dart';
import 'package:hittok_assignment/constants/colors/app_colors.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    required this.hintText,
    required this.iconData,
    required this.controller,
    required this.validator,
    this.keyBoardType,
    this.suffixIcon,
    required this.autoFocus,
    required this.obscureText,
  });

  final String hintText;
  final IconData? iconData;
  final TextInputType? keyBoardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyBoardType,
      autofocus: autoFocus,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 12),
        prefixIcon: Icon(
          iconData,
          color: AppColors.whiteColor,
        ),
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(
            color: AppColors.whiteColor,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
