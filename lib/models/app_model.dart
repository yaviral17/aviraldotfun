import 'package:flutter/material.dart';

/// In this class we have to ensure that icon or assetPath one is given only
class AppModel {
  String title;
  String? assetPath;
  IconData? icon;
  Color backgroundColor;
  Color iconColor;
  Widget? screen;
  String? link;

  AppModel({
    required this.title,
    required this.backgroundColor,
    required this.iconColor,
    this.assetPath,
    this.icon,
    this.link,
    this.screen,
  }) : assert(icon == null || assetPath == null);
}
