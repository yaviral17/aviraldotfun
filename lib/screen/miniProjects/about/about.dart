import 'package:aviraldotfun/providers/current_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_viewer/markdown_viewer.dart';
import 'package:provider/provider.dart';
import '../../../consts/data.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  double opacity = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color:
                  colorPalette[Provider.of<CurrentState>(context).selectedColor]
                      .gradient
                      .colors[0]
                      .withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage("assets/images/1725035925815.jpg"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MarkdownViewer(
                  intro_markdown,
                  styleSheet: MarkdownStyle(
                    blockSpacing: 2,
                    headline1: GoogleFonts.montserrat(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                    headline2: GoogleFonts.montserrat(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                    headline3: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    paragraph: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    link: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: colorPalette[Provider.of<CurrentState>(context)
                                      .selectedColor ==
                                  0
                              ? 1
                              : Provider.of<CurrentState>(context)
                                  .selectedColor]
                          .gradient
                          .colors[0],
                    ),
                  ),
                ),

                // Show Resume

                // Container(
                //   alignment: Alignment.center,
                //   padding:
                //       const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                //   child: Text(
                //     "Hi, I am Deepak Mittal",
                //     style: GoogleFonts.openSans(
                //         fontSize: 20, fontWeight: FontWeight.bold),
                //   ),
                // ),
                // Text(
                //   introduction,
                //   style: GoogleFonts.openSans(
                //       fontSize: 15, fontWeight: FontWeight.w500),
                // ).animate().fadeIn(duration: const Duration(milliseconds: 500))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
