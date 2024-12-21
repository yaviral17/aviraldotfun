import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/utils/widgets/payme_primary_button_widget.dart';
import 'package:aviraldotfun/screen/payme/view/auth/signup/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PinCreatedView extends StatelessWidget {
  const PinCreatedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: PayMeSizes.figmaRatioHeight(context, 80) * -1,
            child: Lottie.asset(
              "assets/animations/Scene 10.json",
              fit: BoxFit.fitWidth,
              repeat: false,
              onLoaded: (p0) {},
              width: PayMeSizes.displayWidth(context),
            ),
          ),
          SizedBox(
            height: PayMeSizes.displayHeight(context),
            child: Column(
              children: [
                const Spacer(),
                const Spacer(),
                Center(
                  child: SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 244),
                    width: PayMeSizes.figmaRatioHeight(context, 244),
                  ),
                ),
                const Spacer(),
                Center(
                  child: SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 48),
                    width: PayMeSizes.figmaRatioWidth(context, 212),
                    child: FittedBox(
                      child: Text(
                        "pin created",
                        style: PayMeTextStyles.signUpOnboardingText,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 110),
                ),
                PayMePrimaryButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Future.delayed(const Duration(milliseconds: 100), () {
                      PayMeNavigation.to(const OTPView());
                    });
                  },
                  labelText: PayMeTexts.continue_,
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 50),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
