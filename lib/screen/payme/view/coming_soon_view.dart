import 'package:aviraldotfun/screen/payme/utils/appbar/appbar.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ComingSoonView extends StatelessWidget {
  const ComingSoonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PayMeAppBar(
      //   showBackArrow: true,
      // ),
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "assets/images/coming_soon.png",
                width: PayMeSizes.displayWidth(context),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "We are working on it's development 👨‍💻",
                    textAlign: TextAlign.center,
                    style: PayMeTextStyles.signUpOnboardingText.copyWith(
                      fontSize: 36,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 18),
                  Text(
                    // add emoji at the end of the text
                    "Stay tuned for the updates 🚀",
                    style: PayMeTextStyles.signUpOnboardingText.copyWith(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: PayMeSizes.figmaRatioHeight(context, 200)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
