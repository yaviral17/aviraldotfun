import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class PayMeChipTheme {
  PayMeChipTheme._();

  static ChipThemeData lighPayMeChipTheme = ChipThemeData(
    disabledColor: PayMeColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: PayMeColors.black),
    selectedColor: PayMeColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: PayMeColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: PayMeColors.darkerGrey,
    labelStyle: TextStyle(color: PayMeColors.white),
    selectedColor: PayMeColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: PayMeColors.white,
  );
}
