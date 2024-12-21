import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/device/device_utility.dart';
import 'package:aviraldotfun/screen/payme/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = PayMeHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? PayMeColors.darkBackground : PayMeColors.white,
      child: TabBar(
          isScrollable: true,
          indicatorColor: Theme.of(context).colorScheme.primary,
          unselectedLabelColor: PayMeColors.darkGrey,
          labelColor:
              dark ? PayMeColors.white : Theme.of(context).colorScheme.primary,
          tabs: tabs),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(PayMeDeviceUtils.gePayMeAppBarHeight());
}
