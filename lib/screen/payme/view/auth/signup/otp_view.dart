import 'dart:developer';

import 'package:aviraldotfun/screen/payme/utils/appbar/appbar.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/utils/local_storage/storage_utility.dart';
import 'package:aviraldotfun/screen/payme/utils/widgets/payme_primary_button_widget.dart';
import 'package:aviraldotfun/screen/payme/view/auth/signup/mobile_verify_view.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:pin_input_text_field/pin_input_text_field.dart';
// import 'package:pinput/pinput.dart';

class OTPView extends StatefulWidget {
  const OTPView({super.key});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  bool isContinuePressed = false;
  bool isDisabledContinue = false;

  final PageController _pageController = PageController();

  Future<void> onContinuePress() async {
    FocusScope.of(context).unfocus();
    if (isContinuePressed) return;
    isContinuePressed = true;
    // if (!(await authController.verifyOTP())) {
    //   return;
    // }

    Future.delayed(const Duration(milliseconds: 400), () {
      PayMeLocalStorage.removeData("phone");
      PayMeLocalStorage.removeData("rout");
      PayMeNavigation.to(MobileVerifyView(
        otpVerified: true,
      ));
      // }
      isContinuePressed = false;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      PayMeLocalStorage.readData("phone").then((value) {
        if (value != null) {
        } else {
          PayMeLocalStorage.saveData("rout", "/otp_view");
          PayMeLocalStorage.saveData(
            "phone",
            "asdasdas",
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    isDisabledContinue = false;
    // final defaultPinTheme = PinTheme(
    //   width: PayMeSizes.figmaRatioWidth(context, 54),
    //   height: PayMeSizes.figmaRatioWidth(context, 45),
    //   textStyle: TextStyle(
    //       fontSize: 20,
    //       color: PayMeColors.text(context),
    //       fontWeight: FontWeight.w600),
    //   decoration: BoxDecoration(
    //     shape: BoxShape.rectangle,
    //     color: PayMeColors.transparent,
    //     border: Border(
    //       bottom: BorderSide(
    //         color: PayMeColors.text(context),
    //         width: 1,
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      // appBar: PayMeAppBar(
      //   leadingIcon: Icons.arrow_back,
      //   leadingOnPressed: () {
      //     Get.back();
      //   },
      // ),
      body: Stack(
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
          SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  top: PayMeSizes.figmaRatioHeight(context, 80) * -1,
                  child: Lottie.asset(
                    "assets/animations/Scene 5.json",
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
                          PayMeTexts.letsVerifyYourNumber,
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
                      padding: const EdgeInsets.symmetric(horizontal: 120.0),
                      // child: PinInputTextField(
                      //   decoration: UnderlineDecoration(
                      //     colorBuilder:
                      //         FixedColorBuilder(PayMeColors.text(context)),
                      //   ),
                      //   onChanged: (value) {
                      //     setState(() {
                      //       isDisabledContinue = value.isEmpty;
                      //     });
                      //   },
                      //   controller: authController.otpController,
                      //   pinLength: 6,
                      // ),
                      child: PinInputTextField(
                        decoration: UnderlineDecoration(
                          colorBuilder:
                              FixedColorBuilder(PayMeColors.text(context)),
                        ),
                        onChanged: (value) {
                          setState(() {
                            isDisabledContinue = value.isEmpty;
                          });
                        },
                        controller: TextEditingController(),
                        pinLength: 6,
                      ),
                    ),

                    //    Pinput(
                    //     controller: authController.otpController,
                    //     defaultPinTheme: defaultPinTheme,
                    //     submittedPinTheme: defaultPinTheme.copyWith(
                    //       decoration: defaultPinTheme.decoration?.copyWith(
                    //         color: PayMeColors.transparent,
                    //       ),
                    //     ),
                    //     keyboardType: TextInputType.number,
                    //     inputFormatters: [
                    //       FilteringTextInputFormatter.digitsOnly
                    //     ],
                    //     length: 6,
                    //     onChanged: (s) {
                    //       log("OTP ${s.length} ${s.length == 6}");
                    //       setState(() {
                    //         isDisabledContinue = s.length == 6;
                    //       });
                    //     },
                    //     onClipboardFound: (pin) {
                    //       log("OTP from clipboard $pin");

                    //       if (pin.length != 6) {
                    //         return;
                    //       }
                    //       showCupertinoDialog(
                    //           context: context,
                    //           builder: (BuildContext context) {
                    //             return CupertinoAlertDialog(
                    //               title: const Text("OTP Found"),
                    //               content: Text(
                    //                   "Do you want to use the OTP $pin from the clipboard"),
                    //               actions: [
                    //                 CupertinoDialogAction(
                    //                   child: const Text("Yes"),
                    //                   onPressed: () async {
                    //                     authController.otpController.text = pin;
                    //                     Navigator.pop(context);
                    //                     await onContinuePress();
                    //                   },
                    //                 ),
                    //                 CupertinoDialogAction(
                    //                   child: const Text("No"),
                    //                   onPressed: () {
                    //                     Navigator.pop(context);
                    //                   },
                    //                 ),
                    //               ],
                    //             );
                    //           });
                    //     },
                    //     errorBuilder: (String? errorText, String pin) {
                    //       return Text(
                    //         errorText ?? "",
                    //         style: Theme.of(context)
                    //             .textTheme
                    //             .titleLarge!
                    //             .copyWith(
                    //               fontSize: 16,
                    //               fontWeight: FontWeight.w400,
                    //               color: PayMeColors.error,
                    //             ),
                    //       );
                    //     },
                    //     pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    //     showCursor: true,
                    //     onCompleted: (pin) async {},
                    //   ),
                    // ),

                    SizedBox(
                      height: PayMeSizes.figmaRatioHeight(context, 80),
                    ),
                    PayMePrimaryButton(
                      onPressed: () => onContinuePress(),
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
        ],
      ),
    );
  }
}
