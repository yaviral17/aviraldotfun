import 'dart:developer';

import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/utils/widgets/payme_primary_button_widget.dart';
import 'package:aviraldotfun/screen/payme/view/home/transfer/input_pin_view.dart';
import 'package:aviraldotfun/screen/payme/view/home/transfer/lock_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AskLockAmountView extends StatefulWidget {
  const AskLockAmountView({super.key});

  @override
  State<AskLockAmountView> createState() => _AskLockAmountViewState();
}

class _AskLockAmountViewState extends State<AskLockAmountView> {
  bool animateButton = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        animateButton = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Hero(
              tag: "lockAnimation",
              child: Lottie.asset(
                "assets/animations/lock_animation.json",
                height: PayMeSizes.figmaRatioHeight(context, 320),
                repeat: false,
                reverse: true,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Center(
            child: Hero(
              tag: "transferingFunds",
              child: Container(
                width: PayMeSizes.figmaRatioWidth(context, 300),
                height: PayMeSizes.figmaRatioHeight(context, 80),
                padding: const EdgeInsets.only(
                  top: 28,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  color: PayMeColors.transparent,
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(
                    color: PayMeColors.transferTextFieldColor,
                    width: 4,
                  ),
                ),
                child: FittedBox(
                  child: Material(
                    color: PayMeColors.transparent,
                    child: Text(
                      "114 QNT",
                      style: PayMeTextStyles.signUpOnboardingText.copyWith(
                        height: 0,
                        color: PayMeColors.transferTextFieldColor,
                        fontSize: PayMeSizes.figmaRatioHeight(context, 36),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: PayMeSizes.figmaRatioHeight(context, 60),
          ),
          Center(
            child: SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 70),
              child: FittedBox(
                child: Text(
                  "Do you want to\nlock this\namount?",
                  textAlign: TextAlign.center,
                  style: PayMeTextStyles.signUpOnboardingText.copyWith(
                    height: 1,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: PayMeSizes.figmaRatioHeight(context, 63),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: PayMeSizes.figmaRatioHeight(
                context, (PayMeSizes.primaryButtonHeight * 2) + 10),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PayMePrimaryButton(
                        onPressed: () {
                          PayMeNavigation.to(const LockView());
                        },
                        labelText: "Yes",
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: animateButton
                            ? PayMeSizes.figmaRatioHeight(
                                context, PayMeSizes.primaryButtonHeight + 10)
                            : 0,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: PayMePrimaryButton(
                    onPressed: () {
                      PayMeNavigation.to(InputPinView());
                    },
                    labelText: "No",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: PayMeSizes.figmaRatioHeight(context, 48),
          ),
        ],
      ),
    );
  }
}
