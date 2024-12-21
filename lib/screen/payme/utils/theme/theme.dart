import 'package:aviraldotfun/screen/payme/utils/theme/widget_themes/appbar_theme.dart';
import 'package:aviraldotfun/screen/payme/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:aviraldotfun/screen/payme/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:aviraldotfun/screen/payme/utils/theme/widget_themes/chip_theme.dart';
import 'package:aviraldotfun/screen/payme/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:aviraldotfun/screen/payme/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:aviraldotfun/screen/payme/utils/theme/widget_themes/text_field_theme.dart';
import 'package:aviraldotfun/screen/payme/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class PayMeAppTheme {
  PayMeAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: PayMeColors.grey,
    brightness: Brightness.light,
    primaryColor: PayMeColors.primary,
    textTheme: PayMeTextTheme.lighPayMeTextTheme,
    chipTheme: PayMeChipTheme.lighPayMeChipTheme,
    colorScheme: const ColorScheme.light(primary: PayMeColors.primary),
    scaffoldBackgroundColor: PayMeColors.offLight,
    appBarTheme: PayMeAppBarTheme.lighPayMeAppBarTheme,
    checkboxTheme: PayMeCheckboxTheme.lighPayMeCheckboxTheme,
    bottomSheetTheme: PayMeBottomSheetTheme.lighPayMeBottomSheetTheme,
    elevatedButtonTheme: PayMeElevatedButtonTheme.lighPayMeElevatedButtonTheme,
    outlinedButtonTheme: PayMeOutlinedButtonTheme.lighPayMeOutlinedButtonTheme,
    inputDecorationTheme: PayMeTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: PayMeColors.grey,
    brightness: Brightness.dark,
    primaryColor: PayMeColors.primary,
    textTheme: PayMeTextTheme.darkTextTheme,
    chipTheme: PayMeChipTheme.darkChipTheme,
    scaffoldBackgroundColor: PayMeColors.dark,
    colorScheme: const ColorScheme.dark(primary: PayMeColors.primary),
    appBarTheme: PayMeAppBarTheme.darkAppBarTheme,
    checkboxTheme: PayMeCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: PayMeBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: PayMeElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: PayMeOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: PayMeTextFormFieldTheme.darkInputDecorationTheme,
  );
}
