import 'dart:async';
import 'dart:developer';

import 'package:aviraldotfun/screen/payme/models/transaction_model.dart';
import 'package:aviraldotfun/screen/payme/utils/appbar/appbar.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/image_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/utils/helpers/helper_functions.dart';
import 'package:aviraldotfun/screen/payme/view/home/transfer/transaction_amount_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ChatView extends StatefulWidget {
  final String name;
  final String phone;
  const ChatView({
    super.key,
    required this.name,
    required this.phone,
  });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  List<ChatWidget> chatsAndTransactions = [];

  final TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    buildChats();
  }

  buildChats() {
    //log("Phone: ${widget.phone}");
    String tempPhone = widget.phone
        .replaceAll("+", "")
        .replaceAll(" ", "")
        .replaceAll("-", "");
    if (tempPhone.length == 10) {
      tempPhone = "91$tempPhone";
    }
    //log("Phone------------: ${tempPhone} ${authController.userData.value!.phone}");

    //log("Transaction  sdel--: ${element.toAccount} ${element.fromAccount}");
    chatsAndTransactions.add(
      ChatWidget(
        isYou: true,
        isChat: false,
        transactionData: TransactionModel(
          date: DateTime.now(),
          isLocked: false,
          rname: "You",
          sname: widget.name,
          amount: "100",
          trnxId: "TRNXID123",
          fromAccount: "1234567890",
          toAccount: "0987654321",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PayMeAppBar(
      //   showBackArrow: false,
      //   title: Row(
      //     children: [
      //       CircleAvatar(
      //         radius: PayMeSizes.figmaRatioWidth(context, 24),
      //         child: Text(
      //           (widget.name.isNotEmpty) ? widget.name[0] : "",
      //           style: PayMeTextStyles.homeScreenTextStyle.copyWith(
      //             fontSize: PayMeSizes.figmaRatioWidth(context, 16),
      //             fontWeight: FontWeight.w400,
      //             color: PayMeColors.dark,
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         width: PayMeSizes.figmaRatioWidth(context, 16),
      //       ),
      //       Text(
      //         widget.name.isNotEmpty ? widget.name : "Unknown ",
      //         style: PayMeTextStyles.homeScreenTextStyle.copyWith(
      //           fontSize: PayMeSizes.figmaRatioWidth(context, 28),
      //           fontWeight: FontWeight.w500,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 16),
            ),
            // chat list
            Expanded(
              child: Container(
                // height: PayMeSizes.figmaRatioHeight(context, 800),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 2),
                width: PayMeSizes.displayWidth(context),
                decoration: BoxDecoration(
                  color: PayMeColors.darkGrey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: chatsAndTransactions.length,
                  itemBuilder: (context, index) {
                    return chatsAndTransactions[index];
                  },
                ),
              ),
            ),
            // text field
            Container(
              width: PayMeSizes.displayWidth(context),
              height: PayMeSizes.figmaRatioHeight(context, 63),
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: PayMeColors.darkBorder,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: TextField(
                      controller: messageController,
                      inputFormatters: [
                        // allow numbers and . only
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        hintText: "Enter Amount to send",
                        hintStyle: PayMeTextStyles.homeScreenTextStyle.copyWith(
                          fontSize: PayMeSizes.figmaRatioWidth(context, 14),
                          color: PayMeColors.darkGrey,
                          fontWeight: FontWeight.w400,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 18.0),
                      ),
                    ),
                  ),
                  ZoomTapAnimation(
                    onTap: () {
                      // send message

                      if (messageController.text.isEmpty) {
                        PayMeHelperFunctions.showErrorMessageGet(
                          // add emoji in the end of title
                          title: "Amount Missing 😕",
                          message:
                              "Please enter amount to send to ${widget.name}",
                        );
                        return;
                      }

                      PayMeNavigation.to(
                        TransactionAmountView(
                          contactName: widget.name,
                          contactNumber: widget.phone,
                          routName: "Transfer",
                          amount: messageController.text,
                        ),
                      );
                    },
                    begin: 1.0,
                    end: 0.9,
                    child: FittedBox(
                      child: Container(
                        width: PayMeSizes.figmaRatioWidth(context, 63),
                        height: PayMeSizes.figmaRatioHeight(context, 63),
                        decoration: BoxDecoration(
                          color: PayMeColors.recieveTextFieldColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Icon(
                          Iconsax.send_1,
                          color: PayMeColors.dark,
                          size: PayMeSizes.figmaRatioWidth(context, 24),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatWidget extends StatelessWidget {
  final bool isYou;
  final bool isChat;
  final TransactionModel? transactionData;
  final String? message;

  const ChatWidget({
    super.key,
    required this.isYou,
    required this.isChat,
    this.transactionData,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return !isChat
        ? Row(
            mainAxisAlignment:
                isYou ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                width: PayMeSizes.figmaRatioWidth(context, 273),
                height: PayMeSizes.figmaRatioHeight(context, 80),
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isYou
                      ? PayMeColors.paymentSentTile
                      : PayMeColors.paymentRecieveTile,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      isYou
                          ? PayMeImages.transferViewArrow
                          : PayMeImages.recieveViewArrow,
                      color: PayMeColors.dark,
                      height: PayMeSizes.figmaRatioHeight(context, 70),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${transactionData?.amount ?? 100} QNT",
                          style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                            fontSize: PayMeSizes.figmaRatioWidth(context, 32),
                            fontWeight: FontWeight.w600,
                            color: PayMeColors.dark,
                          ),
                        ),
                        SizedBox(
                          width: PayMeSizes.figmaRatioWidth(context, 160),
                          child: Text(
                            "TRNX ID: ${transactionData?.trnxId ?? ""}",
                            overflow: TextOverflow.ellipsis,
                            style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                              fontSize: PayMeSizes.figmaRatioWidth(context, 12),
                              fontWeight: FontWeight.w500,
                              color: PayMeColors.dark,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              )
            ],
          )
        : Row(
            mainAxisAlignment:
                isYou == true ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isYou
                      ? PayMeColors.chatTile.withOpacity(0.24)
                      : PayMeColors.chatTile,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Text(
                  message ?? "",
                  style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                    fontSize: PayMeSizes.figmaRatioWidth(
                      context,
                      14,
                    ),
                    fontWeight: FontWeight.w500,
                    color: !isYou ? PayMeColors.dark : PayMeColors.white,
                  ),
                ),
              ),
            ],
          );
  }
}
