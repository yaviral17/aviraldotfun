import 'package:aviraldotfun/screen/payme/utils/appbar/appbar.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_strings.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/utils/widgets/payme_primary_button_widget.dart';
import 'package:aviraldotfun/screen/payme/view/home/profile/add_funds/add_funds_request_sent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddFundsView extends StatefulWidget {
  const AddFundsView({super.key});

  @override
  State<AddFundsView> createState() => _AddFundsViewState();
}

class _AddFundsViewState extends State<AddFundsView> {
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, //

      // appBar: PayMeAppBar(
      //   showBackArrow: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: PayMeSizes.figmaRatioHeight(context, 72),
              ),
              Text(
                "Current Funds",
                style: PayMeTextStyles.defaultPrimaryStyle.copyWith(
                  fontSize: PayMeSizes.figmaRatioWidth(context, 24),
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                "TKN 1000",
                style: PayMeTextStyles.defaultPrimaryStyle.copyWith(
                  fontSize: PayMeSizes.figmaRatioWidth(context, 32),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                ),
              ),
              SizedBox(
                height: PayMeSizes.figmaRatioHeight(context, 20),
              ),
              Text(
                "Add Funds",
                style: PayMeTextStyles.defaultPrimaryStyle.copyWith(
                  fontSize: PayMeSizes.figmaRatioWidth(context, 24),
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(
                height: PayMeSizes.figmaRatioHeight(context, 8),
              ),
              Center(
                child: Container(
                  width: PayMeSizes.displayWidth(context),
                  height: PayMeSizes.figmaRatioHeight(context, 72),
                  decoration: BoxDecoration(
                    color: PayMeColors.transparent,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: PayMeColors.white,
                      width: 4,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 6,
                        child: TextField(
                          controller: amountController,
                          textAlign: TextAlign.right,
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
                              color: PayMeColors.white,
                              fontSize: PayMeSizes.figmaRatioWidth(context, 28),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onChanged: (value) {},
                          style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                            color: PayMeColors.white,
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
                            color: PayMeColors.white,
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
                height: PayMeSizes.figmaRatioHeight(context, 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: PayMeSizes.figmaRatioWidth(context, 4),
                  ),
                  Expanded(
                    child: Container(
                      width: PayMeSizes.figmaRatioWidth(context, 80),
                      height: PayMeSizes.figmaRatioHeight(context, 36),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(214, 147, 147, 147),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "100 TKN",
                          style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                            color: PayMeColors.white,
                            fontSize: PayMeSizes.figmaRatioWidth(context, 16),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: PayMeSizes.figmaRatioWidth(context, 12),
                  ),
                  Expanded(
                    child: Container(
                      width: PayMeSizes.figmaRatioWidth(context, 80),
                      height: PayMeSizes.figmaRatioHeight(context, 36),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(214, 147, 147, 147),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "500 TKN",
                          style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                            color: PayMeColors.white,
                            fontSize: PayMeSizes.figmaRatioWidth(context, 16),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: PayMeSizes.figmaRatioWidth(context, 12),
                  ),
                  Expanded(
                    child: Container(
                      width: PayMeSizes.figmaRatioWidth(context, 80),
                      height: PayMeSizes.figmaRatioHeight(context, 36),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(214, 147, 147, 147),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "1000 TKN",
                          style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                            color: PayMeColors.white,
                            fontSize: PayMeSizes.figmaRatioWidth(context, 16),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: PayMeSizes.figmaRatioWidth(context, 4),
                  ),
                ],
              ),
              SizedBox(
                height: PayMeSizes.figmaRatioHeight(context, 12),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: PayMeSizes.figmaRatioHeight(context, 300),
                          width: PayMeSizes.displayWidth(context),
                          // padding: const EdgeInsets.all(18),
                          margin: const EdgeInsets.only(top: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            // border: Border.all(
                            //   color: PayMeColors.white,
                            //   width: 4,
                            // ),
                          ),
                          child: Image.asset(
                            "assets/images/add_token_account_info_card_bg.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: PayMeSizes.figmaRatioHeight(context, 300),
                          width: PayMeSizes.displayWidth(context),
                          padding: const EdgeInsets.all(18),
                          margin: const EdgeInsets.only(top: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            border: Border.all(
                              color: PayMeColors.white,
                              width: 4,
                            ),
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Acc No.",
                                  style: PayMeTextStyles.defaultPrimaryStyle
                                      .copyWith(
                                    fontSize:
                                        PayMeSizes.figmaRatioWidth(context, 16),
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "918077963037",
                                      style: PayMeTextStyles.defaultPrimaryStyle
                                          .copyWith(
                                        fontSize: PayMeSizes.figmaRatioWidth(
                                            context, 24),
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Iconsax.copy),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      PayMeSizes.figmaRatioHeight(context, 32),
                                ),
                                Text(
                                  "Aviral Yadav",
                                  style: PayMeTextStyles.defaultPrimaryStyle
                                      .copyWith(
                                    fontSize:
                                        PayMeSizes.figmaRatioWidth(context, 18),
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Acc Name",
                                      style: PayMeTextStyles.defaultPrimaryStyle
                                          .copyWith(
                                        fontSize: PayMeSizes.figmaRatioWidth(
                                            context, 16),
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Iconsax.copy),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      PayMeSizes.figmaRatioHeight(context, 16),
                                ),
                                Text(
                                  "ISKL1938",
                                  style: PayMeTextStyles.defaultPrimaryStyle
                                      .copyWith(
                                    fontSize:
                                        PayMeSizes.figmaRatioWidth(context, 18),
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "IFSC Code",
                                      style: PayMeTextStyles.defaultPrimaryStyle
                                          .copyWith(
                                        fontSize: PayMeSizes.figmaRatioWidth(
                                            context, 16),
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Iconsax.copy),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      PayMeSizes.figmaRatioHeight(context, 24),
                                ),
                                Text(
                                  "IS4920",
                                  style: PayMeTextStyles.defaultPrimaryStyle
                                      .copyWith(
                                    fontSize:
                                        PayMeSizes.figmaRatioWidth(context, 18),
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Remark",
                                      style: PayMeTextStyles.defaultPrimaryStyle
                                          .copyWith(
                                        fontSize: PayMeSizes.figmaRatioWidth(
                                            context, 16),
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Iconsax.copy),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: PayMeSizes.figmaRatioHeight(context, 63),
              ),
              Row(
                children: [
                  Expanded(
                      child: PayMePrimaryButton(
                    isDisabled: amountController.text.isEmpty,
                    labelText: PayMeTexts.continue_,
                    onPressed: () {
                      PayMeNavigation.to(AddFundsRequestSent());
                    },
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
