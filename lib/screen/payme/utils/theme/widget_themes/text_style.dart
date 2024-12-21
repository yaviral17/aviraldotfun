import 'package:flutter/material.dart';

enum AppFont {
  Poppins,
  Roboto,
  Lato,
  Montserrat,
}

extension AppFontExtension on AppFont {
  String get value {
    switch (this) {
      case AppFont.Poppins:
        return 'Poppins';
      case AppFont.Roboto:
        return 'Roboto';
      case AppFont.Lato:
        return 'Lato';
      case AppFont.Montserrat:
        return 'Montserrat';
    }
  }
}

Text AppText({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? letterSpacing,
  double? wordSpacing,
  double? height,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
  String fontFamily = 'Poppins',
  List<Shadow>? shadows,
  required String text,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      fontFamily: fontFamily,
      shadows: shadows,
    ),
  );
}
