import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hittok_assignment/constants/colors/app_colors.dart';
import 'package:hittok_assignment/constants/helper/loading_widget.dart';
import 'package:hittok_assignment/controller/login_controller.dart';
import 'package:hittok_assignment/view/login_screen/widgets/cutom_input_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController =
        Provider.of<LoginController>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login To Scale...',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomInputField(
                        hintText: 'Email',
                        autoFocus: false,
                        obscureText: false,
                        iconData: Icons.mail_outline,
                        controller: loginController.emailController,
                        validator: (value) =>
                            loginController.nameValidation(value),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Consumer<LoginController>(
                        builder: (context, value, child) {
                          return CustomInputField(
                            autoFocus: false,
                            hintText: 'Password',
                            obscureText: value.passwordHidden,
                            iconData: Icons.lock_outline,
                            controller: loginController.passwordController,
                            validator: (value) =>
                                loginController.passwordValidation(value),
                            suffixIcon: InkWell(
                              onTap: value.togglePassword,
                              child: value.passwordHidden
                                  ? const Icon(
                                      Icons.visibility,
                                      color: AppColors.whiteColor,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: AppColors.whiteColor,
                                    ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          Text("Forot Password",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 23)),
                        ],
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 170,
                            child: Divider(
                              thickness: 4,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "or",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 160,
                            child: Divider(
                              thickness: 4,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Consumer<LoginController>(
                        builder: (context, value, _) {
                          return value.loading == true
                              ? const LoadingWidget()
                              : ElevatedButton(
                                  onPressed: () {
                                    value.getData(context);
                                    log("message Home");
                                  },
                                  child: const Text("Login"));
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                        ),
                        onPressed: () {
                          // googleLogin();
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                image: AssetImage(
                                    "assets/images/apple-logo-png-dallas-shootings-don-add-are-speech-zones-used-4.png"),
                                height: 20.0,
                                // width: 24,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 24, right: 30),
                                child: Text(
                                  'Continue with Apple',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                        ),
                        onPressed: () {
                          // googleLogin();
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                image:
                                    AssetImage("assets/images/images (1).png"),
                                height: 20.0,
                                // width: 24,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 24, right: 30),
                                child: Text(
                                  'Continue with Google',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
