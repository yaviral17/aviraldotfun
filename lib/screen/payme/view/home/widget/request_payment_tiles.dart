import 'dart:developer';

import 'package:aviraldotfun/screen/payme/models/transaction_model.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/image_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/view/home/transfer/transaction_amount_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class RequestPaymentTiles extends StatelessWidget {
  final TransactionModel transactionRequestData;
  final void Function() onCanceled;

  RequestPaymentTiles({
    super.key,
    required this.transactionRequestData,
    required this.onCanceled,
  });

  List<Color> gradientColors = [
    PayMeColors.homeScreenTransferButton,
    PayMeColors.homeScreenRecieveButton,
    PayMeColors.homeScreenFundsButton
  ];

  @override
  Widget build(BuildContext context) {
    log("Transaction id : ${transactionRequestData.trnxId} token : 123123");
    return Stack(
      children: [
        ZoomTapAnimation(
          onTap: () {
            PayMeNavigation.to(
              TransactionAmountView(
                contactName: transactionRequestData.rname,
                contactNumber: transactionRequestData.fromAccount,
                routName: "Transfer",
                amount: transactionRequestData.amount,
                requestID: transactionRequestData.trnxId,
              ),
            );
          },
          child: Container(
            width: PayMeSizes.displayWidth(context),
            height: PayMeSizes.figmaRatioHeight(context, 80),
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 0,
            ),
            decoration: BoxDecoration(
              // color: PayMeColors.paymentRecieveTile,
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  PayMeImages.recieveViewArrow,
                  color: PayMeColors.invertedText(context),
                  height: PayMeSizes.figmaRatioHeight(context, 70),
                ),
                // const Spacer(),
                SizedBox(
                  width: PayMeSizes.figmaRatioWidth(context, 24),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "3600 QNT",
                      style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                        fontSize: PayMeSizes.figmaRatioWidth(context, 24),
                        fontWeight: FontWeight.w600,
                        color: PayMeColors.invertedText(context),
                      ),
                    ),
                    SizedBox(
                      width: PayMeSizes.figmaRatioWidth(context, 160),
                      child: Text(
                        "REQ ID: 12312",
                        overflow: TextOverflow.ellipsis,
                        style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                          fontSize: PayMeSizes.figmaRatioWidth(context, 12),
                          fontWeight: FontWeight.w500,
                          color: PayMeColors.invertedText(context),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        radius: PayMeSizes.figmaRatioWidth(context, 24),
                        backgroundColor: PayMeColors.invertedText(context),
                        child: Text(
                          transactionRequestData.rname.substring(0, 2),
                          style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                            fontSize: PayMeSizes.figmaRatioWidth(
                              context,
                              18,
                            ),
                            color: PayMeColors.text(context),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ZoomTapAnimation(
            onTap: () async {
              // bool response = await removePaymentRequest(
              //   widget.transactionRequestData.trnxId,
              //   authController.userData.value!.token,
              // );

              // if (response) {
              // dashboardController.fundsRequests.value.removeWhere(
              //   (element) => element.trnxId == transactionRequestData.trnxId,
              // );
              // }

              onCanceled.call();
            },
            child: CircleAvatar(
              radius: PayMeSizes.figmaRatioWidth(
                context,
                12,
              ),
              backgroundColor: PayMeColors.text(context),
              child: Center(
                child: Icon(
                  Icons.close,
                  color: PayMeColors.offColor(context),
                  size: PayMeSizes.figmaRatioWidth(
                    context,
                    16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
