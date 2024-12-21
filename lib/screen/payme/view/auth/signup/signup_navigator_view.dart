import 'package:aviraldotfun/screen/payme/view/auth/signup/intro_view.dart';
import 'package:aviraldotfun/screen/payme/view/auth/signup/name_view.dart';
import 'package:aviraldotfun/screen/payme/view/auth/signup/otp_view.dart';
import 'package:aviraldotfun/screen/payme/view/auth/signup/phone_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpNavigatorView extends StatelessWidget {
  SignUpNavigatorView({super.key});

  final pages = const [
    IntroView(),
    NameView(),
    PhoneView(),
    OTPView(),
  ];

  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PayMeAppBar(
      //   leadingIcon: Icons.arrow_back,
      //   leadingOnPressed: () {
      //     if (authController.currentPage.value == 0) {
      //       Get.back();
      //     } else {
      //       authController.signUpPages.previousPage(
      //         duration: const Duration(milliseconds: 300),
      //         curve: Curves.easeIn,
      //       );
      //     }
      //   },
      // ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemCount: pages.length,
        onPageChanged: (value) {},
        itemBuilder: (context, index) => pages[index],
      ),
    );
  }
}
