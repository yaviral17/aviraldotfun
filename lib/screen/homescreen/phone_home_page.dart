import 'dart:io';
import 'dart:typed_data';

import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_viewer/markdown_viewer.dart';
import 'package:provider/provider.dart';

import '../../consts/data.dart';
import '../../providers/current_state.dart';

class PhoneHomeScreen extends StatelessWidget {
  const PhoneHomeScreen({super.key});

  File unit8ListToFile(Uint8List data) {
    File file = File("assets/images/yaviral17.svg");
    file.writeAsBytes(data);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);
    return Container(
      padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
      child: Column(
        children: [
          // github contribution graph from <img src="http://ghchart.rshah.org/2016rshah" alt="2016rshah's Github chart" />
          const SizedBox(
            height: 20,
          ),
          currentState.imageBytes != null
              ? SvgPicture.memory(
                  currentState.imageBytes!,
                  width: 300,
                  height: 300,
                )
              : SvgPicture.asset(
                  "assets/images/yaviral17.svg",
                  width: 300,
                  height: 300,
                ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.start,
            children: List.generate(
                apps.length,
                (index) => Container(
                      margin: const EdgeInsets.only(
                          right: 10, top: 10, bottom: 20, left: 10),
                      // width: 70,
                      child: Column(
                        children: [
                          CustomButton(
                            margin: const EdgeInsets.only(bottom: 5),
                            borderRadius: currentState.currentDevice ==
                                    Devices.ios.iPhone13
                                ? 8
                                : 100,
                            onPressed: () {
                              if (apps[index].link != null) {
                                // open the url in the webpage
                                currentState.launchInBrowser(
                                  apps[index].link!,
                                );
                              } else if (apps[index].screen != null) {
                                currentState.changePhoneScreen(
                                    apps[index].screen!, false,
                                    titlee: apps[index].title);
                              }
                            },
                            width: 45,
                            height: 45,
                            asset: apps[index].assetPath != null
                                ? ButtonAsset(apps[index].assetPath!,
                                    width: 25, height: 25)
                                : null,
                            backgroundColor: apps[index].color,
                            child: apps[index].assetPath == null
                                ? Center(
                                    child: Icon(
                                      apps[index].icon,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                  )
                                : null,
                          ),
                          SizedBox(
                            width: 60,
                            child: Center(
                              child: Text(
                                apps[index].title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: GoogleFonts.openSans(
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
