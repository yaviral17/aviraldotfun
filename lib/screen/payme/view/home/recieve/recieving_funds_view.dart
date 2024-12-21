import 'dart:developer';

import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/view/home/transfer/transaction_success_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:sound_library/sound_library.dart';

class ReceivingFundsView extends StatefulWidget {
  const ReceivingFundsView({
    super.key,
  });

  @override
  State<ReceivingFundsView> createState() => _ReceivingFundsViewState();
}

class _ReceivingFundsViewState extends State<ReceivingFundsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //log("Receiving Funds View ${transactionController.toAccount.value} ${transactionController.amount.value} ${authController.userData.value!.token} ${transactionController.locked.value} ${transactionController.hours.value} ${transactionController.enteredPin.value}");
    requestMoney();
    // Future.delayed(const Duration(seconds: 1), () {
    //   SoundPlayer.play(Sounds.orderComplete, volume: 0.8);
    //   PayMeNavigation.to(const TransactionSuccessView(
    //     routName: "Receive",
    //     amount: "200",
    //     toAccount: "918077963037",
    //     locked: false,
    //     transactionId: "123456",
    //     name: "Aviral Yadav",
    //   ));
    // });
  }

  requestMoney() async {
    // if (result['isSuccess']) {
    //log(result.toString());
    await SoundPlayer.play(Sounds.orderComplete, volume: 0.8);
    PayMeNavigation.to(TransactionSuccessView(
      routName: "Receive",
      amount: "200",
      toAccount: "91853963037",
      locked: false,
      transactionId: "123456",
      name: "Aviral Yadav",
    ));
    return;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 132),
            ),
            CircleAvatar(
              radius: PayMeSizes.figmaRatioWidth(context, 60),
              backgroundColor: PayMeColors.transferScreenCircleAvatar,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Text(
                    "A",
                    style: TextStyle(
                      color: PayMeColors.white,
                      fontSize: PayMeSizes.figmaRatioWidth(context, 36),
                    ),
                  )),
            ),
            Text(
              "Receiving Funds",
              style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                color: PayMeColors.white,
                fontSize: PayMeSizes.figmaRatioWidth(context, 40),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Transferring Funds",
              style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                color: PayMeColors.darkGrey,
                fontSize: PayMeSizes.figmaRatioWidth(context, 16),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 20),
            ),
            Hero(
              tag: "transferingFunds",
              child: Container(
                width: PayMeSizes.figmaRatioWidth(context, 240),
                height: PayMeSizes.figmaRatioHeight(context, 240),
                padding: const EdgeInsets.only(
                  top: 0,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  color: PayMeColors.transparent,
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(
                    color: PayMeColors.recieveTextFieldColor,
                    width: 4,
                  ),
                ),
                child: FittedBox(
                  child: Column(
                    children: [
                      // Icon(
                      //   Icons.arrow_downward,
                      //   size: PayMeSizes.figmaRatioWidth(context, 120),
                      //   color: PayMeColors.recieveTextFieldColor,
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Lottie.asset(
                          "assets/animations/Arrow Receive.json",
                          height: PayMeSizes.figmaRatioHeight(context, 120),
                        ),
                      ),
                      Material(
                        color: PayMeColors.transparent,
                        child: Text(
                          "4353 QNT",
                          style: PayMeTextStyles.signUpOnboardingText.copyWith(
                            height: 0,
                            color: PayMeColors.recieveTextFieldColor,
                            fontSize: PayMeSizes.figmaRatioHeight(context, 36),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
