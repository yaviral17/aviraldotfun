import 'package:aviraldotfun/screen/payme/models/transaction_model.dart';
import 'package:aviraldotfun/screen/payme/utils/appbar/appbar.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/view/home/widget/request_payment_tiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllFundsRequestsView extends StatefulWidget {
  const AllFundsRequestsView({super.key});

  @override
  State<AllFundsRequestsView> createState() => _AllFundsRequestsViewState();
}

class _AllFundsRequestsViewState extends State<AllFundsRequestsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PayMeAppBar(
      //   showBackArrow: true,
      //   title: Text(
      //     "All Funds Requests",
      //     style: PayMeTextStyles.defaultPrimaryStyle.copyWith(
      //       fontSize: PayMeSizes.figmaRatioWidth(context, 20),
      //       // fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: RequestPaymentTiles(
                transactionRequestData: TransactionModel(
                  trnxId: "123",
                  amount: "100",
                  date: DateTime.now(),
                  fromAccount: "123",
                  rname: "Aviral",
                  isLocked: false,
                  sname: "Aviral",
                  toAccount: "123",
                ),
                onCanceled: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
