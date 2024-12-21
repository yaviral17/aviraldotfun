import 'dart:developer';

import 'package:aviraldotfun/screen/payme/utils/appbar/appbar.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/utils/helpers/helper_functions.dart';
import 'package:aviraldotfun/screen/payme/utils/widgets/payme_primary_button_widget.dart';
import 'package:aviraldotfun/screen/payme/utils/widgets/payme_text_field_widget.dart';
import 'package:aviraldotfun/screen/payme/view/auth/signup/create_pin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PhoneView extends StatefulWidget {
  const PhoneView({super.key});

  @override
  State<PhoneView> createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  // prevent continue button spam
  bool isContinuePressed = false;

  // phone number field focus node
  final FocusNode phoneNumberFocusNode = FocusNode();

  // country code field focus node
  final FocusNode countryCodeFocusNode = FocusNode();

  void onContinue() {
    FocusScope.of(context).unfocus();
    Future.delayed(const Duration(milliseconds: 400), () {
      //log("Phone number: ${authController.phonePrefixNumber.text.trim()}${authController.phoneNumber.text.trim()}");
      PayMeNavigation.to(const CreatePinView());
      isContinuePressed = false;
    });
  }

  bool isDisabledContinue = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountryCode();
  }

  void getCountryCode() async {
    PayMeHelperFunctions.showInfoMessageGet(
        title: "Fetching Country Code",
        message: "Please wait while we fetch your country code");
    // bool result = await authController.getCountryCode();
    // if (!result) {
    //   PayMeHelperFunctions.showErrorMessageGet(
    //       title: "Something went wrong",
    //       message: "Error fetching country code");
    //   countryCodeFocusNode.requestFocus();
    //   return;
    // }
    // phoneNumberFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
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
                "assets/animations/Scene 4.json",
                fit: BoxFit.fitWidth,
                repeat: false,
                width: PayMeSizes.displayWidth(context),
              ),
            ),
            Column(
              children: [
                // top gap
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 20),
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
                      PayMeTexts.letsGetYourPhoneNumber,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: PayMeColors.text(context),
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: TextFormField(
                                  focusNode: countryCodeFocusNode,
                                  textAlign: TextAlign.center,
                                  controller: TextEditingController(),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  keyboardType: TextInputType.phone,
                                  style: PayMeTextStyles.signUpOnboardingText
                                      .copyWith(
                                    color: PayMeColors.text(context),
                                    fontSize:
                                        PayMeSizes.figmaRatioWidth(context, 16),
                                  ),
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  onFieldSubmitted: (value) {
                                    // change focus to next field
                                    phoneNumberFocusNode.requestFocus();
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "91",
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    hintStyle: TextStyle(
                                      color: PayMeColors.darkGrey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "🇮🇳",
                                  style: PayMeTextStyles.signUpOnboardingText
                                      .copyWith(
                                    color: PayMeColors.darkGrey,
                                    fontSize:
                                        PayMeSizes.figmaRatioWidth(context, 16),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 4,
                        child: PayMeTextField(
                          controller: TextEditingController(),
                          focusNode: phoneNumberFocusNode,
                          hintText: PayMeTexts.phoneNumber,

                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          keyboardType: TextInputType.phone,
                          // suffixIcon: const Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 80),
                ),
                PayMePrimaryButton(
                  onPressed: () => onContinue(),
                  labelText: PayMeTexts.continue_,
                  isDisabled: isDisabledContinue,
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
