import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/view/auth/signin/kyc_pending_view.dart';
import 'package:aviraldotfun/screen/payme/view/auth/signin/kyc_verified_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CheckingKycStatusView extends StatefulWidget {
  final bool isFailedScenario;
  const CheckingKycStatusView({
    super.key,
    required this.isFailedScenario,
  });

  @override
  State<CheckingKycStatusView> createState() => _CheckingKycStatusViewState();
}

class _CheckingKycStatusViewState extends State<CheckingKycStatusView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      PayMeNavigation.to(widget.isFailedScenario
          ? const KycVerifiedView()
          : const KycPendingView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: Stack(
          children: [
            Positioned(
              top: PayMeSizes.figmaRatioHeight(context, 200),
              child: Transform.scale(
                scale: 1.5,
                child: Lottie.asset(
                  "assets/animations/Scene 17.json",
                  fit: BoxFit.fitWidth,
                  repeat: true,
                  width: PayMeSizes.displayWidth(context),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: PayMeSizes.figmaRatioWidth(context, 300),
                    height: PayMeSizes.figmaRatioHeight(context, 100),
                    child: FittedBox(
                      child: Text(
                        "checking KYC\nstatus",
                        textAlign: TextAlign.center,
                        style: PayMeTextStyles.signUpOnboardingText,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 120),
                  ),
                  SizedBox(
                    width: PayMeSizes.figmaRatioWidth(context, 300),
                    height: PayMeSizes.figmaRatioHeight(context, 40),
                    child: FittedBox(
                      child: Text(
                        "play failed scenario\n(only for testing)",
                        textAlign: TextAlign.center,
                        style: PayMeTextStyles.bottomNavButtonText.copyWith(
                          color: PayMeColors.transparent,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 20),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
