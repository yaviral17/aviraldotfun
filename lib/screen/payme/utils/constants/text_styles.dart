import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayMeTextStyles {
  static const TextStyle primaryButtonText = TextStyle(
    fontSize: 20,
    color: PayMeColors.dark,
    fontFamily: PayMeTexts.fontMontserrat,
    fontWeight: FontWeight.w400,
  );

  // Sign up onboarding screens text style
  static TextStyle signUpOnboardingText = TextStyle(
    fontFamily: PayMeTexts.fontManjari,
    fontSize: 72,
    color: PayMeColors.text(Get.context!),
    fontWeight: FontWeight.w700,
  );

  // pick profile screen dialog box text style for bottom navigation
  static const TextStyle bottomNavButtonText = TextStyle(
    fontFamily: PayMeTexts.fontMontserrat,
    fontSize: 14,
    color: PayMeColors.black,
    fontWeight: FontWeight.w600,
  );

  // home page text style
  static const TextStyle homeScreenTextStyle = TextStyle(
    fontFamily: PayMeTexts.fontMontserrat,
    fontSize: 24,
    color: PayMeColors.white,
    letterSpacing: 1,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle defaultPrimaryStyle = TextStyle(
    fontFamily: PayMeTexts.fontMontserrat,
    fontSize: 16,
    color: PayMeColors.white,
    fontWeight: FontWeight.w400,
  );
}
