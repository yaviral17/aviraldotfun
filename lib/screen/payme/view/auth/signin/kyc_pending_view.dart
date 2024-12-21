import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/utils/widgets/payme_primary_button_widget.dart';
import 'package:aviraldotfun/screen/payme/view/auth/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class KycPendingView extends StatelessWidget {
  const KycPendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: PayMeSizes.figmaRatioHeight(context, 200),
            child: Transform.scale(
              scale: 1.5,
              child: Lottie.asset(
                "assets/animations/Scene 17.json",
                fit: BoxFit.fitWidth,
                repeat: true,
                width: PayMeSizes.displayWidth(context),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: PayMeSizes.figmaRatioWidth(context, 300),
                  height: PayMeSizes.figmaRatioHeight(context, 100),
                  child: FittedBox(
                    child: Text(
                      "your KYC is still\npending",
                      textAlign: TextAlign.center,
                      style: PayMeTextStyles.signUpOnboardingText,
                    ),
                  ),
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 120),
                ),
                PayMePrimaryButton(
                  labelText: "Go Back to Home",
                  onPressed: () {
                    PayMeNavigation.to(const AuthView());
                  },
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 20),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
