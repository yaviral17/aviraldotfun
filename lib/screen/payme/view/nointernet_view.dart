import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.wifi_off,
                size: 100,
              ),
              Text(
                "No Internet Connection",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
