import 'dart:developer';

import 'package:aviraldotfun/screen/payme/utils/appbar/appbar.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/utils/widgets/payme_primary_button_widget.dart';
import 'package:aviraldotfun/screen/payme/view/auth/auth_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:vibration/vibration.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class EnterNewPinView extends StatefulWidget {
  const EnterNewPinView({super.key});

  @override
  State<EnterNewPinView> createState() => _EnterNewPinViewState();
}

class _EnterNewPinViewState extends State<EnterNewPinView> {
  bool isContinuePressed = false;

  bool showForgetPassword = false;

  bool isDisabledContinue = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PayMeAppBar(
      //   leadingIcon: Icons.arrow_back,
      //   leadingOnPressed: () {
      //     Navigator.pop(context);
      //   },
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            AnimatedPositioned(
              top: false ? 10 : -(PayMeSizes.displayHeight(context) * 0.2),
              left: PayMeSizes.displayWidth(context) / 2 -
                  PayMeSizes.figmaRatioWidth(context, 20),
              duration: const Duration(milliseconds: 400),
              curve: Curves.bounceInOut,
              child: CircleAvatar(
                radius: PayMeSizes.figmaRatioWidth(context, 20),
                backgroundColor: PayMeColors.text(context),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    color: PayMeColors.invertedText(context),
                  ),
                ),
              ),
            ),
            Positioned(
              top: PayMeSizes.figmaRatioHeight(context, 80) * -1,
              child: Lottie.asset(
                "assets/animations/Scene 18.json",
                fit: BoxFit.fitWidth,
                repeat: false,
                onLoaded: (p0) {},
                width: PayMeSizes.displayWidth(context),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 20),
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 266),
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 28),
                ),
                Center(
                  child: SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 94),
                    width: PayMeSizes.figmaRatioWidth(context, 314),
                    child: FittedBox(
                      child: Text(
                        "Enter new pin",
                        textAlign: TextAlign.center,
                        style: PayMeTextStyles.signUpOnboardingText,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 28),
                ),
                Center(
                  child: SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 20),
                    width: PayMeSizes.figmaRatioWidth(context, 230),
                    child: PinInputTextField(
                      keyboardType: TextInputType.number,
                      controller: TextEditingController(),
                      onChanged: (String value) {
                        //log("Pin length is ${authController.forgotPinController.text.length}");
                      },
                      decoration: CirclePinDecoration(
                        strokeColorBuilder: FixedColorBuilder(
                          PayMeColors.text(context),
                        ),
                        obscureStyle: ObscureStyle(
                          isTextObscure: true,
                          obscureText: '●',
                        ),
                        gapSpace: 1,
                        strokeWidth: 2,
                      ),
                      pinLength: 8,
                    ),
                  ),
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 220),
                ),
                PayMePrimaryButton(
                  onPressed: () async {
                    PayMeNavigation.to(
                      const AuthView(),
                    );

                    isContinuePressed = false;
                  },
                  labelText: PayMeTexts.continue_,
                  isDisabled: false,
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
