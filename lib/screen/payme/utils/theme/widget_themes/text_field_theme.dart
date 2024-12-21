import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../constants/sizes.dart';

class PayMeTextFormFieldTheme {
  PayMeTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: PayMeColors.darkGrey,
    suffixIconColor: PayMeColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: PayMeSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: PayMeSizes.fontSizeMd, color: PayMeColors.black),
    hintStyle: const TextStyle().copyWith(
        fontSize: PayMeSizes.fonPayMeSizesm, color: PayMeColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: PayMeColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PayMeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: PayMeColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PayMeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: PayMeColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PayMeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: PayMeColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PayMeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: PayMeColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PayMeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: PayMeColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: PayMeColors.darkGrey,
    suffixIconColor: PayMeColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: PayMeSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: PayMeSizes.fontSizeMd, color: PayMeColors.white),
    hintStyle: const TextStyle().copyWith(
        fontSize: PayMeSizes.fonPayMeSizesm, color: PayMeColors.white),
    floatingLabelStyle:
        const TextStyle().copyWith(color: PayMeColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PayMeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: PayMeColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PayMeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: PayMeColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PayMeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: PayMeColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PayMeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: PayMeColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(PayMeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: PayMeColors.warning),
    ),
  );

  static InputDecoration smoothCurve({
    String? hintText,
    Widget? prefixIcon,
    Color? fillColor,
    TextStyle? hintStyle,
    bool isDark = false,
    Widget? suffixIcon,
  }) =>
      InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: fillColor ??
            (isDark ? PayMeColors.darkTextField : PayMeColors.lightTextField),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),

        // focusColor: Theme.of(context).colorScheme.onBackground,
      );
}
