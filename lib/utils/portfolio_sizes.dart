import 'dart:developer';

import 'package:flutter/material.dart';

class ASizes {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 650;
  }

  static double arw(BuildContext context, double size) {
    double returnWidth = MediaQuery.of(context).size.width * (size / 1440);
    log('returnWidth: $returnWidth , current width: ${MediaQuery.of(context).size.width}');
    return returnWidth;
  }

  static double arh(BuildContext context, double size) {
    return MediaQuery.of(context).size.height * (size / 2960);
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
