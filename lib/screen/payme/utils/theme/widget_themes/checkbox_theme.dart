import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/// Custom Class for Light & Dark Text Themes
class PayMeCheckboxTheme {
  PayMeCheckboxTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static CheckboxThemeData lighPayMeCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(PayMeSizes.xs)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return PayMeColors.white;
      } else {
        return PayMeColors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return PayMeColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );

  /// Customizable Dark Text Theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(PayMeSizes.xs)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return PayMeColors.white;
      } else {
        return PayMeColors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return PayMeColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
