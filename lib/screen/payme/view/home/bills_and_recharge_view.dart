import 'package:aviraldotfun/screen/payme/models/bill_section_item_model.dart';
import 'package:aviraldotfun/screen/payme/utils/appbar/appbar.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:flutter/material.dart';

class BillsAndRechargeView extends StatefulWidget {
  final List<BillSectionItemModel> billSectionItems;
  const BillsAndRechargeView({
    super.key,
    required this.billSectionItems,
  });

  @override
  State<BillsAndRechargeView> createState() => _BillsAndRechargeViewState();
}

class _BillsAndRechargeViewState extends State<BillsAndRechargeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const PayMeAppBar(
      //   showBackArrow: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: PayMeSizes.figmaRatioHeight(context, 16),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  "Bills and Recharge",
                  style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                    fontSize: PayMeSizes.figmaRatioWidth(context, 24),
                  ),
                ),
              ),
              SizedBox(
                height: PayMeSizes.figmaRatioHeight(context, 40),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (PayMeSizes.displayWidth(context) ~/ 120),
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 20,
                ),
                itemCount: widget.billSectionItems.length,
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: PayMeSizes.figmaRatioWidth(context, 40),
                          backgroundColor: widget.billSectionItems[index].color,
                          child: Image.asset(
                            widget.billSectionItems[index].iconImage,
                            width: PayMeSizes.figmaRatioWidth(context, 24),
                            height: PayMeSizes.figmaRatioWidth(context, 24),
                          ),
                        ),
                        Text(
                          widget.billSectionItems[index].title,
                          textAlign: TextAlign.center,
                          style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                            fontSize: PayMeSizes.figmaRatioWidth(context, 14),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
