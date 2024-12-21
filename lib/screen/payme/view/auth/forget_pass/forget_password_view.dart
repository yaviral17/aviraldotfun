import 'package:aviraldotfun/screen/payme/utils/appbar/appbar.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/utils/helpers/helper_functions.dart';
import 'package:aviraldotfun/screen/payme/utils/widgets/payme_primary_button_widget.dart';
import 'package:aviraldotfun/screen/payme/view/auth/forget_pass/enter_new_pin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  // prevent continue button spam
  bool isContinuePressed = false;

  bool isDisabledContinue = true;

  // phone number field focus node
  final FocusNode phoneNumberFocusNode = FocusNode();

  // country code field focus node
  final FocusNode countryCodeFocusNode = FocusNode();

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

    phoneNumberFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PayMeColors.background(context),
      // appBar: PayMeAppBar(
      //   leadingIcon: Icons.arrow_back,
      //   leadingOnPressed: () {
      //     PayMeNavigation.fadeBack();
      //   },
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Stack(
            children: [
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
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // top gap
                  SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 20),
                  ),
                  // animation placeholder
                  SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 300),
                  ),
                  // animation to text gap
                  SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 48),
                  ),
                  // text
                  // text
                  SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 94),
                    width: PayMeSizes.figmaRatioWidth(context, 290),
                    child: FittedBox(
                      child: Text(
                        PayMeTexts.enterOtpSentToYourPhone,
                        textAlign: TextAlign.center,
                        style: PayMeTextStyles.signUpOnboardingText,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 48),
                  ),
                  Center(
                    child: SizedBox(
                      width: PayMeSizes.figmaRatioWidth(context, 230),
                      child: PinInputTextField(
                        decoration: UnderlineDecoration(
                          colorBuilder:
                              FixedColorBuilder(PayMeColors.text(context)),
                        ),
                        onChanged: (value) {
                          if (value.length == 5) {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              isDisabledContinue = false;
                            });
                          }
                        },
                        controller: TextEditingController(),
                        pinLength: 5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 124),
                  ),
                  PayMePrimaryButton(
                    labelText: PayMeTexts.continue_,
                    isDisabled: isDisabledContinue,
                    onPressed: () async {
                      PayMeNavigation.to(
                        EnterNewPinView(),
                      );
                    },
                  ),
                  SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 48),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
