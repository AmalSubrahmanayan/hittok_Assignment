import 'package:flutter/material.dart';
import 'package:hittok_assignment/constants/colors/app_colors.dart';
import 'package:hittok_assignment/constants/textstyles/app_textstyles.dart';
import 'package:hittok_assignment/controller/onboard_controller.dart';
import 'package:provider/provider.dart';

import 'util/onboard_model_list.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_indicator.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardProvider =
        Provider.of<OnBoardProvider>(context, listen: false);
    onBoardProvider.pageController = PageController();
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          controller: onBoardProvider.pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: OnboardList().onboardList.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.6,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: AppColors.welcomeScreenBgColor,
                    image: DecorationImage(
                      image: AssetImage(
                        OnboardList().onboardList[index].imagePath,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: size.width,
                    decoration:
                        const BoxDecoration(color: AppColors.backgroundColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          OnboardList().onboardList[index].bodyText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        CustomIndicatorWidget(
                          index: index,
                          activeColor: AppColors.whiteColor,
                          count: 3,
                          inactiveColor: AppColors.welcomeScreenBgColor,
                        ),
                        index == 2
                            ? const SizedBox()
                            : TextButton(
                                onPressed: () =>
                                    onBoardProvider.toSignInScreen(context),
                                child: const Text(
                                  'Skip',
                                  style: AppTextStyles.textStyle3,
                                ),
                              ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CustomButtonOne(
                            text: OnboardList().onboardList[index].buttonText,
                            onTap: () {
                              if (index < 2) {
                                onBoardProvider.pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.slowMiddle,
                                );
                              } else {
                                onBoardProvider.toSignInScreen(context);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
