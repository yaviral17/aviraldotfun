import 'dart:developer';

import 'package:aviraldotfun/screen/payme/utils/appbar/appbar.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/utils/widgets/payme_primary_button_widget.dart';
import 'package:aviraldotfun/screen/payme/view/auth/forget_pass/forget_password_view.dart';
import 'package:aviraldotfun/screen/payme/view/auth/signup/otp_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:vibration/vibration.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CreatePinView extends StatefulWidget {
  const CreatePinView({super.key});

  @override
  State<CreatePinView> createState() => _CreatePinViewState();
}

class _CreatePinViewState extends State<CreatePinView> {
  bool isContinuePressed = false;

  bool showForgetPassword = false;

  bool isDisabledContinue = false;
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
                        !false
                            ? 'Enter your pin\nto get started'
                            : 'let\'s create a pin\nfor payments',
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
                        //log("Pin length is ${authController.pinController.text.length}");

                        FocusScope.of(context).unfocus();
                        // Vibration.hasVibrator().then((value) {
                        //   if (value == true) {
                        //     //log("Vibrating");
                        //     Vibration.vibrate(duration: 100);
                        //   } else {
                        //     //log("No vibrator");
                        //   }
                        // });
                        //log("Pin length is greater than 8");
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
                  height: PayMeSizes.figmaRatioHeight(context, 20),
                ),
                Visibility(
                  visible: showForgetPassword,
                  maintainSemantics: true,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainInteractivity: true,
                  maintainState: true,
                  child: ZoomTapAnimation(
                    onTap: () async {
                      // PayMeNavigation.to(
                      //   const ForgotPasswordView(),
                      // );
                      // return;
                      if (!showForgetPassword) {
                        return;
                      }

                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text(
                              "Forget your pin?",
                              style:
                                  PayMeTextStyles.defaultPrimaryStyle.copyWith(
                                color: PayMeColors.text(context),
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    PayMeSizes.figmaRatioWidth(context, 16),
                              ),
                            ),
                            content: Text(
                              "Please enter your email address to receive a one-time pin",
                              style:
                                  PayMeTextStyles.defaultPrimaryStyle.copyWith(
                                color: PayMeColors.text(context),
                                fontWeight: FontWeight.w500,
                                fontSize:
                                    PayMeSizes.figmaRatioWidth(context, 14),
                              ),
                            ),
                            actions: [
                              CupertinoDialogAction(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Cancel",
                                  style: PayMeTextStyles.defaultPrimaryStyle
                                      .copyWith(
                                    color: PayMeColors.text(context),
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        PayMeSizes.figmaRatioWidth(context, 16),
                                  ),
                                ),
                              ),
                              CupertinoDialogAction(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  bool otpSent = true;

                                  if (otpSent) {
                                    PayMeNavigation.to(
                                      const ForgotPasswordView(),
                                    );
                                  }
                                },
                                child: Text(
                                  "forget your pin?",
                                  style: PayMeTextStyles.signUpOnboardingText
                                      .copyWith(
                                    color: PayMeColors.text(context),
                                    fontSize: PayMeSizes.figmaRatioWidth(
                                      context,
                                      14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      "forget your pin?",
                      style: PayMeTextStyles.signUpOnboardingText.copyWith(
                        color: PayMeColors.text(context),
                        fontSize: PayMeSizes.figmaRatioWidth(context, 14),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 200),
                ),
                PayMePrimaryButton(
                  onPressed: () async {
                    if (isContinuePressed) return;
                    isContinuePressed = true;

                    FocusScope.of(context).unfocus();
                    PayMeNavigation.to(const OTPView());
                    return;
                    // if (authController.isInSignUpFlow.value) {
                    //   bool isRegistered = await authController.registerUser();
                    //   if (isRegistered) {
                    //     Future.delayed(
                    //       const Duration(milliseconds: 100),
                    //       () {
                    //         PayMeNavigation.fadeToReplacement(const OTPView());
                    //         isContinuePressed = false;
                    //       },
                    //     );
                    //   } else {
                    //     Future.delayed(
                    //       const Duration(seconds: 2),
                    //       () {
                    //         isContinuePressed = false;
                    //       },
                    //     );
                    //   }
                    // } else {
                    //   String resp = await authController.loginUser();
                    //   switch (resp) {
                    //     case "loggedIn":
                    //       Future.delayed(
                    //         const Duration(milliseconds: 100),
                    //         () {
                    //           PayMeNavigation.fadeToReplacement(
                    //             const CheckingKycStatusView(
                    //               isFailedScenario: false,
                    //             ),
                    //           );
                    //           isContinuePressed = false;
                    //         },
                    //       );
                    //       break;
                    //     case "kycPending":
                    //       Future.delayed(
                    //         const Duration(milliseconds: 100),
                    //         () {
                    //           PayMeNavigation.fadeToReplacement(
                    //             const CheckingKycStatusView(
                    //               isFailedScenario: true,
                    //             ),
                    //           );
                    //           isContinuePressed = false;
                    //         },
                    //       );
                    //       break;
                    //     case "failed":
                    //       Future.delayed(
                    //         const Duration(milliseconds: 100),
                    //         () {
                    //           isContinuePressed = false;
                    //         },
                    //       );
                    //       break;
                    //     case "invalidCredentials":
                    //       Future.delayed(
                    //         const Duration(milliseconds: 100),
                    //         () {
                    //           // SnackBar snackBar = SnackBar(
                    //           //   content: Column(
                    //           //     crossAxisAlignment: CrossAxisAlignment.start,
                    //           //     children: [
                    //           //       Text(
                    //           //         "Invalid credentials",
                    //           //         style: PayMeTextStyles.defaultPrimaryStyle
                    //           //             .copyWith(
                    //           //           color: PayMeColors.white,
                    //           //           fontWeight: FontWeight.w600,
                    //           //           fontSize: PayMeSizes.figmaRatioWidth(
                    //           //               context, 16),
                    //           //         ),
                    //           //       ),
                    //           //       Text(
                    //           //         "Please try again",
                    //           //         style: PayMeTextStyles.defaultPrimaryStyle
                    //           //             .copyWith(
                    //           //           color: PayMeColors.white,
                    //           //           fontWeight: FontWeight.w500,
                    //           //           fontSize: PayMeSizes.figmaRatioWidth(
                    //           //               context, 12),
                    //           //         ),
                    //           //       ),
                    //           //     ],
                    //           //   ),
                    //           //   backgroundColor: PayMeColors.error,
                    //           //   duration: const Duration(seconds: 2),
                    //           //   // show from top
                    //           //   behavior: SnackBarBehavior.floating,
                    //           //   actionOverflowThreshold: 0.5,
                    //           //   shape: RoundedRectangleBorder(
                    //           //     borderRadius: BorderRadius.circular(8),
                    //           //   ),
                    //           // );
                    //           // ScaffoldMessenger.of(context)
                    //           //     .showSnackBar(snackBar);

                    //           isContinuePressed = false;
                    //           setState(() {
                    //             showForgetPassword = true;
                    //           });
                    //         },
                    //       );
                    //       break;
                    //     default:
                    //       break;
                    //   }
                    // }
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
