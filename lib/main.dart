import 'package:aviraldotfun/NewDesign/screens/newdesign/screens/home/home_page_view.dart';
import 'package:aviraldotfun/providers/current_state.dart';
import 'package:aviraldotfun/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => CurrentState()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // debugShowMaterialGrid: false,
        home: HomePageView(),
      ),
    );
  }
}
