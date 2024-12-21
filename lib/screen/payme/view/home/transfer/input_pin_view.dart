import 'dart:developer';

import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/image_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/utils/widgets/payme_primary_button_widget.dart';
import 'package:aviraldotfun/screen/payme/view/home/transfer/transfering_funds_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class InputPinView extends StatefulWidget {
  const InputPinView({super.key});

  @override
  State<InputPinView> createState() => _InputPinViewState();
}

class _InputPinViewState extends State<InputPinView> {
  bool isContinuePressed = true;

  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 40),
            ),
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 368),
              child: Image.asset(
                PayMeImages.pinViewLogo,
                fit: BoxFit.contain,
              ),
            ),
            Center(
              child: SizedBox(
                // height: PayMeSizes.figmaRatioHeight(context, 20),
                width: PayMeSizes.figmaRatioWidth(context, 230),
                child: FittedBox(
                  child: Text(
                    "Input pin to\ncontinue",
                    textAlign: TextAlign.center,
                    style: PayMeTextStyles.signUpOnboardingText
                        .copyWith(height: 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 40),
            ),
            Center(
              child: SizedBox(
                height: PayMeSizes.figmaRatioHeight(context, 20),
                width: PayMeSizes.figmaRatioWidth(context, 230),
                child: PinInputTextField(
                  keyboardType: TextInputType.number,
                  controller: pinController,
                  decoration: CirclePinDecoration(
                    strokeColorBuilder: const FixedColorBuilder(
                      PayMeColors.white,
                    ),
                    obscureStyle: ObscureStyle(
                      isTextObscure: true,
                      obscureText: '●',
                    ),
                    gapSpace: 1,
                    strokeWidth: 2,
                  ),
                  onChanged: (value) {
                    if (value.trim().length == 8) {
                      setState(() {
                        isContinuePressed = false;
                      });
                      FocusScope.of(context).unfocus();
                    } else {
                      setState(() {
                        isContinuePressed = true;
                      });
                    }
                  },
                  pinLength: 8,
                ),
              ),
            ),
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 120),
            ),
            PayMePrimaryButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                //log("Continue pressed");
                Future.delayed(const Duration(milliseconds: 400), () {
                  PayMeNavigation.to(TransferringFundsView(
                    locked: false,
                  ));
                });
              },
              labelText: PayMeTexts.continue_,
              isDisabled: isContinuePressed,
            ),
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 20),
            ),
          ],
        ),
      ),
    );
  }
}
