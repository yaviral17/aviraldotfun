import 'package:aviraldotfun/screen/payme/utils/appbar/appbar.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:flutter/material.dart';

class ManageCardsView extends StatefulWidget {
  const ManageCardsView({super.key});

  @override
  State<ManageCardsView> createState() => _ManageCardsViewState();
}

class _ManageCardsViewState extends State<ManageCardsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PayMeAppBar(
      //   showBackArrow: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            SizedBox(
              height: PayMeSizes.figmaRatioHeight(context, 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Manage your Cards",
                style: PayMeTextStyles.homeScreenTextStyle.copyWith(
                  fontSize: PayMeSizes.figmaRatioWidth(context, 24),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
