// import 'package:flutter/material.dart';
// import 'package:payme/utils/appbar/appbar.dart';
// import 'package:payme/utils/constants/colors.dart';
// import 'package:payme/utils/constants/sizes.dart';
// import 'package:payme/utils/constants/text_styles.dart';
// import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// class LockedBalanceView extends StatefulWidget {
//   const LockedBalanceView({super.key});

//   @override
//   State<LockedBalanceView> createState() => _LockedBalanceViewState();
// }

// class _LockedBalanceViewState extends State<LockedBalanceView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PayMeAppBar(
//         showBackArrow: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Locked Balance",
//               style: PayMeTextStyles.homeScreenTextStyle.copyWith(
//                 fontSize: PayMeSizes.figmaRatioWidth(context, 24),
//               ),
//             ),
//             Text(
//               "QNT 1200",
//               style: PayMeTextStyles.homeScreenTextStyle.copyWith(
//                 fontSize: PayMeSizes.figmaRatioWidth(context, 36),
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(
//               height: PayMeSizes.figmaRatioHeight(context, 20),
//             ),
//             Text(
//               "Balance History",
//               style: PayMeTextStyles.homeScreenTextStyle.copyWith(
//                 fontSize: PayMeSizes.figmaRatioWidth(context, 24),
//               ),
//             ),
//             SizedBox(
//               height: PayMeSizes.figmaRatioHeight(context, 20),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 physics: const BouncingScrollPhysics(),
//                 itemCount: 4,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: LockedBalanceHistoryCardWidget(
//                       name: "Aviral Yadav",
//                       phoneNumber: "+91 80779 63037",
//                       amount: "300 QNT",
//                       transactionId: "TRNX ID: 6456747856",
//                       onTap: () {},
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class LockedBalanceHistoryCardWidget extends StatelessWidget {
//   final String name;
//   final String phoneNumber;
//   final String amount;
//   final String transactionId;
//   final String? image;
//   final void Function() onTap;

//   const LockedBalanceHistoryCardWidget({
//     super.key,
//     required this.name,
//     required this.phoneNumber,
//     required this.amount,
//     required this.transactionId,
//     this.image,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ZoomTapAnimation(
//       onTap: onTap,
//       begin: 1.0,
//       end: 0.98,
//       child: Container(
//         height: PayMeSizes.figmaRatioHeight(context, 150),
//         width: PayMeSizes.displayWidth(context),
//         // width: PayMeSizes.displayWidth(context),
//         padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
//         decoration: BoxDecoration(
//           color: PayMeColors.lockedBalanceScreenCardWidget,
//           borderRadius: BorderRadius.circular(26),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: PayMeSizes.figmaRatioHeight(context, 54),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       CircleAvatar(
//                         radius: PayMeSizes.figmaRatioWidth(context, 20),
//                         backgroundColor: PayMeColors.white,
//                         child: Text(
//                           "A",
//                           style: PayMeTextStyles.homeScreenTextStyle.copyWith(
//                             color: PayMeColors.dark,
//                             fontSize: PayMeSizes.figmaRatioWidth(context, 16),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: PayMeSizes.figmaRatioWidth(context, 10),
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Aviral Yadav",
//                             style: PayMeTextStyles.homeScreenTextStyle.copyWith(
//                               color: PayMeColors.dark,
//                               letterSpacing: 1.1,
//                               fontSize: PayMeSizes.figmaRatioWidth(context, 18),
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           Text(
//                             "+91 80779 63037",
//                             style: PayMeTextStyles.homeScreenTextStyle.copyWith(
//                               color: PayMeColors.dark,
//                               height: 0,
//                               letterSpacing: 1.1,
//                               fontSize: PayMeSizes.figmaRatioWidth(context, 12),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 9,
//                   child: FittedBox(
//                     child: Text(
//                       "500 QNT",
//                       style: PayMeTextStyles.homeScreenTextStyle.copyWith(
//                         color: PayMeColors.dark,
//                         fontSize: PayMeSizes.figmaRatioWidth(context, 18),
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 3,
//                   child: FittedBox(
//                     child: Text(
//                       "TRNX ID: 6456747856",
//                       style: PayMeTextStyles.homeScreenTextStyle.copyWith(
//                         color: PayMeColors.dark,
//                         fontSize: PayMeSizes.figmaRatioWidth(context, 12),
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: PayMeSizes.figmaRatioHeight(context, 12),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Icon(
//                   Icons.arrow_forward,
//                   color: PayMeColors.dark,
//                   size: PayMeSizes.figmaRatioWidth(context, 80),
//                 ),
//                 FittedBox(
//                   child: Text(
//                     "slide to\nunlock",
//                     style: PayMeTextStyles.homeScreenTextStyle.copyWith(
//                       color: PayMeColors.dark,
//                       fontSize: PayMeSizes.figmaRatioWidth(context, 16),
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: PayMeSizes.figmaRatioHeight(context, 12),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
