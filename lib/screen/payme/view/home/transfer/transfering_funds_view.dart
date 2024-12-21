import 'dart:developer';

import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/image_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/view/home/transfer/transaction_success_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sound_library/sound_library.dart';

class TransferringFundsView extends StatefulWidget {
  final bool locked;
  const TransferringFundsView({
    super.key,
    required this.locked,
  });

  @override
  State<TransferringFundsView> createState() => _TransferringFundsViewState();
}

class _TransferringFundsViewState extends State<TransferringFundsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initRequest(context);
  }

  initRequest(BuildContext context) async {
    // log("Transfering Funds View ${transactionController.toAccount.value} ${transactionController.amount.value} ${authController.userData.value!.token} ${transactionController.locked.value} ${transactionController.hours.value} ${transactionController.enteredPin.value}");

    // Map<String, dynamic> result = await APIFunctions.transferAmount(
    //   transactionController.toAccount.value,
    //   transactionController.amount.value,
    //   authController.userData.value!.token,
    //   transactionController.locked.value,
    //   transactionController.hours.value,
    //   transactionController.enteredPin.value,
    // );

    //log(result['isSuccess'].toString(), name: "TransferingFundsView");
    // if (result['isSuccess']) {
    // transactionController.removePaymentRequest();
    // transactionController.transactionId.value = result['id'];
    //log("Transaction ID: ${transactionController.transactionId} ${result['id']}");
    SoundPlayer.play(Sounds.orderComplete, volume: 0.8);
    await Future.delayed(const Duration(milliseconds: 1500));
    PayMeNavigation.to(TransactionSuccessView(
      routName: "Transfer",
      amount: "112983",
      toAccount: "123",
      transactionId: "53125412",
      locked: false,
      name: "Aviral",
    ));

    return;
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
              "Aviral",
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
                  color: PayMeColors.background(context),
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(
                    color: PayMeColors.transferTextFieldColor,
                    width: 4,
                  ),
                ),
                child: FittedBox(
                  child: Column(
                    children: [
                      // Icon(
                      //   Icons.arrow_upward,
                      //   size: PayMeSizes.figmaRatioWidth(context, 120),
                      //   color: PayMeColors.transferTextFieldColor,
                      // ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Lottie.asset(
                          "assets/animations/Arrow Send.json",
                          height: PayMeSizes.figmaRatioHeight(context, 120),
                        ),
                      ),
                      Material(
                        color: PayMeColors.transparent,
                        child: Text(
                          "123 QNT",
                          style: PayMeTextStyles.signUpOnboardingText.copyWith(
                            height: 0,
                            color: PayMeColors.transferTextFieldColor,
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
            Visibility(
              visible: widget.locked,
              child: Image.asset(
                PayMeImages.lockIcon,
                fit: BoxFit.fitWidth,
                height: PayMeSizes.figmaRatioHeight(context, 140),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
