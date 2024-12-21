import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PayMeBottomSheetTheme {
  PayMeBottomSheetTheme._();

  static BottomSheetThemeData lighPayMeBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: PayMeColors.white,
    modalBackgroundColor: PayMeColors.white,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: PayMeColors.black,
    modalBackgroundColor: PayMeColors.black,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
