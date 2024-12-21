import 'dart:developer';

import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/image_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/view/auth/signup/pick_profile_view.dart';
import 'package:aviraldotfun/screen/payme/view/coming_soon_view.dart';
import 'package:aviraldotfun/screen/payme/view/home/home_view.dart';
import 'package:aviraldotfun/screen/payme/view/home/profile/add_funds/add_funds_view.dart';
import 'package:aviraldotfun/screen/payme/view/home/profile/manage_cards_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sound_library/sound_library.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  void showQrSheet(BuildContext context) {
    Get.bottomSheet(
      const ProfileQrSheetWidget(),
      backgroundColor: PayMeColors.transparent,
      isScrollControlled: true,
      enableDrag: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 20),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        PayMeNavigation.fadeBack();
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        size: PayMeSizes.figmaRatioWidth(context, 26),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: SizedBox(
                        height: PayMeSizes.figmaRatioHeight(context, 45),
                        child: FittedBox(
                          child: Text(
                            "Aviral",
                            style: PayMeTextStyles.defaultPrimaryStyle.copyWith(
                              color: PayMeColors.text(context),
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: SizedBox(
                        height: PayMeSizes.figmaRatioHeight(context, 32),
                        child: FittedBox(
                          child: Text(
                            "919116809509",
                            style: PayMeTextStyles.defaultPrimaryStyle.copyWith(
                              color: PayMeColors.text(context),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 126),
                  width: PayMeSizes.figmaRatioWidth(context, 126),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          PayMeNavigation.to(const PickProfileView());
                          HapticFeedback.lightImpact();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            width: PayMeSizes.figmaRatioWidth(context, 126),
                            height: PayMeSizes.figmaRatioWidth(context, 126),
                            decoration: BoxDecoration(
                              color: PayMeColors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Image.asset(
                              "assets/images/3DProfile/1.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            showQrSheet(context);
                          },
                          child: Container(
                            height: PayMeSizes.figmaRatioWidth(context, 40),
                            width: PayMeSizes.figmaRatioWidth(context, 40),
                            margin: const EdgeInsets.only(right: 4),
                            decoration: BoxDecoration(
                              color: PayMeColors.homeScreenScanQRButton,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: PayMeColors.invertedText(context),
                                width: 2,
                              ),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              PayMeImages.qrIcon,
                              fit: BoxFit.fill,
                              width: PayMeSizes.figmaRatioWidth(context, 40),
                              height: PayMeSizes.figmaRatioWidth(context, 40),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 60),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: MainDashboardButtons(
                      labelText: "Your QR Code",
                      color: PayMeColors.homeScreenTransferButton,
                      onTap: () {
                        showQrSheet(context);
                      },
                    ),
                  ),
                  SizedBox(
                    width: PayMeSizes.figmaRatioWidth(context, 8),
                  ),
                  Expanded(
                    child: MainDashboardButtons(
                      labelText: "Settings",
                      color: PayMeColors.homeScreenRecieveButton,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 24),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ZoomTapAnimation(
                    onTap: () {
                      PayMeNavigation.to(const ManageCardsView());
                      HapticFeedback.lightImpact();
                    },
                    child: SizedBox(
                      width: PayMeSizes.displayWidth(context),
                      height: PayMeSizes.figmaRatioHeight(context, 48),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: PayMeSizes.figmaRatioHeight(context, 24),
                            child: FittedBox(
                              child: Text(
                                "Manage your cards",
                                style: PayMeTextStyles.defaultPrimaryStyle
                                    .copyWith(
                                  color: PayMeColors.text(context),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ZoomTapAnimation(
                    onTap: () {
                      HapticFeedback.lightImpact();
                    },
                    child: SizedBox(
                      width: PayMeSizes.displayWidth(context),
                      height: PayMeSizes.figmaRatioHeight(context, 48),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: PayMeSizes.figmaRatioHeight(context, 24),
                            child: FittedBox(
                              child: Text(
                                "Autopay Requests",
                                style: PayMeTextStyles.defaultPrimaryStyle
                                    .copyWith(
                                  color: PayMeColors.text(context),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ZoomTapAnimation(
                    onTap: () {
                      PayMeNavigation.to(const AddFundsView());
                      HapticFeedback.lightImpact();
                    },
                    child: SizedBox(
                      width: PayMeSizes.displayWidth(context),
                      height: PayMeSizes.figmaRatioHeight(context, 48),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: PayMeSizes.figmaRatioHeight(context, 24),
                            child: FittedBox(
                              child: Text(
                                "Recharge Wallet",
                                style: PayMeTextStyles.defaultPrimaryStyle
                                    .copyWith(
                                  color: PayMeColors.text(context),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ZoomTapAnimation(
                    onTap: () {
                      PayMeNavigation.to(const ComingSoonView());
                      HapticFeedback.lightImpact();
                    },
                    child: SizedBox(
                      width: PayMeSizes.displayWidth(context),
                      height: PayMeSizes.figmaRatioHeight(context, 48),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: PayMeSizes.figmaRatioHeight(context, 24),
                            child: FittedBox(
                              child: Text(
                                "Split Bills",
                                style: PayMeTextStyles.defaultPrimaryStyle
                                    .copyWith(
                                  color: PayMeColors.text(context),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ZoomTapAnimation(
                    onTap: () {
                      PayMeNavigation.to(const ComingSoonView());

                      HapticFeedback.lightImpact();
                    },
                    child: SizedBox(
                      width: PayMeSizes.displayWidth(context),
                      height: PayMeSizes.figmaRatioHeight(context, 48),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: PayMeSizes.figmaRatioHeight(context, 24),
                            child: FittedBox(
                              child: Text(
                                "PayME Circle",
                                style: PayMeTextStyles.defaultPrimaryStyle
                                    .copyWith(
                                  color: PayMeColors.text(context),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ZoomTapAnimation(
                    onTap: () {
                      // PayMeNavigation.fadeToReplacement(const HomeView());

                      HapticFeedback.lightImpact();
                    },
                    child: SizedBox(
                      width: PayMeSizes.displayWidth(context),
                      height: PayMeSizes.figmaRatioHeight(context, 48),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: PayMeSizes.figmaRatioHeight(context, 24),
                            child: FittedBox(
                              child: Text(
                                "Log Out",
                                style: PayMeTextStyles.defaultPrimaryStyle
                                    .copyWith(
                                  color: PayMeColors.text(context),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ZoomTapAnimation(
                    onTap: () {
                      // PayMeNavigation.fadeToReplacement(const HomeView());
                      HapticFeedback.lightImpact();
                    },
                    child: SizedBox(
                      width: PayMeSizes.displayWidth(context),
                      height: PayMeSizes.figmaRatioHeight(context, 48),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: PayMeSizes.figmaRatioHeight(context, 24),
                            child: FittedBox(
                              child: Text(
                                "Need Help ?",
                                style: PayMeTextStyles.defaultPrimaryStyle
                                    .copyWith(
                                  color: PayMeColors.text(context),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
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

class ProfileQrSheetWidget extends StatefulWidget {
  const ProfileQrSheetWidget({
    super.key,
  });

  @override
  State<ProfileQrSheetWidget> createState() => _ProfileQrSheetWidgetState();
}

class _ProfileQrSheetWidgetState extends State<ProfileQrSheetWidget> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: PayMeSizes.figmaRatioHeight(context, 412),
      width: PayMeSizes.displayWidth(context),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: PayMeColors.white,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Screenshot(
            controller: screenshotController,
            child: Container(
              decoration: BoxDecoration(
                color: PayMeColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 24.0, vertical: 18),
                  //   child: SizedBox(
                  //     width: PayMeSizes.displayWidth(context),
                  //     child: QrImageView(
                  //       data: "payme://919116809509/Random%20Name",
                  //       // "payme://${authController.userData.value!.phone}/${authController.userData.value!.name.replaceAll(" ", "%20")}",
                  //       // version: ,
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 18),
                    child: SizedBox(
                        width: PayMeSizes.displayWidth(context),
                        child: PrettyQrView.data(
                          errorCorrectLevel: QrErrorCorrectLevel.H,
                          data: "payme://9167567586/Avital%20Yadav",
                          decoration: const PrettyQrDecoration(
                            image: PrettyQrDecorationImage(
                              image: AssetImage('assets/images/ic_payme.png'),
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    width: PayMeSizes.displayWidth(context) * 0.72,
                    child: Row(
                      children: [
                        SizedBox(
                          width: PayMeSizes.figmaRatioWidth(context, 62),
                          height: PayMeSizes.figmaRatioWidth(context, 62),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              width: PayMeSizes.figmaRatioWidth(context, 126),
                              height: PayMeSizes.figmaRatioWidth(context, 126),
                              decoration: BoxDecoration(
                                color: PayMeColors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Image.asset(
                                "assets/images/3DProfile/1.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Aviral Yadav",
                              style:
                                  PayMeTextStyles.defaultPrimaryStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: PayMeColors.black,
                                fontSize:
                                    PayMeSizes.figmaRatioWidth(context, 28),
                              ),
                            ),
                            Text(
                              "919116809509",
                              style:
                                  PayMeTextStyles.defaultPrimaryStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                color: PayMeColors.black,
                                fontSize:
                                    PayMeSizes.figmaRatioWidth(context, 24),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: PayMeSizes.figmaRatioHeight(context, 18),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: PayMeSizes.displayWidth(context) * 0.72,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZoomTapAnimation(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    PayMeNavigation.fadeBack();
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.arrow_back_rounded,
                        size: PayMeSizes.figmaRatioWidth(context, 32),
                        color: PayMeColors.black,
                      ),
                      SizedBox(
                        height: PayMeSizes.figmaRatioHeight(context, 8),
                      ),
                      Text(
                        "Go Back",
                        style: PayMeTextStyles.defaultPrimaryStyle.copyWith(
                          fontWeight: FontWeight.w700,
                          color: PayMeColors.black,
                          fontSize: PayMeSizes.figmaRatioWidth(context, 12),
                        ),
                      ),
                    ],
                  ),
                ),
                ZoomTapAnimation(
                  onTap: () {
                    screenshotController.capture().then((value) {
                      Share.shareXFiles(
                        [XFile.fromData(value!, mimeType: 'text/plain')],
                        fileNameOverrides: ['image.png'],
                        text: "PayMe QR Code",
                        subject: "PayMe QR Code",
                      );
                    });
                    HapticFeedback.lightImpact();
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.share,
                        size: PayMeSizes.figmaRatioWidth(context, 32),
                        color: PayMeColors.black,
                      ),
                      SizedBox(
                        height: PayMeSizes.figmaRatioHeight(context, 8),
                      ),
                      Text(
                        "Share QR",
                        style: PayMeTextStyles.defaultPrimaryStyle.copyWith(
                          fontWeight: FontWeight.w700,
                          color: PayMeColors.black,
                          fontSize: PayMeSizes.figmaRatioWidth(context, 12),
                        ),
                      ),
                    ],
                  ),
                ),
                ZoomTapAnimation(
                  onTap: () {
                    HapticFeedback.lightImpact();
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.qr_code_scanner_outlined,
                        size: PayMeSizes.figmaRatioWidth(context, 32),
                        color: PayMeColors.black,
                      ),
                      SizedBox(
                        height: PayMeSizes.figmaRatioHeight(context, 8),
                      ),
                      Text(
                        "Scan QR",
                        style: PayMeTextStyles.defaultPrimaryStyle.copyWith(
                          fontWeight: FontWeight.w700,
                          color: PayMeColors.black,
                          fontSize: PayMeSizes.figmaRatioWidth(context, 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: PayMeSizes.figmaRatioHeight(context, 24),
          ),
        ],
      ),
    );
  }
}
