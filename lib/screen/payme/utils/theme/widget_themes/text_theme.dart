import 'package:flutter/material.dart';
import '../../constants/colors.dart';

/// Custom Class for Light & Dark Text Themes
class PayMeTextTheme {
  PayMeTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lighPayMeTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: PayMeColors.dark),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: PayMeColors.dark),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: PayMeColors.dark),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: PayMeColors.dark),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: PayMeColors.dark),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: PayMeColors.dark),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: PayMeColors.dark),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: PayMeColors.dark),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: PayMeColors.dark.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: PayMeColors.dark),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: PayMeColors.dark.withOpacity(0.5)),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: PayMeColors.light),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: PayMeColors.light),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: PayMeColors.light),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: PayMeColors.light),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: PayMeColors.light),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: PayMeColors.light),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: PayMeColors.light),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: PayMeColors.light),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: PayMeColors.light.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: PayMeColors.light),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: PayMeColors.light.withOpacity(0.5)),
  );
}
