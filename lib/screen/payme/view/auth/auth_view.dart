import 'dart:developer';

import 'package:aviraldotfun/screen/payme/utils/constants/animation_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/image_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/widgets/payme_primary_button_widget.dart';
import 'package:aviraldotfun/screen/payme/view/auth/signin/signin_intro_view.dart';
import 'package:aviraldotfun/screen/payme/view/auth/signup/intro_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool isContinuePressed = false;

  void continueButtonPressed() {
    PayMeNavigation.to(const IntroView());
  }

  void signInButtonPressed() {
    if (isContinuePressed) return;
    isContinuePressed = true;

    PayMeNavigation.to(const SignInIntroView());
    isContinuePressed = false;
  }

  @override
  Widget build(BuildContext context) {
    isContinuePressed = false;
    return Scaffold(
        body: PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: const Text('Exit PayMe? 😢'),
              content: const Text('Are you sure you want to exit?'),
              actions: [
                CupertinoDialogAction(
                  child: const Text('OK'),
                  onPressed: () {
                    PayMeNavigation.to(AuthView());
                  },
                ),
                CupertinoDialogAction(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: PayMeColors.error,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Stack(
        children: [
          Center(
            child: Lottie.asset(
              PayMeAnimations.authViewBackground,
              fit: BoxFit.fitWidth,
              width: PayMeSizes.displayWidth(context),
              height: PayMeSizes.displayHeight(context),
              repeat: false,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              PayMeImages.hello,
              width: PayMeSizes.figmaRatioWidth(context, 224),
              fit: BoxFit.fitWidth,
              color: PayMeColors.text(context),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Continue button
                PayMePrimaryButton(
                  labelText: PayMeTexts.continue_,
                  onPressed: () => continueButtonPressed(),
                ),

                const SizedBox(height: PayMeSizes.md),

                // Sign in button
                PayMePrimaryButton(
                  labelText: PayMeTexts.alreadyHaveAnAccount,
                  labelFontSize: PayMeSizes.figmaRatioWidth(context, 16),
                  onPressed: () => signInButtonPressed(),
                ),

                const SizedBox(height: PayMeSizes.lg),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
