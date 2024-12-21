import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class KycVerifiedView extends StatefulWidget {
  const KycVerifiedView({super.key});

  @override
  State<KycVerifiedView> createState() => _KycVerifiedViewState();
}

class _KycVerifiedViewState extends State<KycVerifiedView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      PayMeNavigation.to(const HomeView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: PayMeSizes.figmaRatioHeight(context, 60) * -1,
            child: Transform.scale(
              scale: 1,
              child: Lottie.asset(
                "assets/animations/Scene 16.json",
                fit: BoxFit.fitWidth,
                repeat: false,
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
                      "your KYC has\nbeen verified !!",
                      textAlign: TextAlign.center,
                      style: PayMeTextStyles.signUpOnboardingText,
                    ),
                  ),
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 120),
                ),
                SizedBox(
                  width: PayMeSizes.figmaRatioWidth(context, 300),
                  child: FittedBox(
                    child: Text(
                      "The application is under development\nwe will notify you once it's avilable",
                      textAlign: TextAlign.center,
                      style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                        color: PayMeColors.transparent,
                      ),
                    ),
                  ),
                ),
                // const PayMePrimaryButton(
                //   labelText: PayMeTexts.continue_,
                //   // onPressed: () => continueButtonPressed(authController),
                // ),
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
