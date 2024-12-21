import 'dart:async';
import 'dart:developer';

import 'package:animation_list/animation_list.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class BalanceView extends StatefulWidget {
  const BalanceView({super.key});

  @override
  State<BalanceView> createState() => _BalanceViewState();
}

class _BalanceViewState extends State<BalanceView> {
  @override
  void initState() {
    super.initState();

    // dashboardController.getTransactions(authController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back,
      //       color: PayMeColors.white,
      //     ),
      //     onPressed: () {
      //       PayMeNavigation.fadeBack();
      //     },
      //   ),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                Container(
                  height: PayMeSizes.figmaRatioHeight(context, 100),
                  width: PayMeSizes.figmaRatioWidth(context, 180),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: PayMeColors.homeScreenScanQRButton,
                    boxShadow: [
                      BoxShadow(
                        color: PayMeColors.white.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Usable Balance",
                          style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                            color: PayMeColors.dark,
                            fontSize: PayMeSizes.figmaRatioWidth(context, 18),
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            "QNT 34534",
                            style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                              color: PayMeColors.dark,
                              fontSize: PayMeSizes.figmaRatioWidth(context, 24),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: PayMeSizes.figmaRatioHeight(context, 100),
                  width: PayMeSizes.figmaRatioWidth(context, 180),
                  decoration: BoxDecoration(
                    color: PayMeColors.homeScreenFundsButton,
                    boxShadow: [
                      BoxShadow(
                        color: PayMeColors.white.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Locked Balance",
                          style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                            color: PayMeColors.dark,
                            fontSize: PayMeSizes.figmaRatioWidth(context, 18),
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            "QNT 324",
                            style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                              color: PayMeColors.dark,
                              fontSize: PayMeSizes.figmaRatioWidth(context, 24),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // const Spacer(),
                // ZoomTapAnimation(
                //   onTap: () {
                //     PayMeNavigation.to(const LockedBalanceView());
                //   },
                //   child: Container(
                //     width: PayMeSizes.figmaRatioWidth(context, 100),
                //     height: PayMeSizes.figmaRatioWidth(context, 80),
                //     decoration: BoxDecoration(
                //       color: PayMeColors.homeScreenRecieveButton,
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     padding: const EdgeInsets.all(12),
                //     child: FittedBox(
                //       child: Image.asset(
                //         PayMeImages.unlockBalance,
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          SizedBox(
            height: PayMeSizes.figmaRatioHeight(context, 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              "Balance History",
              style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                color: PayMeColors.white,
                fontSize: PayMeSizes.figmaRatioWidth(context, 24),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: PayMeSizes.figmaRatioHeight(context, 20),
          ),
          Expanded(
            child: AnimationList(
              children: [
                ...List.generate(
                  5,
                  (index) {
                    return BalanceHistoryWidget(
                      trnxId: "TRNX ID: 231124124123",
                      name: "Aarav Gaur",
                      date: DateTime.now(),
                      amount: 100 * (index + 1),
                      isUpward: index.isEven,
                      onTap: () {
                        // PayMeNavigation.fadeTo()
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BalanceHistoryWidget extends StatelessWidget {
  final bool isUpward;
  final String trnxId;
  final String name;
  final DateTime date;
  final double amount;
  final void Function()? onTap;

  const BalanceHistoryWidget({
    super.key,
    required this.isUpward,
    required this.trnxId,
    required this.name,
    required this.date,
    required this.amount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: PayMeColors.white.withOpacity(0.1),
      splashFactory: InkRipple.splashFactory,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 12,
        ),
        child: Row(
          children: [
            Icon(
              isUpward ? Icons.arrow_upward : Icons.arrow_downward,
              color: isUpward
                  ? PayMeColors.balanceUpArrow
                  : PayMeColors.balanceDownArrow,
              size: PayMeSizes.figmaRatioWidth(context, 28),
            ),
            SizedBox(
              width: PayMeSizes.figmaRatioWidth(context, 10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: PayMeSizes.figmaRatioWidth(context, 180),
                  child: Text(
                    trnxId,
                    overflow: TextOverflow.ellipsis,
                    style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                      color: PayMeColors.white,
                      fontSize: PayMeSizes.figmaRatioWidth(context, 10),
                    ),
                  ),
                ),
                Text(
                  name,
                  style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                    color: PayMeColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: PayMeSizes.figmaRatioWidth(context, 20),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  PayMeHelperFunctions.getFormattedDate(date),
                  // "30 May 2024",
                  style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                    color: PayMeColors.white,
                    fontSize: PayMeSizes.figmaRatioWidth(context, 10),
                  ),
                ),
                Text(
                  "${amount.toDouble().toString().split('.').first} QNT",
                  style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                    color: PayMeColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: PayMeSizes.figmaRatioWidth(context, 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
