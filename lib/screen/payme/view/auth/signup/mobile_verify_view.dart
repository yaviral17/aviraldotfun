import 'dart:developer';

import 'package:aviraldotfun/screen/payme/utils/appbar/appbar.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/utils/widgets/payme_primary_button_widget.dart';
import 'package:aviraldotfun/screen/payme/view/auth/signin/checking_kyc_status_view.dart';
import 'package:aviraldotfun/screen/payme/view/auth/signup/pick_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MobileVerifyView extends StatefulWidget {
  final bool otpVerified;
  const MobileVerifyView({
    super.key,
    required this.otpVerified,
  });

  @override
  State<MobileVerifyView> createState() => _MobileVerifyViewState();
}

class _MobileVerifyViewState extends State<MobileVerifyView> {
  bool isLoading = true;
  String animationPath = "assets/animations/Scene 6.json";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      if (widget.otpVerified) {
        setState(() {
          animationPath = "assets/animations/Scene 7.json";
        });
      }
    });

    if (widget.otpVerified) {
      Future.delayed(const Duration(milliseconds: 2500), () {
        setState(() {
          isLoading = false;
        });
      });
    } else {
      Future.delayed(const Duration(milliseconds: 2000), () {
        PayMeNavigation.fadeBack();
      });
    }
    // Future.delayed(const Duration(seconds: 5), () {
    //   setState(() {
    //     isLoading = false;
    //     animationPath = "assets/animations/Scene 8.json";
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PayMeAppBar(
      //   leadingIcon: Icons.arrow_back,
      //   leadingOnPressed: () {
      //     Get.back();
      //   },
      // ),
      body: isLoading
          ? loadingAnimationUI(context)
          : completedAnimationUI(context, !isLoading),
    );
  }

  Widget loadingAnimationUI(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: PayMeSizes.figmaRatioHeight(context, 80) * -1,
          child: Lottie.asset(
            animationPath,
            fit: BoxFit.fitWidth,
            repeat: animationPath.contains("Scene 7.json"),
            onLoaded: (p0) {},
            width: PayMeSizes.displayWidth(context),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 124),
            ),
            Center(
              child: SizedBox(
                width: PayMeSizes.figmaRatioWidth(context, 240),
                height: PayMeSizes.figmaRatioHeight(context, 240),
              ),
            ),
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 140),
            ),
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 94),
              child: FittedBox(
                child: Text(
                  !isLoading
                      ? PayMeTexts.phoneNumberVerified
                      : PayMeTexts.verifyYourPhoneNumber,
                  textAlign: TextAlign.center,
                  style: PayMeTextStyles.signUpOnboardingText,
                ),
              ),
            ),
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 60),
            ),
            Visibility(
              visible: false,
              child: PayMePrimaryButton(
                onPressed: () {
                  PayMeNavigation.to(const PickProfileView());
                },
                labelText: PayMeTexts.continue_,
                isDisabled: false,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget completedAnimationUI(BuildContext context, bool animate) {
    return Stack(
      children: [
        Visibility(
          visible: animate,
          child: Positioned(
            top: PayMeSizes.figmaRatioHeight(context, 80) * -1,
            child: Lottie.asset(
              "assets/animations/Scene 8.json",
              fit: BoxFit.fitWidth,
              repeat: false,
              onLoaded: (p0) {},
              width: PayMeSizes.displayWidth(context),
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 124),
            ),
            Center(
              child: SizedBox(
                width: PayMeSizes.figmaRatioWidth(context, 240),
                height: PayMeSizes.figmaRatioHeight(context, 240),
              ),
            ),
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 140),
            ),
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 94),
              child: FittedBox(
                child: Text(
                  PayMeTexts.phoneNumberVerified,
                  textAlign: TextAlign.center,
                  style: PayMeTextStyles.signUpOnboardingText,
                ),
              ),
            ),
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 60),
            ),
            PayMePrimaryButton(
              onPressed: () {
                PayMeNavigation.to(
                    const CheckingKycStatusView(isFailedScenario: true));
              },
              labelText: PayMeTexts.continue_,
              isDisabled: false,
            ),
          ],
        ),
      ],
    );
  }
}
