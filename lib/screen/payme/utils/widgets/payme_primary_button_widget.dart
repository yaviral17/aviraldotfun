import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class PayMePrimaryButton extends StatelessWidget {
  /// [child] is the widget that will be displayed inside the button
  final Widget? child;

  /// [width] is the width of the button
  final double? width;

  /// [height] is the height of the button
  final double? height;

  /// [color] is the color of the button
  final Color? color;

  /// [onPressed] is the function that will be called when the button is pressed
  final Function()? onPressed;

  /// If [isLoading] is true, it will show a loading indicator instead of the child widget
  final bool? isLoading;

  /// If you provide [labelText], it will override the child widget
  final String? labelText;

  /// [labelColor] is the color of the label text
  final Color? labelColor;

  /// [labelFontSize] is the font size of the label text
  final double? labelFontSize;

  /// [labelFontWeight] is the font weight of the label text
  final FontWeight? labelFontWeight;

  /// [borderRadius] is the border radius of the button
  final BorderRadius? borderRadius;

  /// [border] is the border of the button
  final Border? border;

  /// [isDisabled] is the state of the button which will disable [onPressed] function and override the [color] of the button and add a [border] to the button
  final bool? isDisabled;

  /// [padding] is the padding of the button
  final EdgeInsets? padding;

  const PayMePrimaryButton({
    super.key,
    this.child,
    this.width,
    this.height,
    this.color,
    this.onPressed,
    this.isLoading = false,
    this.labelText,
    this.labelColor,
    this.labelFontSize,
    this.labelFontWeight,
    this.borderRadius,
    this.border,
    this.isDisabled = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return isDisabled == true
        ? button(context)
        : ZoomTapAnimation(
            onTap: () {
              HapticFeedback.lightImpact();
              onPressed?.call();
            },
            begin: 1.0,
            end: 0.96,
            child: button(context),
          );
  }

  Widget button(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      height: height ??
          PayMeSizes.figmaRatioHeight(context, PayMeSizes.primaryButtonHeight),
      width: width ??
          PayMeSizes.figmaRatioWidth(context, PayMeSizes.primaryButtonWidth),
      padding: padding ??
          EdgeInsets.symmetric(
            vertical: PayMeSizes.figmaRatioHeight(context, 4),
          ),
      decoration: BoxDecoration(
        color: isDisabled == true
            ? PayMeColors.buttonSecondary(context)
            : color ??
                (PayMeHelperFunctions.isDarkMode(context)
                    ? PayMeColors.buttonPrimaryLight
                    : null),
        gradient: PayMeHelperFunctions.isDarkMode(context)
            ? null
            : isDisabled == true
                ? Gradient.lerp(
                    LinearGradient(
                      colors: [
                        PayMeColors.homeScreenFundsButton.withOpacity(0.4),
                        PayMeColors.homeScreenRecieveButton.withOpacity(0.4),
                        PayMeColors.homeScreenTransferButton.withOpacity(0.4),
                      ],
                    ),
                    LinearGradient(
                      colors: [
                        PayMeColors.homeScreenFundsButton.withOpacity(0.4),
                        PayMeColors.homeScreenRecieveButton.withOpacity(0.4),
                        PayMeColors.homeScreenTransferButton.withOpacity(0.4),
                      ],
                    ),
                    0.3,
                  )
                : Gradient.lerp(
                    LinearGradient(
                      colors: [
                        PayMeColors.homeScreenFundsButton,
                        PayMeColors.homeScreenRecieveButton,
                        PayMeColors.homeScreenTransferButton,
                      ],
                    ),
                    LinearGradient(
                      colors: [
                        PayMeColors.homeScreenFundsButton,
                        PayMeColors.homeScreenRecieveButton,
                        PayMeColors.homeScreenTransferButton,
                      ],
                    ),
                    0.3,
                  ),
        borderRadius: borderRadius ?? PayMeSizes.primaryButtonBorderRadius1,
        border: isDisabled == true
            ? Border.all(
                color: PayMeColors.white,
                width: 2,
              )
            : border,
      ),
      child: labelText != null
          ? Center(
              child: Text(
                labelText!,
                style: PayMeTextStyles.primaryButtonText.copyWith(
                  color: isDisabled == true
                      ? PayMeColors.white
                      : (labelColor ??
                          (!PayMeHelperFunctions.isDarkMode(context)
                              ? PayMeColors.white
                              : PayMeColors.dark)),
                  fontSize: labelFontSize,
                  fontWeight: labelFontWeight,
                ),
              ),
            )
          : child,
    );
  }
}
