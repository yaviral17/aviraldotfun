import 'package:aviraldotfun/consts/data.dart';
import 'package:aviraldotfun/providers/current_state.dart';
import 'package:aviraldotfun/screen/payme/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PayMeNavigation {
  static List<Widget> screenStack = [];

  static void fadeBack() {
    screenStack.removeLast();
    // Provider.of<CurrentState>(Get.context!, listen: false)
    //     .changePhoneScreen(screenStack.last, true);
    if (screenStack.isNotEmpty) {
      paymeNavigationKey.currentState!.pushReplacement(MaterialPageRoute(
        builder: (context) => screenStack.last,
      ));
    } else {
      paymeNavigationKey.currentState!.pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeView(),
      ));
    }
  }

  // material to right
  static void to(Widget child) {
    screenStack.add(child);
    // paymeNavigationKey.currentState!.push(MaterialPageRoute(
    //   builder: (context) => child,
    // ));

    // fade transition
    paymeNavigationKey.currentState!.push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ));
  }
}
