import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class PayMeElevatedButtonTheme {
  PayMeElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lighPayMeElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: PayMeColors.light,
      backgroundColor: PayMeColors.primary,
      disabledForegroundColor: PayMeColors.darkGrey,
      disabledBackgroundColor: PayMeColors.buttonDisabled,
      side: const BorderSide(color: PayMeColors.primary),
      padding: const EdgeInsets.symmetric(vertical: PayMeSizes.buttonHeight),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PayMeSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: PayMeColors.light,
      backgroundColor: PayMeColors.primary,
      disabledForegroundColor: PayMeColors.darkGrey,
      disabledBackgroundColor: PayMeColors.darkerGrey,
      side: const BorderSide(color: PayMeColors.primary),
      padding: const EdgeInsets.symmetric(vertical: PayMeSizes.buttonHeight),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PayMeSizes.buttonRadius)),
    ),
  );
}
