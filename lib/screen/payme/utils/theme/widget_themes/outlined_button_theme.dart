import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class PayMeOutlinedButtonTheme {
  PayMeOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lighPayMeOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: PayMeColors.dark,
      side: const BorderSide(color: PayMeColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: PayMeSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PayMeSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: PayMeColors.light,
      side: const BorderSide(color: PayMeColors.borderPrimary),
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: PayMeSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PayMeSizes.buttonRadius)),
    ),
  );
}
