import 'dart:async';
import 'dart:io';

import 'package:aviraldotfun/models/app_model.dart';
import 'package:aviraldotfun/screen/miniProjects/about/about.dart';
import 'package:aviraldotfun/screen/miniProjects/education/education.dart';
import 'package:aviraldotfun/screen/miniProjects/experience/experience.dart';
import 'package:aviraldotfun/screen/miniProjects/skills/skills.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/theme/theme.dart';
import 'package:aviraldotfun/screen/payme/view/auth/auth_view.dart';
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:iconsax/iconsax.dart' as iconsax;
import 'package:intl/intl.dart';
import 'package:markdown_viewer/markdown_viewer.dart';
import 'package:provider/provider.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../consts/data.dart';
import '../../providers/current_state.dart';

class PhoneHomeScreen extends StatefulWidget {
  const PhoneHomeScreen({super.key});

  @override
  State<PhoneHomeScreen> createState() => _PhoneHomeScreenState();
}

class _PhoneHomeScreenState extends State<PhoneHomeScreen> {
  File unit8ListToFile(Uint8List data) {
    File file = File("assets/images/yaviral17.svg");
    file.writeAsBytes(data);
    return file;
  }

  DateTime currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);

    List<AppModel> apps = [
      AppModel(
        title: "About",
        backgroundColor: Colors.pinkAccent.shade700,
        iconColor: Colors.white,
        icon: iconsax.Iconsax.user,
        screen: const AboutMe(),
      ),
      AppModel(
        title: "Resume",
        backgroundColor: Colors.blue.shade800,
        iconColor: Colors.white,
        icon: AntDesign.file_pdf_outline,
        link: resumeLink,
      ),
      AppModel(
          title: "Skills",
          backgroundColor: Colors.white24,
          iconColor: Colors.white,
          icon: AntDesign.code_outline,
          screen: const Skills()),
      // AppModel(
      //   title: "Youtube",
      //   assetPath: "assets/icons/youtube.png",
      //   color: Colors.white,
      //   link: youtubeChannel,
      // ),
      AppModel(
        title: "LinkedIn",
        icon: AntDesign.linkedin_fill,
        backgroundColor: Colors.blue.shade900,
        iconColor: Colors.white,
        link: linkedIn,
      ),
      AppModel(
        title: "X",
        assetPath: "assets/icons/x.png",
        // icon: AntDesign.twitter_outline,
        backgroundColor: Colors.white,
        iconColor: Colors.blue,
        link: twitter,
      ),
      AppModel(
        title: "Topmate",
        assetPath: "assets/icons/topMate.png",
        backgroundColor: Colors.white,
        iconColor: Colors.white,
        link: topMate,
      ),
      AppModel(
          title: "Experience",
          backgroundColor: Colors.deepPurple,
          icon: CupertinoIcons.chart_bar,
          iconColor: Colors.white,
          screen: const Experience()),
      AppModel(
        title: "Education",
        backgroundColor: Colors.deepOrange,
        iconColor: Colors.white,
        icon: CupertinoIcons.book_fill,
        screen: const Education(),
      ),
      AppModel(
        title: "Github",
        // assetPath: "assets/icons/github.png",
        icon: AntDesign.github_fill,
        backgroundColor: const Color(0xFF1D1C1C),
        iconColor: Colors.white,
        link: github,
      ),
      AppModel(
        title: "PayME",
        assetPath: "assets/images/logo_icon.png",
        backgroundColor: const Color(0xFF1D1C1C),
        iconColor: Colors.white,
        screen: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: PayMeAppTheme.lightTheme,
          darkTheme: PayMeAppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          navigatorKey: paymeNavigationKey,
          home: const AuthView(),
        ),
      ),
      AppModel(
        title: "Inspire Manak",
        assetPath: "assets/images/inspire_manak.jpg",
        backgroundColor: Colors.white,
        iconColor: Colors.white,
        link: playApps,
      ),
    ];
    return Container(
      child: Column(
        children: [
          Container(
            height: 36,
            padding: const EdgeInsets.only(left: 18, right: 16, top: 12),
            // decoration: BoxDecoration(
            //   color: Colors.black,
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // show the current time and keep updating it
                Text(
                  DateFormat("hh:mm a").format(currentTime),
                  style: GoogleFonts.openSans(
                    fontSize: PayMeSizes.figmaRatioWidth(context, 16),
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Image.asset(
                  "assets/images/ios_nav.png",
                  width: PayMeSizes.figmaRatioWidth(context, 100),
                ),
              ],
            ),
          ),
          // github contribution graph from <img src="http://ghchart.rshah.org/2016rshah" alt="2016rshah's Github chart" />

          // Container(
          //   // height: MediaQuery.of(context).size.height * 0.12,
          //   decoration: BoxDecoration(
          //     color: Colors.black,
          //     borderRadius: BorderRadius.circular(12),
          //   ),

          //   padding:
          //       const EdgeInsets.only(top: 4, left: 4, right: 8, bottom: 8),
          //   child: currentState.imageBytes != null
          //       ? SvgPicture.memory(
          //           currentState.imageBytes!,
          //         )
          //       : SvgPicture.asset(
          //           "assets/images/yaviral17.svg",
          //           fit: BoxFit.fitHeight,
          //           height: 54,
          //         ),
          // ),
          SizedBox(
            height: 18,
          ),
          Wrap(
            children: [
              ...apps.map(
                (e) {
                  return IosIconsWidget(data: e);
                },
              ),
            ],
          )

          // Row(
          //   children: [
          //     SizedBox(
          //       width: 9,
          //     ),
          //     ...List.generate(
          //       2,
          //       (index) => IosIconsWidget(
          //         data: apps[0],
          //       ),
          //     ),
          //   ],
          // ),
          // Row(
          //   children: [
          //     SizedBox(
          //       width: 9,
          //     ),
          //     ...List.generate(
          //       2,
          //       (index) => IosIconsWidget(
          //         data: apps[0],
          //       ),
          //     ),
          //   ],
          // ),

          // Wrap(
          //   crossAxisAlignment: WrapCrossAlignment.center,
          //   alignment: WrapAlignment.start,
          //   children: List.generate(
          //       apps.length,
          //       (index) => Container(
          //             margin: const EdgeInsets.only(
          //                 right: 10, top: 10, bottom: 20, left: 10),
          //             // width: 70,
          //             child: Column(
          //               children: [
          //                 CustomButton(
          //                   margin: const EdgeInsets.only(bottom: 5),
          //                   borderRadius: currentState.currentDevice ==
          //                           Devices.ios.iPhone13
          //                       ? 8
          //                       : 100,
          //                   onPressed: () {
          //                     if (apps[index].link != null) {
          //                       // open the url in the webpage
          //                       currentState.launchInBrowser(
          //                         apps[index].link!,
          //                       );
          //                     } else if (apps[index].screen != null) {
          //                       currentState.changePhoneScreen(
          //                           apps[index].screen!, false,
          //                           titlee: apps[index].title);
          //                     }
          //                   },
          //                   width: 45,
          //                   height: 45,
          //                   asset: apps[index].assetPath != null
          //                       ? ButtonAsset(apps[index].assetPath!,
          //                           width: 25, height: 25)
          //                       : null,
          //                   backgroundColor: apps[index].color,
          //                   child: apps[index].assetPath == null
          //                       ? Center(
          //                           child: Icon(
          //                             apps[index].icon,
          //                             size: 25,
          //                             color: Colors.black,
          //                           ),
          //                         )
          //                       : null,
          //                 ),
          //                 SizedBox(
          //                   width: 60,
          //                   child: Center(
          //                     child: Text(
          //                       apps[index].title,
          //                       overflow: TextOverflow.ellipsis,
          //                       maxLines: 1,
          //                       style: GoogleFonts.openSans(
          //                           fontSize: 11,
          //                           color: Colors.white,
          //                           fontWeight: FontWeight.w400),
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           )),
          // ),
        ],
      ),
    );
  }
}

