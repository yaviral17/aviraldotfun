import 'dart:developer';

import 'package:aviraldotfun/screen/payme/utils/appbar/appbar.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/utils/widgets/payme_primary_button_widget.dart';
import 'package:aviraldotfun/screen/payme/utils/widgets/payme_text_field_widget.dart';
import 'package:aviraldotfun/screen/payme/view/auth/signup/phone_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class NameView extends StatefulWidget {
  const NameView({super.key});

  @override
  State<NameView> createState() => _NameViewState();
}

class _NameViewState extends State<NameView> {
  bool isContinuePressed = false;
  bool isDisabledContinue = false;
  @override
  Widget build(BuildContext context) {
    bool isDisabledContinue = false;

    return Scaffold(
      // appBar: PayMeAppBar(
      //   leadingIcon: Icons.arrow_back,
      //   leadingOnPressed: () {
      //     PayMeNavigation.fadeBack();
      //   },
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: PayMeSizes.figmaRatioHeight(context, 80) * -1,
              child: Lottie.asset(
                "assets/animations/Scene 3.json",
                fit: BoxFit.fitWidth,
                repeat: false,
                width: PayMeSizes.displayWidth(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  // top gap
                  SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 40),
                  ),
                  // animation placeholder
                  SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 250),
                  ),
                  // animation to text gap
                  SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 48),
                  ),
                  // text
                  SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 94),
                    width: PayMeSizes.figmaRatioWidth(context, 290),
                    child: FittedBox(
                      child: Text(
                        PayMeTexts.whatShouldWeCallYou,
                        textAlign: TextAlign.center,
                        style: PayMeTextStyles.signUpOnboardingText,
                      ),
                    ),
                  ),
                  // text to textfield gap
                  SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 126),
                  ),
                  // textfield
                  Center(
                    child: SizedBox(
                      width: PayMeSizes.figmaRatioWidth(context, 340),
                      child: PayMeTextField(
                        controller: TextEditingController(),
                        hintText: PayMeTexts.fullName,
                        onChanged: (value) {
                          setState(() {
                            isDisabledContinue = value.isEmpty;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 80),
                  ),
                  PayMePrimaryButton(
                    onPressed: () {
                      if (isContinuePressed) return;
                      isContinuePressed = true;

                      // check fullName doesn't have any special characters or numbers

                      // remove keyboard focus
                      FocusScope.of(context).unfocus();
                      Future.delayed(const Duration(milliseconds: 400), () {
                        PayMeNavigation.to(const PhoneView());
                        isContinuePressed = false;
                      });
                    },
                    labelText: PayMeTexts.continue_,
                    isDisabled: isDisabledContinue,
                  ),
                  SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
