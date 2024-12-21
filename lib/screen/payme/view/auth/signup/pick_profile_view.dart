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
import 'package:aviraldotfun/screen/payme/view/auth/signup/profile_created_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class PickProfileView extends StatefulWidget {
  const PickProfileView({super.key});

  @override
  State<PickProfileView> createState() => _PickProfileViewState();
}

class _PickProfileViewState extends State<PickProfileView> {
  UniqueKey key = UniqueKey();
  bool continuePressed = false;
  bool showSelectedPfpAnimation = false;

  late File currentProfile;

  // File? selectedProfile;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if true, disable continue button
    return Scaffold(
      // appBar: PayMeAppBar(
      //   leadingIcon: Icons.arrow_back,
      //   leadingOnPressed: () {
      //     Navigator.pop(context);
      //   },
      // ),
      body: Stack(
        children: [
          Visibility(
            visible: false,
            child: Positioned(
              top: PayMeSizes.figmaRatioHeight(context, 80) * -1,
              child: Lottie.asset(
                "assets/animations/Scene 13.json",
                fit: BoxFit.fitWidth,
                repeat: showSelectedPfpAnimation,
                onLoaded: (p0) {},
                width: PayMeSizes.displayWidth(context),
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: Positioned(
              top: PayMeSizes.figmaRatioHeight(context, 80) * -1,
              child: Lottie.asset(
                key: key,
                false
                    ? "assets/animations/Scene 13.json"
                    : "assets/animations/Scene 12.json",
                fit: BoxFit.fitWidth,
                repeat: showSelectedPfpAnimation,
                onLoaded: (p0) {
                  if (false) {
                    setState(() {
                      showSelectedPfpAnimation = true;
                      showSelectedPfpAnimation = false;
                    });
                  }
                },
                width: PayMeSizes.displayWidth(context),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: PayMeSizes.figmaRatioHeight(context, 20),
              ),
              Center(
                child: SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 100),
                  width: PayMeSizes.figmaRatioWidth(context, 250),
                  child: FittedBox(
                    child: Text(
                      false
                          ? "great pic, wanna\n continue ?"
                          : "time to pick a\nprofile pic",
                      textAlign: TextAlign.center,
                      style: PayMeTextStyles.signUpOnboardingText,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              ZoomTapAnimation(
                onTap: () {
                  HapticFeedback.lightImpact();
                  Get.bottomSheet(
                    const ProfilePictureSelectionDialog(),
                    backgroundColor: PayMeColors.transparent,
                    isScrollControlled: true,
                    enableDrag: false,
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/images/3DProfile/1.png",
                    width: PayMeSizes.figmaRatioWidth(context, 180),
                    height: PayMeSizes.figmaRatioWidth(context, 180),
                  ),
                ),
              ),
              SizedBox(
                height: PayMeSizes.figmaRatioHeight(context, 92),
              ),
              const Spacer(),
              // continue button
              PayMePrimaryButton(
                isDisabled: false,
                onPressed: () async {
                  // prevent button spam
                  if (continuePressed) return;
                  continuePressed = true;

                  // bool result = await authController.setProfilePicture(
                  //     authController.newProfilePic.value!);

                  // if (result) {
                  PayMeNavigation.to(const ProfileCreatedView());
                  // }
                  continuePressed = false;
                  // PayMeNavigation.to(const ProfileCreatedView());
                  // Get.to(() => const PinCreatedView());
                },
                labelText: PayMeTexts.continue_,
              ),

              SizedBox(
                height: PayMeSizes.figmaRatioHeight(context, 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfilePictureSelectionDialog extends StatefulWidget {
  const ProfilePictureSelectionDialog({super.key});

  @override
  State<ProfilePictureSelectionDialog> createState() =>
      _ProfilePictureSelectionDialogState();
}

class _ProfilePictureSelectionDialogState
    extends State<ProfilePictureSelectionDialog> {
  File? profilePic;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 20),
      decoration: const BoxDecoration(
        color: PayMeColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(26),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: PayMeSizes.figmaRatioHeight(context, 450),
            width: PayMeSizes.figmaRatioWidth(context, 360),
            margin: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: PayMeColors.white,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: PayMeColors.black,
                width: 2,
              ),
            ),
            child: GridView.builder(
              itemCount: 30,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return ZoomTapAnimation(
                  onTap: () async {
                    final file = await PayMeHelperFunctions.assetToFile(
                        "assets/images/3DProfile/${index + 1}.png");
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset(
                      "assets/images/3DProfile/${index + 1}.png",
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ZoomTapAnimation(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 78),
                  width: PayMeSizes.figmaRatioWidth(context, 60),
                  child: Image.asset(
                    PayMeImages.pfpDialogGoBack,
                  ),
                ),
              ),
              ZoomTapAnimation(
                onTap: () {
                  PayMeHelperFunctions.pickImageWithCrop(context, false).then(
                    (value) {
                      if (value != null) {
                        Navigator.pop(context);
                      }
                    },
                  );
                },
                child: SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 78),
                  width: PayMeSizes.figmaRatioWidth(context, 60),
                  child: Image.asset(
                    PayMeImages.pfpDialogGallery,
                  ),
                ),
              ),
              ZoomTapAnimation(
                onTap: () {
                  PayMeHelperFunctions.pickImageWithCrop(context, true).then(
                    (value) {
                      if (value != null) {
                        Navigator.pop(context);
                      }
                    },
                  );
                },
                child: SizedBox(
                  height: PayMeSizes.figmaRatioHeight(context, 78),
                  width: PayMeSizes.figmaRatioWidth(context, 60),
                  child: Image.asset(
                    PayMeImages.pfpDialogCamera,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
