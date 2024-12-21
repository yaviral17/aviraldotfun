import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:flutter/material.dart';

class ConfirmExitSignUpView extends StatelessWidget {
  const ConfirmExitSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: PayMeSizes.figmaRatioWidth(context, 351),
            height: PayMeSizes.figmaRatioHeight(context, 100),
            child: Text(
              "do you want to\ncancel signing up ?",
              style: PayMeTextStyles.signUpOnboardingText,
            ),
          ),
        ],
      ),
    );
  }
}
