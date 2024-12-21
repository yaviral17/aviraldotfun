import 'package:aviraldotfun/screen/payme/utils/appbar/appbar.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AddFundsRequestSent extends StatelessWidget {
  const AddFundsRequestSent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PayMeAppBar(
      //   showBackArrow: true,
      // ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Spacer(),
          Center(
            child: Lottie.asset(
              'assets/animations/request sent.json',
              width: PayMeSizes.figmaRatioWidth(context, 360),
              repeat: false,
            ),
          ),
          SizedBox(
            height: PayMeSizes.figmaRatioHeight(context, 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              // add emojies to the text
              'Your request has been sent! ✉️\nWe will notify you once the funds are added to your account.',
              textAlign: TextAlign.center,
              style: PayMeTextStyles.defaultPrimaryStyle.copyWith(
                fontSize: PayMeSizes.figmaRatioWidth(context, 18),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
