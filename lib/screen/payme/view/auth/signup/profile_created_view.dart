import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProfileCreatedView extends StatefulWidget {
  const ProfileCreatedView({super.key});

  @override
  State<ProfileCreatedView> createState() => _ProfileCreatedViewState();
}

class _ProfileCreatedViewState extends State<ProfileCreatedView> {
  bool showTextFieldAnimation = false;

  bool endScreenAnimations = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        showTextFieldAnimation = true;
      });
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        showTextFieldAnimation = false;
      });
      Future.delayed(const Duration(milliseconds: 200), () {
        PayMeNavigation.to(HomeView());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Visibility(
            visible: showTextFieldAnimation,
            child: Lottie.asset(
              "assets/animations/Scene 14.json",
              fit: BoxFit.fitWidth,
              repeat: false,
              onLoaded: (p0) {},
              width: PayMeSizes.displayWidth(context),
            ),
          ),
          Visibility(
            visible: !showTextFieldAnimation,
            child: Lottie.asset(
              "assets/animations/Scene 20.json",
              fit: BoxFit.fitWidth,
              repeat: false,
              reverse: true,
              onLoaded: (p0) {},
              width: PayMeSizes.displayWidth(context),
            ),
          ),
          Center(
            child: SizedBox(
              width: PayMeSizes.figmaRatioWidth(context, 147),
              height: PayMeSizes.figmaRatioHeight(context, 94),
              child: FittedBox(
                child: AnimatedOpacity(
                  opacity: showTextFieldAnimation ? 1 : 0,
                  duration: const Duration(milliseconds: 400),
                  child: Text(
                    "profile\nupdated",
                    textAlign: TextAlign.center,
                    style: PayMeTextStyles.signUpOnboardingText,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
