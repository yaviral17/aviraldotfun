import 'dart:developer';

import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/view/auth/signup/name_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      PayMeNavigation.to(const NameView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {},
        child: Stack(
          children: [
            Lottie.asset(
              "assets/animations/Scene 2.json",
              fit: BoxFit.fitWidth,
              repeat: false,
              width: PayMeSizes.displayWidth(context),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 84),
                child: FittedBox(
                  child: Text(
                    PayMeTexts.introductionFirst,
                    textAlign: TextAlign.center,
                    style: PayMeTextStyles.signUpOnboardingText,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
