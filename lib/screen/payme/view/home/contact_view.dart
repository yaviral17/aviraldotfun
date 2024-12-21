import 'dart:developer';
import 'dart:io';

import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/navigation.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:aviraldotfun/screen/payme/view/home/chat_view.dart';
import 'package:aviraldotfun/screen/payme/view/home/home_view.dart';
import 'package:aviraldotfun/screen/payme/view/home/transfer/transaction_amount_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:permission_handler/permission_handler.dart';

class ContactView extends StatefulWidget {
  final String routeName;
  const ContactView({
    super.key,
    required this.routeName,
  });

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: PayMeColors.text(context),
      //     ),
      //     onPressed: () {
      //       PayMeNavigation.fadeBack();
      //     },
      //   ),
      //   title: Text(
      //     widget.routeName,
      //     style: PayMeTextStyles.homeScreenTextStyle.copyWith(
      //       color: PayMeColors.text(context),
      //       fontSize: PayMeSizes.figmaRatioWidth(context, 28),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
            //   child: Text(
            //     widget.routeName,
            //     style: PayMeTextStyles.homeScreenTextStyle.copyWith(
            //       color: PayMeColors.white,
            //       fontSize: PayMeSizes.figmaRatioWidth(context, 28),
            //     ),
            //   ),
            // ),
            SizedBox(height: PayMeSizes.figmaRatioHeight(context, 20)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomTextField(
                controller: _controller,
                onChanged: (val) {},
                hintText: "Search By Name, Number or UPI",
                hintStyle: PayMeTextStyles.defaultPrimaryStyle.copyWith(
                  color: PayMeColors.text(context),
                  fontSize: PayMeSizes.figmaRatioWidth(context, 16),
                ),
              ),
            ),
            SizedBox(height: PayMeSizes.figmaRatioHeight(context, 24)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: GestureDetector(
                onTap: () async {
                  // await _fetchContacts();
                },
                child: Text(
                  "Contacts List",
                  style: PayMeTextStyles.defaultPrimaryStyle.copyWith(
                    color: PayMeColors.text(context),
                    fontSize: PayMeSizes.figmaRatioWidth(context, 24),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: PayMeSizes.figmaRatioHeight(context, 20)),
            ...List.generate(
              10,
              (index) {
                String name = "${'abcdefghijklmnopqrstuvwxyz'[index]} $index";
                String number = "28723$index";
                return ContactTileWidget(
                  name: name,
                  number: number,
                  imageUrl: null,
                  isStarred: index.isEven,
                  routeName: widget.routeName,
                );
              },
            ),
            // Expanded(
            //   child: ListView.builder(
            //     physics: const BouncingScrollPhysics(),
            //     itemCount: 10,
            //     itemBuilder: (context, index) {
            //       // //log("Name: ${contacts[index].displayName.toString()} number: ${contacts[index].phones.toString()}",
            //       //     name: "${index + 1}");
            //       // //log("Name: ${contacts[index].displayName.toString()} number: ${contacts[index].phones.toString()}",
            //       //     name: "${index + 1}");
            //       String name = "${'abcdefghijklmnopqrstuvwxyz'[index]} $index";
            //       String number = "28723$index";
            //       // get image from Unit8List as File

            //       return ContactTileWidget(
            //         name: name,
            //         number: number,
            //         imageUrl: null,
            //         isStarred: index.isEven,
            //         routeName: widget.routeName,
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class ContactTileWidget extends StatefulWidget {
  final String name;
  final String number;
  final File? imageUrl;
  final bool isStarred;
  final String routeName;

  const ContactTileWidget({
    super.key,
    required this.name,
    required this.number,
    required this.imageUrl,
    required this.isStarred,
    required this.routeName,
  });

  @override
  State<ContactTileWidget> createState() => _ContactTileWidgetState();
}

class _ContactTileWidgetState extends State<ContactTileWidget> {
  late bool isStarred;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isStarred = widget.isStarred;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (widget.routeName == "Contacts") {
          PayMeNavigation.to(ChatView(
            name: widget.name,
            phone: widget.number,
          ));
          return;
        }

        PayMeNavigation.to(TransactionAmountView(
          routName: widget.routeName,
          contactName: widget.name,
          contactNumber: widget.number,
          contactImage: widget.imageUrl,
        ));
      },
      leading: CircleAvatar(
        radius: PayMeSizes.figmaRatioWidth(context, 22),
        // ignore: unnecessary_null_comparison
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: widget.imageUrl != null
              ? Image.file(
                  widget.imageUrl!,
                  fit: BoxFit.cover,
                )
              : Center(
                  child: Text(
                    (widget.name.isNotEmpty)
                        ? widget.name[0].toUpperCase()
                        : widget.name,
                    style: PayMeTextStyles.defaultPrimaryStyle.copyWith(
                      color: PayMeColors.black,
                      fontSize: PayMeSizes.figmaRatioWidth(context, 18),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
        ),
      ),
      title: Text(
        widget.name,
        style: PayMeTextStyles.defaultPrimaryStyle.copyWith(
          color: PayMeColors.text(context),
          fontSize: PayMeSizes.figmaRatioWidth(context, 18),
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        widget.number,
        style: PayMeTextStyles.defaultPrimaryStyle.copyWith(
          color: PayMeColors.text(context),
          fontSize: PayMeSizes.figmaRatioWidth(context, 12),
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: IconButton(
        icon: Icon(
          isStarred ? Icons.star : Icons.star_border,
          color: PayMeColors.text(context),
        ),
        onPressed: () {
          setState(() {
            isStarred = !isStarred;
          });
        },
      ),
    );
  }
}
