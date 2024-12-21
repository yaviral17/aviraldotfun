import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class PayMeAppBarTheme {
  PayMeAppBarTheme._();

  static const lighPayMeAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: PayMeColors.black, size: PayMeSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: PayMeColors.black, size: PayMeSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: PayMeColors.black),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: PayMeColors.black, size: PayMeSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: PayMeColors.white, size: PayMeSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: PayMeColors.white),
  );
}
