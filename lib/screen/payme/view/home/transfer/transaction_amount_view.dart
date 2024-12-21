import 'dart:developer';
import 'dart:io';

import 'package:aviraldotfun/screen/payme/utils/appbar/appbar.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/image_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/utils/helpers/helper_functions.dart';
import 'package:aviraldotfun/screen/payme/utils/widgets/payme_primary_button_widget.dart';
import 'package:aviraldotfun/screen/payme/view/home/recieve/recieving_funds_view.dart';
import 'package:aviraldotfun/screen/payme/view/home/transfer/ask_lock_amount_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TransactionAmountView extends StatefulWidget {
  final String routName;
  final String contactName;
  final String contactNumber;
  final File? contactImage;
  final String? requestID;

  final String? amount;
  const TransactionAmountView({
    super.key,
    required this.contactName,
    required this.contactNumber,
    required this.routName,
    this.contactImage,
    this.amount,
    this.requestID,
  });

  @override
  State<TransactionAmountView> createState() => _TransactionAmountViewState();
}

class _TransactionAmountViewState extends State<TransactionAmountView> {
  bool isContinuePressed = true;
  late String routName;
  late bool isRecieveFlow;
  final TextEditingController qntController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    routName = widget.routName;
    isRecieveFlow = widget.routName == "Receive";
  }

  @override
  Widget build(BuildContext context) {
    log("Transaction id- : ${widget.requestID}");
    return Scaffold(
      // appBar: const PayMeAppBar(
      //   showBackArrow: true,
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 40),
            ),
            CircleAvatar(
              radius: PayMeSizes.figmaRatioWidth(context, 60),
              backgroundColor: PayMeColors.transferScreenCircleAvatar,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: widget.contactImage == null
                    ? Text(
                        widget.contactName[0],
                        style: TextStyle(
                          color: PayMeColors.white,
                          fontSize: PayMeSizes.figmaRatioWidth(context, 36),
                        ),
                      )
                    : Image.file(
                        widget.contactImage!,
                      ),
              ),
            ),
            Text(
              widget.contactName,
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
            // SizedBox(
            //   height: PayMeSizes.figmaRatioHeight(context, 10),
            // ),
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 200),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                child: FittedBox(
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 400),
                    scale: isRecieveFlow ? 1 : 1,
                    curve: Curves.fastOutSlowIn,
                    child: AnimatedRotation(
                      duration: const Duration(milliseconds: 600),
                      turns: isRecieveFlow ? 1 : 0,
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: Image.asset(
                        isRecieveFlow
                            ? PayMeImages.recieveViewArrow
                            : PayMeImages.transferViewArrow,
                        fit: BoxFit.fitWidth,
                        // height: PayMeSizes.figmaRatioHeight(context, 200),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Text(
              'Enter Funds to ${routName}',
              style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                color: PayMeColors.white,
                fontSize: PayMeSizes.figmaRatioWidth(context, 20),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 8),
            ),
            Center(
              child: Container(
                width: PayMeSizes.figmaRatioWidth(context, 272),
                height: PayMeSizes.figmaRatioHeight(context, 72),
                decoration: BoxDecoration(
                  color: PayMeColors.transparent,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: isRecieveFlow
                        ? PayMeColors.recieveTextFieldColor
                        : PayMeColors.transferTextFieldColor,
                    width: 4,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 6,
                      child: TextField(
                        controller: qntController,
                        textAlign: TextAlign.right,
                        enabled: widget.requestID != null ? false : true,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: '00',
                          hintStyle:
                              PayMeTextStyles.homeScreenTextStyle.copyWith(
                            color: isRecieveFlow
                                ? PayMeColors.recieveTextFieldColor
                                : PayMeColors.transferTextFieldColor,
                            fontSize: PayMeSizes.figmaRatioWidth(context, 28),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty || double.parse(value) == 0) {
                              isContinuePressed = true;
                            } else {
                              isContinuePressed = false;
                            }

                            if (value.isEmpty) {
                              return;
                            }
                          });
                        },
                        style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                          color: isRecieveFlow
                              ? PayMeColors.recieveTextFieldColor
                              : PayMeColors.transferTextFieldColor,
                          fontSize: PayMeSizes.figmaRatioWidth(context, 28),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: PayMeSizes.figmaRatioWidth(context, 4),
                    ),
                    Expanded(
                      flex: 7,
                      child: Text(
                        "QNT",
                        style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                          color: isRecieveFlow
                              ? PayMeColors.recieveTextFieldColor
                              : PayMeColors.transferTextFieldColor,
                          fontSize: PayMeSizes.figmaRatioWidth(context, 28),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(
                  context, widget.requestID != null ? 80 * 2 : 80),
            ),
            Column(
              children: [
                PayMePrimaryButton(
                  labelText: PayMeTexts.continue_,
                  isDisabled: isContinuePressed,
                  onPressed: () {
                    if (isRecieveFlow) {
                      PayMeNavigation.to(
                        ReceivingFundsView(),
                      );
                      return;
                    }

                    PayMeNavigation.to(
                      const AskLockAmountView(),
                    );
                  },
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 12),
                ),
                Visibility(
                  visible: !(widget.requestID != null),
                  child: PayMePrimaryButton(
                    labelText: "Receive Funds Instead",
                    onPressed: () {
                      setState(() {
                        switch (routName) {
                          case "Transfer":
                            routName = "Receive";
                            isRecieveFlow = true;
                            break;
                          case "Receive":
                            routName = "Transfer";
                            isRecieveFlow = false;
                            break;
                          default:
                        }
                      });
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
