import 'package:flutter/cupertino.dart';
import 'package:hittok_assignment/constants/colors/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: AppColors.redColor,
        size: 33,
        secondRingColor: AppColors.redColor,
        thirdRingColor: AppColors.whiteColor,
      ),
    );
  }
}
