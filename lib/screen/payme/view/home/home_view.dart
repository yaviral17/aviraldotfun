import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:aviraldotfun/screen/payme/models/bill_section_item_model.dart';
import 'package:aviraldotfun/screen/payme/models/transaction_model.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/image_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/utils/helpers/helper_functions.dart';
import 'package:aviraldotfun/screen/payme/view/auth/auth_view.dart';
import 'package:aviraldotfun/screen/payme/view/home/all_funds_requests_view.dart';
import 'package:aviraldotfun/screen/payme/view/home/balance/balance_view.dart';
import 'package:aviraldotfun/screen/payme/view/home/chat_view.dart';
import 'package:aviraldotfun/screen/payme/view/home/contact_view.dart';
import 'package:aviraldotfun/screen/payme/view/home/profile/profile_view.dart';
import 'package:aviraldotfun/screen/payme/view/home/widget/request_payment_tiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
// biomatric auth

  bool popped = false;

  List<BillSectionItemModel> billSectionItems = [
    BillSectionItemModel(
        title: "Mobile\nRecharge",
        iconImage: PayMeImages.billsMobileRecharge,
        color: PayMeColors.homeScreenTransferButton),
    BillSectionItemModel(
        title: "Electricity\nBill",
        iconImage: PayMeImages.billsElectricity,
        color: PayMeColors.homeScreenFundsButton),
    BillSectionItemModel(
      title: "Internet\nBill",
      iconImage: PayMeImages.billsInternet,
      color: PayMeColors.homeScreenScanQRButton,
    ),
    BillSectionItemModel(
        title: "Mobile\nRecharge",
        iconImage: PayMeImages.billsMobileRecharge,
        color: PayMeColors.homeScreenTransferButton),
    BillSectionItemModel(
        title: "Electricity\nBill",
        iconImage: PayMeImages.billsElectricity,
        color: PayMeColors.homeScreenFundsButton),
    BillSectionItemModel(
      title: "Internet\nBill",
      iconImage: PayMeImages.billsInternet,
      color: PayMeColors.homeScreenScanQRButton,
    ),
    BillSectionItemModel(
        title: "Mobile\nRecharge",
        iconImage: PayMeImages.billsMobileRecharge,
        color: PayMeColors.homeScreenTransferButton),
    BillSectionItemModel(
        title: "Electricity\nBill",
        iconImage: PayMeImages.billsElectricity,
        color: PayMeColors.homeScreenFundsButton),
    BillSectionItemModel(
      title: "Internet\nBill",
      iconImage: PayMeImages.billsInternet,
      color: PayMeColors.homeScreenScanQRButton,
    ),
    BillSectionItemModel(
        title: "Mobile\nRecharge",
        iconImage: PayMeImages.billsMobileRecharge,
        color: PayMeColors.homeScreenTransferButton),
    BillSectionItemModel(
        title: "Electricity\nBill",
        iconImage: PayMeImages.billsElectricity,
        color: PayMeColors.homeScreenFundsButton),
    BillSectionItemModel(
      title: "Internet\nBill",
      iconImage: PayMeImages.billsInternet,
      color: PayMeColors.homeScreenScanQRButton,
    ),
  ];

  UniqueKey balanceKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    // localAuthController.checkBiometric();
    // accountBalance();

    balanceKey = UniqueKey();
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          // //log("Did Pop: $didPop, Result: $result");
          // if (didPop) {
          // show cupertino dialog box where user can  select logout , cancel or exit app and logout user if user selects logout  and exit app if user selects exit app

          showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: const Text("Choose any option"),
                content: const Text("Do you want to logout or exit app?"),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () {
                      // logout user
                      PayMeNavigation.to(const AuthView());
                      // navigate to auth view
                      // PayMeNavigation.to(const AuthView());
                    },
                    child: const Text("Logout"),
                  ),
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Exit"),
                  ),
                ],
              );
            },
          );

          // }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: PayMeSizes.figmaRatioWidth(context, 16),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: PayMeSizes.figmaRatioHeight(context, 20),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ZoomTapAnimation(
                      onTap: () {
                        PayMeNavigation.to(const ProfileView());
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(
                            PayMeSizes.figmaRatioWidth(context, 60))),
                        child: Container(
                          color: PayMeColors.text(context),
                          width: PayMeSizes.figmaRatioWidth(context, 54),
                          child: Image.asset(
                            "assets/images/3DProfile/1.png",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: PayMeSizes.figmaRatioWidth(context, 12),
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: TextEditingController(),
                        width: PayMeSizes.figmaRatioWidth(context, 258),
                        hintText: 'Search Text',
                        hintStyle: PayMeTextStyles.homeScreenTextStyle.copyWith(
                          color: PayMeColors.text(context).withOpacity(0.8),
                        ),
                        suffixIcon: Icon(
                          Icons.search,
                          color: PayMeColors.text(context),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 10),
                ),

                // Balance Card
                Center(
                  child: ZoomTapAnimation(
                    begin: 1.0,
                    end: 0.98,
                    onTap: () {
                      PayMeNavigation.to(const BalanceView());
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            PayMeSizes.figmaRatioWidth(
                              context,
                              16,
                            ),
                          ),
                          child: Image.asset(
                            PayMeImages.balanceCardBg,
                            fit: BoxFit.fill,
                            width: PayMeSizes.figmaRatioWidth(context, 368),
                            height: PayMeSizes.figmaRatioHeight(context, 158),
                          ),
                        ),
                        balanceCardUI(context),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainDashboardButtons(
                      color: PayMeColors.homeScreenTransferButton,
                      labelText: 'Transfer',
                      iconImage: PayMeImages.transferIcon,
                      onTap: () {
                        PayMeNavigation.to(
                          const ContactView(
                            routeName: "Transfer",
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: PayMeSizes.figmaRatioWidth(context, 6),
                    ),
                    MainDashboardButtons(
                      color: PayMeColors.homeScreenRecieveButton,
                      labelText: 'Receive',
                      iconImage: PayMeImages.recieveIcon,
                      onTap: () {
                        //log("Receive");
                        PayMeNavigation.to(
                          const ContactView(
                            routeName: "Receive",
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 6),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainDashboardButtons(
                      color: PayMeColors.homeScreenFundsButton,
                      labelText: 'Withdraw',
                      iconImage: PayMeImages.fundsIcon,
                    ),
                    SizedBox(
                      width: PayMeSizes.figmaRatioWidth(context, 6),
                    ),
                    MainDashboardButtons(
                      color: PayMeColors.homeScreenScanQRButton,
                      labelText: 'Scan QR',
                      iconImage: PayMeImages.qrIcon,
                      onTap: () async {},
                    ),
                  ],
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 28),
                ),
                Visibility(
                  visible: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Requests',
                        style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                          color: PayMeColors.text(context),
                          fontSize: PayMeSizes.figmaRatioWidth(
                            context,
                            20,
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: PayMeSizes.figmaRatioHeight(context, 4),
                      // ),

                      SizedBox(
                        child: RequestPaymentTiles(
                          transactionRequestData: TransactionModel(
                            trnxId: "1234567890",
                            fromAccount: "1234567890",
                            toAccount: "1234567890",
                            date: DateTime.now(),
                            amount: "200",
                            isLocked: false,
                            rname: "Jhon Doe",
                            sname: "Jane Doe",
                          ),
                          onCanceled: () async {
                            setState(() {});
                          },
                        ),
                      ),

                      SizedBox(
                        height: PayMeSizes.figmaRatioHeight(context, 28),
                      ),
                    ],
                  ),
                ),

                // Your Contacts Section
                Text(
                  'Your Contacts',
                  style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                    color: PayMeColors.text(context),
                    fontSize: PayMeSizes.figmaRatioWidth(
                      context,
                      20,
                    ),
                  ),
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 12),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    4,
                    (index) {
                      return ZoomTapAnimation(
                        onTap: () {
                          PayMeNavigation.to(ChatView(
                            name: "Jhon Doe",
                            phone: "1234567890",
                          ));
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CircleAvatar(
                              radius: PayMeSizes.figmaRatioWidth(context, 34),
                              child: Text(
                                "J",
                                style: PayMeTextStyles.homeScreenTextStyle
                                    .copyWith(
                                  fontSize: PayMeSizes.figmaRatioWidth(
                                    context,
                                    24,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: PayMeSizes.figmaRatioHeight(context, 4),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "Jhon Doe",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: PayMeTextStyles.homeScreenTextStyle
                                    .copyWith(
                                  color: PayMeColors.text(context),
                                  fontSize: PayMeSizes.figmaRatioWidth(
                                    context,
                                    12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    4,
                    (index) {
                      if (index == 3) {
                        return ViewMoreCircleButton(
                          onTap: () {
                            PayMeNavigation.to(const ContactView(
                              routeName: "Contacts",
                            ));
                          },
                        );
                      }
                      return ZoomTapAnimation(
                        onTap: () {
                          PayMeNavigation.to(ChatView(
                            name: "Jhon Doe",
                            phone: "1234567890",
                          ));
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CircleAvatar(
                              radius: PayMeSizes.figmaRatioWidth(context, 34),
                              child: Text(
                                "J",
                                style: PayMeTextStyles.homeScreenTextStyle
                                    .copyWith(
                                  fontSize: PayMeSizes.figmaRatioWidth(
                                    context,
                                    24,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: PayMeSizes.figmaRatioHeight(context, 4),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "Jhon Doe",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: PayMeTextStyles.homeScreenTextStyle
                                    .copyWith(
                                  color: PayMeColors.text(context),
                                  fontSize: PayMeSizes.figmaRatioWidth(
                                    context,
                                    12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 28),
                ),

                // Your Bills and Recharges Section
                Text(
                  'Your Bills and Recharges',
                  style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                    color: PayMeColors.text(context),
                    fontSize: PayMeSizes.figmaRatioWidth(
                      context,
                      20,
                    ),
                  ),
                ),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 12),
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: PayMeSizes.figmaRatioHeight(context, 100),
                      width: PayMeSizes.displayWidth(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          4,
                          (index) {
                            if (index == 3) {
                              return FittedBox(child: ViewMoreCircleButton(
                                onTap: () {
                                  // PayMeNavigation.to(
                                  //   BillsAndRechargeView(
                                  //     billSectionItems: billSectionItems,
                                  //   ),
                                  // );
                                },
                              ));
                            }
                            return FittedBox(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  CircleAvatar(
                                    radius:
                                        PayMeSizes.figmaRatioWidth(context, 34),
                                    backgroundColor:
                                        billSectionItems[index].color,
                                    child: Image.asset(
                                      billSectionItems[index].iconImage,
                                      width: PayMeSizes.figmaRatioWidth(
                                          context, 24),
                                      height: PayMeSizes.figmaRatioHeight(
                                          context, 24),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        PayMeSizes.figmaRatioHeight(context, 4),
                                  ),
                                  Text(
                                    billSectionItems[index].title,
                                    textAlign: TextAlign.center,
                                    style: PayMeTextStyles.homeScreenTextStyle
                                        .copyWith(
                                      fontSize: PayMeSizes.figmaRatioWidth(
                                        context,
                                        12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    // GridView.builder(
                    //   shrinkWrap: true,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 4,
                    //     crossAxisSpacing:
                    //         PayMeSizes.figmaRatioWidth(context, 1),
                    //     mainAxisSpacing:
                    //         PayMeSizes.figmaRatioHeight(context, 1),
                    //     childAspectRatio: 1,
                    //   ),
                    //   itemCount: 4,
                    //   itemBuilder: (context, index) {

                    //   },
                    // ),
                    Container(
                      height: PayMeSizes.figmaRatioHeight(context, 100),
                      width: PayMeSizes.displayWidth(context),
                      decoration: BoxDecoration(
                        color: (PayMeHelperFunctions.isDarkMode(context)
                                ? PayMeColors.dark
                                : PayMeColors.offLight)
                            .withOpacity(0.82),
                      ),
                      child: Center(
                        child: Text(
                          "C O M I N G   S O O N",
                          style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                            color: PayMeColors.text(context),
                            fontSize: PayMeSizes.figmaRatioWidth(
                              context,
                              24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget balanceCardUI(BuildContext context) {
    return Container(
      width: PayMeSizes.figmaRatioWidth(context, 368),
      height: PayMeSizes.figmaRatioHeight(context, 158),
      padding: EdgeInsets.symmetric(
        horizontal: PayMeSizes.figmaRatioWidth(context, 12),
        vertical: PayMeSizes.figmaRatioHeight(context, 16),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: PayMeColors.text(context),
        ),
        borderRadius: BorderRadius.circular(
          PayMeSizes.figmaRatioWidth(
            context,
            16,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Balance',
            style: PayMeTextStyles.homeScreenTextStyle.copyWith(
              color: PayMeColors.text(context),
              fontSize: PayMeSizes.figmaRatioWidth(
                context,
                24,
              ),
            ),
          ),
          Text(
            'QNT 200',
            style: PayMeTextStyles.homeScreenTextStyle.copyWith(
              color: PayMeColors.text(context),
              fontSize: PayMeSizes.figmaRatioWidth(
                context,
                36,
              ),
            ),
          ),
          const Spacer(),
          Text(
            "Tap for Balance History and Locked Balance",
            style: PayMeTextStyles.homeScreenTextStyle.copyWith(
              color: PayMeColors.text(context),
              fontSize: PayMeSizes.figmaRatioWidth(
                context,
                12,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class loadingBalanceUI extends StatelessWidget {
  const loadingBalanceUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: PayMeColors.homeScreenScanQRButton,
      highlightColor: PayMeColors.transferScreenCircleAvatar,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          PayMeSizes.figmaRatioWidth(
            context,
            16,
          ),
        ),
        child: Container(
          width: PayMeSizes.figmaRatioWidth(context, 368),
          height: PayMeSizes.figmaRatioHeight(context, 158),
          padding: EdgeInsets.symmetric(
            horizontal: PayMeSizes.figmaRatioWidth(context, 12),
            vertical: PayMeSizes.figmaRatioHeight(context, 16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: PayMeSizes.figmaRatioHeight(
                  context,
                  24,
                ),
                decoration: BoxDecoration(
                  color: PayMeColors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(
                    PayMeSizes.figmaRatioWidth(
                      context,
                      100,
                    ),
                  ),
                ),
                child: Text(
                  '                      ',
                  style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                    fontSize: PayMeSizes.figmaRatioWidth(
                      context,
                      24,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: PayMeSizes.figmaRatioHeight(context, 8),
                ),
                height: PayMeSizes.figmaRatioHeight(
                  context,
                  36,
                ),
                decoration: BoxDecoration(
                  color: PayMeColors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(
                    PayMeSizes.figmaRatioWidth(
                      context,
                      100,
                    ),
                  ),
                ),
                child: Text(
                  '                              ',
                  style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                    fontSize: PayMeSizes.figmaRatioWidth(
                      context,
                      36,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                height: PayMeSizes.figmaRatioHeight(
                  context,
                  16,
                ),
                decoration: BoxDecoration(
                  color: PayMeColors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(
                    PayMeSizes.figmaRatioWidth(
                      context,
                      100,
                    ),
                  ),
                ),
                child: Text(
                  "                                                   ",
                  style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                    fontSize: PayMeSizes.figmaRatioWidth(
                      context,
                      12,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ViewMoreCircleButton extends StatelessWidget {
  final void Function()? onTap;
  final String? labelText;
  final Widget? child;
  final Color? color;

  const ViewMoreCircleButton({
    super.key,
    this.onTap,
    this.labelText,
    this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      begin: 1.0,
      end: 0.98,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            radius: PayMeSizes.figmaRatioWidth(context, 34),
            backgroundColor: PayMeColors.text(context),
            child: child ??
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: PayMeColors.invertedText(context),
                      size: PayMeSizes.figmaRatioWidth(context, 32),
                    )),
          ),
          SizedBox(
            height: PayMeSizes.figmaRatioHeight(context, 4),
          ),
          Text(
            labelText ?? 'View More',
            style: PayMeTextStyles.homeScreenTextStyle.copyWith(
              color: PayMeColors.text(context),
              fontSize: PayMeSizes.figmaRatioWidth(
                context,
                12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final double? height;
  final double? width;
  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(String)? onSubmitted;
  final void Function()? onEditingComplete;
  final BorderRadius? borderRadius;

  const CustomTextField({
    super.key,
    this.height,
    this.width,
    required this.controller,
    required this.hintText,
    this.textStyle,
    this.onChanged,
    this.onTap,
    this.onSubmitted,
    this.onEditingComplete,
    this.suffixIcon,
    this.hintStyle,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: PayMeSizes.figmaRatioHeight(context, 62),
      width: PayMeSizes.displayWidth(context),
      padding: EdgeInsets.symmetric(
        horizontal: PayMeSizes.figmaRatioWidth(context, 20),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: PayMeColors.text(context),
        ),
        borderRadius: borderRadius ??
            BorderRadius.circular(
              PayMeSizes.figmaRatioWidth(
                context,
                16,
              ),
            ),
      ),
      child: Center(
        child: TextField(
          // no lines no decoration
          controller: controller,
          onChanged: onChanged,
          onTap: onTap,
          onSubmitted: onSubmitted,
          onEditingComplete: onEditingComplete,

          style: textStyle ??
              PayMeTextStyles.homeScreenTextStyle.copyWith(
                color: PayMeColors.text(context),
              ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle ??
                TextStyle(
                  color: PayMeColors.textSecondary(context),
                ),
            suffixIcon: suffixIcon ??
                Icon(
                  Icons.search,
                  color: PayMeColors.text(context),
                ),
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class MainDashboardButtons extends StatelessWidget {
  final double? height;
  final double? width;
  final void Function()? onTap;
  final String? labelText;
  final String? iconImage;
  final Color? color;
  final Widget? child;

  const MainDashboardButtons({
    super.key,
    this.height,
    this.width,
    this.onTap,
    this.labelText,
    this.iconImage,
    this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap?.call();
      },
      begin: 1.0,
      end: 0.96,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          PayMeSizes.figmaRatioWidth(
            context,
            18,
          ),
        ),
        child: Container(
          height: height ?? PayMeSizes.figmaRatioHeight(context, 70),
          width: width ?? PayMeSizes.figmaRatioWidth(context, 178),
          decoration: BoxDecoration(
            color: color ?? PayMeColors.homeScreenTransferButton,
            // borderRadius: BorderRadius.circular(
            //   PayMeSizes.figmaRatioWidth(
            //     context,
            //     26,
            //   ),
            // ),
          ),
          child: child ??
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconImage == null
                      ? const SizedBox.shrink()
                      : Image.asset(
                          iconImage ?? PayMeImages.transferIcon,
                          width: PayMeSizes.figmaRatioWidth(context, 24),
                          height: PayMeSizes.figmaRatioHeight(context, 24),
                        ),
                  SizedBox(
                    width: PayMeSizes.figmaRatioWidth(context, 8),
                  ),
                  Text(
                    labelText ?? '',
                    style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                      fontSize: PayMeSizes.figmaRatioWidth(
                        context,
                        18,
                      ),
                      color: PayMeColors.black,
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