class IosIconsWidget extends StatelessWidget {
  final AppModel data;
  const IosIconsWidget({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(left: 9, right: 9, bottom: 9),
      child: ZoomTapAnimation(
        onTap: () {
          if (data.link != null) {
            // open the url in the webpage
            currentState.launchInBrowser(
              data.link!,
            );
          } else if (data.screen != null) {
            currentState.changePhoneScreen(data.screen!, false,
                titlee: data.title);
          }
        },
        end: 0.96,
        begin: 1.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SmoothClipRRect(
              smoothness: 0.8,
              child: Container(
                width: PayMeSizes.figmaRatioWidth(context, 60),
                height: PayMeSizes.figmaRatioWidth(context, 60),
                decoration: BoxDecoration(
                  color: data.backgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: data.assetPath != null
                    ? Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Image.asset(
                          data.assetPath!,
                          width: PayMeSizes.figmaRatioWidth(context, 30),
                          height: PayMeSizes.figmaRatioWidth(context, 30),
                        ),
                      )
                    : Icon(
                        data.icon,
                        size: PayMeSizes.figmaRatioWidth(context, 30),
                        color: data.iconColor,
                      ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            SizedBox(
              width: PayMeSizes.figmaRatioWidth(context, 60),
              height: PayMeSizes.figmaRatioWidth(context, 14),
              child: FittedBox(
                child: Text(
                  data.title,
                  style: GoogleFonts.openSans(
                      fontSize: PayMeSizes.figmaRatioWidth(context, 12),
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
