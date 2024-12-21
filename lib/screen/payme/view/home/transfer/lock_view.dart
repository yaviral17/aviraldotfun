import 'dart:developer';

import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/utils/widgets/payme_primary_button_widget.dart';
import 'package:aviraldotfun/screen/payme/view/home/transfer/input_pin_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class LockView extends StatefulWidget {
  const LockView({super.key});

  @override
  State<LockView> createState() => _LockViewState();
}

class _LockViewState extends State<LockView> {
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

  FixedExtentScrollController controller = FixedExtentScrollController(
    initialItem: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Spacer(),
          Center(
            child: FittedBox(
              child: Hero(
                tag: "lockAnimation",
                child: Image.asset(
                  "assets/images/ic_lock.png",
                  width: PayMeSizes.displayWidth(context),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Spacer(),
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
                      "987364 QNT",
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
            height: PayMeSizes.figmaRatioHeight(context, 80),
          ),
          Center(
            child: SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 42),
              child: FittedBox(
                child: Text(
                  "Set the time",
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
            height: PayMeSizes.figmaRatioHeight(context, 118),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: PayMeSizes.figmaRatioHeight(context, 63),
                width: PayMeSizes.figmaRatioWidth(context, 80),
                child: WheelChooser.integer(
                  isInfinite: false,
                  horizontal: false,
                  physics: const FixedExtentScrollPhysics(),
                  onValueChanged: (s) => log(s.toString()),
                  maxValue: 24,
                  minValue: 1,
                  initValue: 1,
                  unSelectTextStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: PayMeSizes.figmaRatioHeight(context, 18),
                  ),
                  selectTextStyle: TextStyle(
                    color: PayMeColors.white,
                    fontSize: PayMeSizes.figmaRatioHeight(context, 20),
                  ),
                ),
              ),
              Text(
                "Hrs.",
                style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                  height: 1,
                  color: PayMeColors.white,
                  fontSize: PayMeSizes.figmaRatioHeight(context, 24),
                ),
              ),
            ],
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
                          PayMeNavigation.to(InputPinView());
                        },
                        labelText: PayMeTexts.continue_,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: !animateButton
                            ? PayMeSizes.figmaRatioHeight(
                                context, PayMeSizes.primaryButtonHeight + 10)
                            : 0,
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: false,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: PayMePrimaryButton(
                      onPressed: () {
                        // PayMeNavigation.to(
                        //     const AskLockAmountView());
                      },
                      labelText: " ",
                    ),
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
