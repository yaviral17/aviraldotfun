import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/device/device_utility.dart';
import 'package:aviraldotfun/screen/payme/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PayMeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PayMeAppBar({
    super.key,
    this.title,
    this.showBackArrow = true,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.leadingIconColor,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final Color? leadingIconColor;

  @override
  Widget build(BuildContext context) {
    final dark = PayMeHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PayMeSizes.xs),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: leadingIconColor ??
                      (dark ? PayMeColors.light : PayMeColors.dark),
                ))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed,
                    icon: Icon(
                      leadingIcon,
                      color: leadingIconColor ??
                          (dark ? PayMeColors.light : PayMeColors.dark),
                    ))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(PayMeDeviceUtils.gePayMeAppBarHeight());
}
