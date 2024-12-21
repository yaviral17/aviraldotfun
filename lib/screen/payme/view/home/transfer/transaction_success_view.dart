import 'dart:developer';
import 'dart:io';

import 'package:aviraldotfun/screen/payme/utils/appbar/appbar.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/image_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/utils/helpers/helper_functions.dart';
import 'package:aviraldotfun/screen/payme/utils/widgets/payme_primary_button_widget.dart';
import 'package:aviraldotfun/screen/payme/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sound_library/sound_library.dart';

class TransactionSuccessView extends StatefulWidget {
  final String routName;
  final bool isHistory;
  final String name;
  final String toAccount;
  final String amount;
  final String transactionId;
  final bool locked;

  const TransactionSuccessView({
    super.key,
    this.isHistory = false,
    required this.routName,
    required this.name,
    required this.toAccount,
    required this.amount,
    required this.transactionId,
    required this.locked,
  });

  @override
  State<TransactionSuccessView> createState() => _TransactionSuccessViewState();
}

class _TransactionSuccessViewState extends State<TransactionSuccessView> {
  final ScreenshotController screenshotController = ScreenshotController();

  /// this popping variable prevents multiple pop function calls when the back button is pressed multiple times
  /// when routing from [balance_view] to [transaction_success_view]
  bool popping = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isRecieveFlow = widget.routName == "Receive";
    return Scaffold(
      // appBar: const PayMeAppBar(
      //   /// keep it false to hide the back arrow
      //   showBackArrow: false,
      // ),
      body: PopScope(
        canPop: false,

        /// this [onPopInvoked] function is called when the back button is pressed
        onPopInvoked: (didPop) async {
          if (popping) {
            return;
          }

          popping = true;
          await Future.delayed(const Duration(milliseconds: 300));

          if (widget.isHistory) {
            PayMeNavigation.fadeBack();
          } else {
            PayMeNavigation.to(const HomeView());
          }

          popping = false;
        },

        child: Screenshot(
          controller: screenshotController,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 40),
                ),
                CircleAvatar(
                  radius: PayMeSizes.figmaRatioWidth(context, 60),
                  backgroundColor: PayMeColors.transferScreenCircleAvatar,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Text(
                        widget.name[0].toUpperCase(),
                        style: TextStyle(
                          color: PayMeColors.white,
                          fontSize: PayMeSizes.figmaRatioWidth(context, 36),
                        ),
                      )),
                ),
                Text(
                  widget.name,
                  style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                    color: PayMeColors.white,
                    fontSize: PayMeSizes.figmaRatioWidth(context, 40),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.toAccount,
                  style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                    color: PayMeColors.darkGrey,
                    fontSize: PayMeSizes.figmaRatioWidth(context, 16),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 40),
                ),
                Text(
                  widget.routName != "Receive"
                      ? "Funds Transfered Successfully 🎉"
                      : "Funds Request Sent Successfully 🎉",
                  style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                    color: PayMeColors.white,
                    fontSize: PayMeSizes.figmaRatioWidth(context, 16),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 16),
                ),
                Hero(
                  tag: "transferingFunds",
                  child: Material(
                    color: PayMeColors.transparent,
                    child: Container(
                      width: PayMeSizes.figmaRatioWidth(context, 350),
                      height: PayMeSizes.figmaRatioHeight(context, 120),
                      decoration: BoxDecoration(
                        color: isRecieveFlow
                            ? PayMeColors.recieveTextFieldColor
                            : PayMeColors.transferTextFieldColor,
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(
                          color: isRecieveFlow
                              ? PayMeColors.recieveTextFieldColor
                              : PayMeColors.transferTextFieldColor,
                          width: 4,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: PayMeSizes.figmaRatioWidth(context, 20),
                            ),
                            Expanded(
                              flex: 2,
                              child: Image.asset(
                                isRecieveFlow
                                    ? PayMeImages.recieveViewArrow
                                    : PayMeImages.transferViewArrow,
                                color: PayMeColors.dark,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                            SizedBox(
                              width: PayMeSizes.figmaRatioWidth(context, 12),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    child: Text(
                                      "${widget.amount} QNT",
                                      style: PayMeTextStyles.homeScreenTextStyle
                                          .copyWith(
                                        color: PayMeColors.dark,
                                        fontSize: PayMeSizes.figmaRatioHeight(
                                            context, 40),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: PayMeSizes.figmaRatioWidth(
                                        context, 162),
                                    child: Text(
                                      "TRNX ID: ${widget.transactionId}",
                                      overflow: TextOverflow.ellipsis,
                                      style: PayMeTextStyles.homeScreenTextStyle
                                          .copyWith(
                                        color: PayMeColors.dark,
                                        fontSize: PayMeSizes.figmaRatioHeight(
                                            context, 14),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: PayMeSizes.figmaRatioHeight(
                                        context, 16),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Visibility(
                                  visible: widget.locked,
                                  child: Image.asset(
                                    PayMeImages.lockIcon,
                                    fit: BoxFit.fitWidth,
                                    height: PayMeSizes.figmaRatioHeight(
                                        context, 40),
                                    color: PayMeColors.dark,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                PayMePrimaryButton(
                  onPressed: () {
                    PayMeNavigation.to(const HomeView());
                  },
                  labelText: "Go Back To Dashboard",
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 10),
                ),
                Visibility(
                  visible: widget.routName == "Transfer",
                  child: PayMePrimaryButton(
                    onPressed: () async {
                      final directory =
                          await getApplicationDocumentsDirectory();
                      final imagePath =
                          '${directory.path}/screenshot_${PayMeHelperFunctions.getFormattedDate(DateTime.now(), format: "dd-MMM-yyyy_hh:mm:ss")}.png';
                      // capture and save the screenshot
                      screenshotController
                          .capture(delay: const Duration(milliseconds: 10))
                          .then((image) async {
                        if (image != null) {
                          final file = File(imagePath);
                          await file.writeAsBytes(image);

                          Share.shareXFiles(
                              [XFile.fromData(image, mimeType: 'text/plain')],
                              fileNameOverrides: ['image.png']);
                          // print('Screenshot saved to $imagePath');
                        }
                      }).catchError((onError) {
                        print(onError);
                      });
                    },
                    labelText: "Share Screenshot",
                  ),
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
