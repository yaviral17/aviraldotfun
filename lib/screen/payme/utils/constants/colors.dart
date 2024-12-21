import 'package:aviraldotfun/screen/payme/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class PayMeColors {
  // App theme colors
  static const Color primary = Color(0xFF4b68ff);

  static const Color transparent = Colors.transparent;

  static const Color offDark = Color(0xFF1A1A1A);
  static const Color offLight = Color(0xFFF5FAFF);
  static Color offColor(BuildContext context) {
    return PayMeHelperFunctions.isDarkMode(context) ? offDark : offLight;
  }

  // Text colors
  static const Color textLight = Color(0xff000000);
  static const Color textDark = Color(0xffFFFFFF);
  static Color text(BuildContext context) {
    return PayMeHelperFunctions.isDarkMode(context) ? textDark : textLight;
  }

  static Color invertedText(BuildContext context) {
    return PayMeHelperFunctions.isDarkMode(context) ? textLight : textDark;
  }

  // static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondaryDark = Color(0xFF6C757D);
  static const Color textSecondaryLight = Color(0xFF6C757D);
  static Color textSecondary(BuildContext context) {
    return PayMeHelperFunctions.isDarkMode(context)
        ? textSecondaryDark
        : textSecondaryLight;
  }

  // static const Color textWhite = Colors.white;
  static const Color offWhite = Color(0xFFF5F7FB);

  // text field colors
  static const Color lightTextField = Color(0xFFF1F1F1);
  static const Color darkTextField = Color(0xFF161515);
  static Color textField(BuildContext context) {
    return PayMeHelperFunctions.isDarkMode(context)
        ? darkTextField
        : lightTextField;
  }

  // border colors
  static const Color lightBorder = Color(0xFFE0E0E0);
  static const Color darkBorder = Color(0xFF161515);

  static Color border(BuildContext context) {
    return !PayMeHelperFunctions.isDarkMode(context) ? darkBorder : lightBorder;
  }

  // Background colors
  static const Color light = Color(0xFFF5F7FB);
  // static const Color dark = Color(0xFF272727);
  static const Color dark = Color(0xFF000000);
  static const Color primaryBackground = Color(0xFFF3F5FF);
  static const Color darkBackground = Colors.black12;

  // Light and Dark Background colors
  static const Color lightBackground = Color(0xFFEBEFFF);
  static const Color lightDarkBackground = Color(0xFF172F53);
  static Color background(BuildContext context) {
    return PayMeHelperFunctions.isDarkMode(context)
        ? darkBackground
        : lightBackground;
  }

  // Background Container colors
  static const Color lightContainer = Color(0xFFF5F7FB);
  static Color darkContainer = PayMeColors.white.withOpacity(0.1);

  // Button colors
  static const Color buttonPrimaryLight = Color(0xffffffff);
  static const Color buttonPrimaryDark = Color(0xff000000);
  static Color buttonPrimary(BuildContext context) {
    return !PayMeHelperFunctions.isDarkMode(context)
        ? buttonPrimaryDark
        : buttonPrimaryLight;
  }

  static Color buttonSecondaryDark = const Color(0xFFD9D9D9).withOpacity(0.3);
  static Color buttonSecondaryLight = const Color.fromARGB(255, 114, 114, 114);
  static Color buttonSecondary(BuildContext context) {
    return PayMeHelperFunctions.isDarkMode(context)
        ? buttonSecondaryDark
        : buttonSecondaryLight;
  }

  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  //  home view
  static const Color homeViewAppBarBackgroundShade1 = Color(0xff00664F);
  static const Color homeViewAppBarBackgroundShade2 = Color(0xff1EA184);

  // navigation menu
  static const Color navigationBottomNavBg = Color(0xffCFFFC5);
  static const Color navigationBottomNavItemSelected = Color(0xffFF7648);
  static const Color navigationBottomNavItemNotSelected = Color(0xff88889D);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);

  // Bottom bar colors
  static const Color lightBottomBar = Color(0xFFE0E0E0);
  static const Color darkBottomBar = Color(0xFF1A1919);
  static Color bottomBar(BuildContext context) {
    return PayMeHelperFunctions.isDarkMode(context)
        ? darkBottomBar
        : lightBottomBar;
  }

  // // bottom nav item colors
  // static const Color lightBottomNavItemActive = Color(0xFF4b68ff);
  // static const Color darkBottomNavItemActive = Color(0xFF4b68ff);
  // static Color bottomNavItemActive(BuildContext context) {
  //   return PayMeHelperFunctions.isDarkMode(context)
  //       ? darkBottomNavItemActive
  //       : lightBottomNavItemActive;
  // }

  // static const Color lightBottomNavItemInactive = Color(0xFF6C757D);
  // static const Color darkBottomNavItemInactive = Color(0xFF6C757D);
  // static Color bottomNavItemInactive(BuildContext context) {
  //   return PayMeHelperFunctions.isDarkMode(context)
  //       ? darkBottomNavItemInactive
  //       : lightBottomNavItemInactive;
  // }

  // primary button colors
  static const Color primaryButton1 = Color(0xFFD9D9D9);
  static const Color primaryButton2 = Color(0xFFF58D83);

  // primary text colors
  static const Color primaryText1 = Color(0xFF636363);

  // star rating colors
  static const Color starRating = Color.fromARGB(255, 255, 239, 8);

  /// home screen
  static const homeScreenTransferButton = Color(0xffEF4680);
  static const homeScreenRecieveButton = Color(0xffF58D83);
  static const homeScreenFundsButton = Color(0xffFEC87F);
  static const homeScreenScanQRButton = Color(0xff78CDD1);

  // balance screen
  static const balanceUpArrow = Color(0xffEF4680);
  static const balanceDownArrow = Color(0xff78CDD1);

  // transaction screen
  static const transferScreenCircleAvatar = Color(0xffFF81A2);
  static const transferTextFieldColor = Color(0xffEF4680);
  static const recieveTextFieldColor = Color(0xff78CDD1);

  // locked balance screen
  static const lockedBalanceScreenCardWidget = Color(0xffF58D83);

  // chat screen
  static Color chatTile = const Color(0xffC0BEFC);
  static Color paymentSentTile = const Color(0xffEF4680);
  static Color paymentRecieveTile = const Color(0xff78CDD1);
}
