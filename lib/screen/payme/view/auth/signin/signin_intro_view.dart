import 'dart:developer';

import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/view/auth/signup/phone_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignInIntroView extends StatefulWidget {
  const SignInIntroView({super.key});

  @override
  State<SignInIntroView> createState() => _SignInIntroViewState();
}

class _SignInIntroViewState extends State<SignInIntroView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      PayMeNavigation.to(const PhoneView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                  "Welcome back\nto PayME",
                  textAlign: TextAlign.center,
                  style: PayMeTextStyles.signUpOnboardingText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
