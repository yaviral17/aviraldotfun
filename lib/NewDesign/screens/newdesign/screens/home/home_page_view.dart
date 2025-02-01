import 'dart:developer';
import 'dart:ui';

import 'package:aviraldotfun/providers/current_state.dart';
import 'package:aviraldotfun/screen/homescreen/phone_home_page.dart';
import 'package:aviraldotfun/screen/homescreen/phone_screen_wrapper.dart';
import 'package:aviraldotfun/screen/payme/view/auth/signup/phone_view.dart';
import 'package:aviraldotfun/utils/portfolio_sizes.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart' as icon_plus;
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:smooth_corner/smooth_corner.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView>
    with SingleTickerProviderStateMixin {
  double _hoveringOnSkill = -1;
  double _hoveringOnMenuItem = -1;
  bool _hoveringResumeButton = false;
  bool _hoverGetInTouch = false;
  bool _showPhone = false;
  List<String> menuItem = [
    "Home",
    "Skills",
    "Experience",
    "Projects",
    "Testimonials",
    "About Me",
    "Contact Me",
  ];

  final _home = new GlobalKey();
  final _skills = new GlobalKey();
  final _experience = new GlobalKey();
  final _projects = new GlobalKey();
  final _testimonial = new GlobalKey();
  final _aboutme = new GlobalKey();
  final _contactme = new GlobalKey();

  List<GlobalKey> keys = [];

  ScrollController scrollViewController = ScrollController();
  bool isVisible = false;

  late GifController _gifontroller;

  double responsiveWidth(double static, double adaptive,
      {double breakPoint = 950}) {
    return ASizes.screenWidth(context) > breakPoint
        ? static
        : ASizes.arw(context, adaptive);
  }

  AnimationController? _phoneController;

  void scrollTo(GlobalKey key) {
    if (keys.indexOf(key) > 0) {
      setState(() {
        isVisible = true;
      });
    }
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _phoneController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    keys = [
      _home,
      _skills,
      _experience,
      _projects,
      _testimonial,
      _aboutme,
      _contactme
    ];
    scrollViewController?.addListener(() {
      if (scrollViewController?.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isVisible == true) {
          setState(() {
            isVisible = false;
          });
        }
      } else {
        if (scrollViewController?.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (isVisible == false) {
            setState(() {
              isVisible = true;
            });
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String phone_bg = "assets/images/phone_bg.gif";
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: Visibility(
        visible: isVisible,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            scrollViewController.animateTo(
                scrollViewController.position.minScrollExtent,
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease);
            setState(() {
              isVisible = false;
            });
          },
          child: Icon(
            Icons.arrow_upward,
            color: Colors.black,
            size: 32,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 2),
        height: 25.2,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: FittedBox(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Made with ",
                style: GoogleFonts.sora(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Image.asset(
                "assets/images/pngwing.com.png",
                height: 20,
                width: 20,
                color: Colors.white,
              ),
              Text(
                " by Aviral using ",
                style: GoogleFonts.sora(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Image.asset(
                "assets/images/flutter_png.png",
                height: 20,
                width: 20,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 0),
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                "assets/images/Glitch Glow GIF by Erica Anderson.gif",
                height: ASizes.screenHeight(context),
                width: ASizes.screenWidth(context),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Consumer<CurrentState>(
            // selector: (context, provider) => provider.currentDevice,
            builder: (context, _, __) {
              return Container(
                width: ASizes.arw(context, 360),
                padding: const EdgeInsets.all(24),
                // height: ASizes.screenHeight(context) - 80,
                child: DeviceFrame(
                  orientation: Orientation.portrait,
                  device: currentState.currentDevice,
                  isFrameVisible: true,
                  screen: Stack(
                    children: [
                      // Image.asset(
                      //   phone_bg,
                      //   height: ASizes.screenHeight(context),
                      //   width: ASizes.screenWidth(context),
                      //   fit: BoxFit.cover,
                      // ),
                      ScreenWrapper(childG: currentState.currentScreen),
                    ],
                  ),
                ),
              ).animate(controller: _phoneController, autoPlay: false).slide(
                  begin: Offset(-1, 0),
                  end: Offset(0, 0),
                  curve: Curves.easeInOut);
            },
          ),
          Positioned(
            left: -60,
            top: ASizes.screenHeight(context) / 2,
            child: Transform.rotate(
              angle: 1.5708,
              child: InkWell(
                onTap: () {
                  if (_showPhone) {
                    _phoneController?.reverse();
                  } else {
                    _phoneController?.forward();
                  }
                  setState(() {
                    _showPhone = !_showPhone;
                  });
                },
                child: Container(
                  width: 140,
                  height: 24,
                  decoration: BoxDecoration(
                    color: _showPhone ? Colors.redAccent : Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      _showPhone ? "Hide Phone" : "Show Live Demo",
                      style: GoogleFonts.sora(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.fastOutSlowIn,
                width: _showPhone ? ASizes.arw(context, 360) : 40,
              ),
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  width: ASizes.arw(context, 100),
                  child: SingleChildScrollView(
                    controller: scrollViewController,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Navbar
                        Container(
                          width: ASizes.arw(context, 800),
                          padding: const EdgeInsets.symmetric(
                            vertical: 36,
                            horizontal: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                              menuItem.length,
                              (index) {
                                return InkWell(
                                  onTap: () {
                                    scrollTo(keys[index]);
                                  },
                                  onHover: (value) {
                                    log('value: $value');
                                    setState(() {
                                      _hoveringOnMenuItem =
                                          value ? index.toDouble() : -1;
                                    });
                                  },
                                  child: Text(
                                    menuItem[index],
                                    style: GoogleFonts.sora(
                                      letterSpacing: -1,
                                      fontSize: responsiveWidth(18, 24,
                                          breakPoint: 840),
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        // resume button

                        const SizedBox(height: 60),

                        // Headder Section

                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: ASizes.arw(context, 800),
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Hello, I'am ",
                                              style: GoogleFonts.sora(
                                                fontSize: responsiveWidth(
                                                    54, 36,
                                                    breakPoint: 1200),
                                                letterSpacing: -2,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              "Aviral Yadav.",
                                              style: GoogleFonts.sora(
                                                fontSize: responsiveWidth(
                                                    54, 36,
                                                    breakPoint: 1200),
                                                letterSpacing: -2,
                                                color: Colors.red,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Flutter ",
                                              style: GoogleFonts.sora(
                                                fontSize: responsiveWidth(
                                                    54, 36,
                                                    breakPoint: 1200),
                                                letterSpacing: -2,
                                                color: Colors.blueAccent,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            // StrokeText(
                                            //   text: "Developer",
                                            //   textSize: 36,
                                            //   textStyle: GoogleFonts.sora(),
                                            //   textColor: Colors.black,
                                            //   letterSpacing: 1,
                                            //   fontWeight: FontWeight.w800,
                                            //   strokeWidth: 5,
                                            //   strokeColor: Colors.white,
                                            // ),
                                            Text(
                                              "Developer ,",
                                              style: GoogleFonts.sora(
                                                fontSize: responsiveWidth(
                                                    54, 36,
                                                    breakPoint: 1200),
                                                letterSpacing: -2,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            // StrokeText(
                                            //   text: "UI/UX ",
                                            //   textSize: 36,
                                            //   textStyle: GoogleFonts.sora(),
                                            //   textColor: Colors.white,
                                            //   letterSpacing: 2,
                                            //   fontWeight: FontWeight.w800,
                                            //   strokeWidth: 4,
                                            //   strokeColor: Colors.black,
                                            // ),
                                            Text(
                                              "UI/UX ",
                                              style: GoogleFonts.sora(
                                                fontSize: responsiveWidth(
                                                    54, 36,
                                                    breakPoint: 1200),
                                                letterSpacing: -2,
                                                color: Colors.pinkAccent,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              "Designer ",
                                              style: GoogleFonts.sora(
                                                fontSize: responsiveWidth(
                                                    54, 36,
                                                    breakPoint: 1200),
                                                letterSpacing: -2,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 36),
                                        SizedBox(
                                          width: responsiveWidth(
                                            450,
                                            550,
                                            breakPoint: 1180,
                                          ),
                                          child: Text(
                                            "I'm Aviral yadav Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to specimen book.",
                                            style: GoogleFonts.sora(
                                              fontSize: responsiveWidth(
                                                12,
                                                16,
                                                breakPoint: 1180,
                                              ),
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0,
                                              color: Color.fromARGB(
                                                  255, 154, 154, 164),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 36),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Image.asset(
                                                "assets/icons/facebok.png",
                                                height:
                                                    ASizes.arh(context, 117),
                                                width: ASizes.arh(context, 117),
                                                fit: BoxFit.cover,
                                                filterQuality:
                                                    FilterQuality.high,
                                                // negative color filter
                                                color: Colors.white,
                                                colorBlendMode:
                                                    BlendMode.difference,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Image.asset(
                                                "assets/icons/facebok.png",
                                                height:
                                                    ASizes.arh(context, 117),
                                                width: ASizes.arh(context, 117),
                                                fit: BoxFit.cover,
                                                color: Colors.white,
                                                colorBlendMode:
                                                    BlendMode.difference,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Image.asset(
                                                "assets/icons/facebok.png",
                                                height:
                                                    ASizes.arh(context, 117),
                                                width: ASizes.arh(context, 117),
                                                fit: BoxFit.cover,
                                                color: Colors.white,
                                                colorBlendMode:
                                                    BlendMode.difference,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Image.asset(
                                                "assets/icons/facebok.png",
                                                height:
                                                    ASizes.arh(context, 117),
                                                width: ASizes.arh(context, 117),
                                                fit: BoxFit.cover,
                                                color: Colors.white,
                                                colorBlendMode:
                                                    BlendMode.difference,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // headder image
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Image.asset(
                                        "assets/images/hadder_vector_light.png",
                                        height: ASizes.arw(context, 360),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Skills section
                        SizedBox(
                          height: 100,
                        ),
                        Row(
                          key: _skills,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "My ",
                              style: GoogleFonts.sora(
                                fontSize: 36,
                                letterSpacing: -2,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Skills",
                              style: GoogleFonts.sora(
                                fontSize: 36,
                                color: Colors.white,
                                letterSpacing: -2,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),

                        Wrap(
                          children: List.generate(
                            10,
                            (index) {
                              return InkWell(
                                onTap: () {},
                                onHover: (value) {
                                  setState(() {
                                    _hoveringOnSkill =
                                        value ? index.toDouble() : -1;
                                  });
                                },
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.fastOutSlowIn,
                                  margin: const EdgeInsets.all(16),
                                  width: responsiveWidth(126, 200,
                                      breakPoint: 1180),
                                  height: responsiveWidth(126, 200,
                                      breakPoint: 1180),
                                  decoration: BoxDecoration(
                                    color: _hoveringOnSkill == index
                                        ? Colors.white
                                        : Colors.black,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          icon_plus.LineAwesome.git,
                                          size: 36,
                                          color: _hoveringOnSkill == index
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "Git",
                                          style: GoogleFonts.sora(
                                            color: _hoveringOnSkill == index
                                                ? Colors.black
                                                : Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        /// My Experience section,

                        const SizedBox(
                          height: 80,
                        ),
                        Row(
                          key: _experience,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "My ",
                              style: GoogleFonts.sora(
                                fontSize: 36,
                                letterSpacing: -2,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Experience",
                              style: GoogleFonts.sora(
                                fontSize: 36,
                                letterSpacing: -2,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        ...List.generate(
                          3,
                          (index) {
                            return Container(
                              padding: const EdgeInsets.all(18),
                              margin: const EdgeInsets.only(bottom: 24),
                              width: ASizes.screenWidth(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white24,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      icon_plus.Brand(
                                        icon_plus.Brands.google,
                                        size: 36,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Lorem Impsum diosm",
                                        style: GoogleFonts.sora(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Nov 2023 - Present",
                                        style: GoogleFonts.sora(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white54,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: ASizes.arh(context, 36),
                                  ),
                                  Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to specimen book.",
                                    style: GoogleFonts.sora(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white54,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),

                        /// About me
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          key: _aboutme,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              child: Image.asset(
                                "assets/images/Gojo Running.gif",

                                repeat: ImageRepeat.noRepeat,
                                width:
                                    responsiveWidth(400, 600, breakPoint: 1300),
                                // colorBlendMode: BlendMode.difference,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "About ",
                                      style: GoogleFonts.sora(
                                        fontSize: 40,
                                        letterSpacing: -2,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "Me ",
                                      style: GoogleFonts.sora(
                                        fontSize: 40,
                                        letterSpacing: -2,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: 460,
                                  child: Text(
                                    "I'm a passionate, self-proclaimed designer who specializes in full stack development (React.js & Node.js). I am very enthusiastic about bringing the technical and visual aspects of digital products to life. User experience, pixel perfect design, and writing clear, readable, highly performant code matters to me.\n\n\nI began my journey as a web developer in 2015, and since then, I've continued to grow and evolve as a developer, taking on new challenges and learning the latest technologies along the way. Now, in my early thirties, 7 years after starting my web development journey, I'm building cutting-edge web applications using modern technologies such as Next.js, TypeScript, Nestjs, Tailwindcss, Supabase and much more.\n\n\nWhen I'm not in full-on developer mode, you can find me hovering around on twitter or on indie hacker, witnessing the journey of early startups or enjoying some free time. You can follow me on Twitter where I share tech-related bites and build in public, or you can follow me on GitHub.",
                                    style: GoogleFonts.sora(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(),
                          ],
                        ),

                        /// My Projects

                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          key: _projects,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "My ",
                              style: GoogleFonts.sora(
                                fontSize: 36,
                                letterSpacing: -2,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Projects",
                              style: GoogleFonts.sora(
                                fontSize: 36,
                                letterSpacing: -2,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        ProjectTIleWidget(
                          imageWidth:
                              responsiveWidth(400, 430, breakPoint: 1180),
                          imageHeight: 400,
                          projectInfoHeight: 300,
                          projectInfoWidth:
                              responsiveWidth(400, 430, breakPoint: 1180),
                        ),
                        ProjectTIleWidget(
                          imageWidth:
                              responsiveWidth(400, 430, breakPoint: 1180),
                          imageHeight: 400,
                          projectInfoHeight: 300,
                          projectInfoWidth:
                              responsiveWidth(400, 430, breakPoint: 1180),
                          // proectImageLeft: false,
                        ),
                        ProjectTIleWidget(
                          imageWidth:
                              responsiveWidth(400, 430, breakPoint: 1180),
                          imageHeight: 400,
                          projectInfoHeight: 300,
                          projectInfoWidth:
                              responsiveWidth(400, 430, breakPoint: 1180),
                        ),

                        /// Testimonials
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          key: _testimonial,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "My ",
                              style: GoogleFonts.sora(
                                fontSize: 36,
                                letterSpacing: -2,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Testimonials",
                              style: GoogleFonts.sora(
                                fontSize: 36,
                                letterSpacing: -2,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 72.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TestimonialWidget(
                                width:
                                    responsiveWidth(280, 240, breakPoint: 1500),
                                height:
                                    responsiveWidth(400, 380, breakPoint: 1500),
                              ),
                              TestimonialWidget(
                                width:
                                    responsiveWidth(280, 240, breakPoint: 1500),
                                height:
                                    responsiveWidth(400, 380, breakPoint: 1500),
                              ),
                              TestimonialWidget(
                                width:
                                    responsiveWidth(280, 240, breakPoint: 1500),
                                height:
                                    responsiveWidth(400, 380, breakPoint: 1500),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 60,
                        ),

                        Padding(
                          key: _contactme,
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  responsiveWidth(72, 20, breakPoint: 1480)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: responsiveWidth(400, 600),
                                child: Column(
                                  children: [
                                    NewPortfolioTextFieldWidget(
                                      width: ASizes.arw(context, 600),
                                    ),
                                    const SizedBox(height: 16),
                                    NewPortfolioTextFieldWidget(
                                      width: ASizes.arw(context, 600),
                                      hintText: "Email",
                                    ),
                                    const SizedBox(height: 16),
                                    NewPortfolioTextFieldWidget(
                                      width: ASizes.arw(context, 600),
                                      hintText: "Phone (Optional)",
                                    ),
                                    const SizedBox(height: 16),
                                    NewPortfolioTextFieldWidget(
                                      width: ASizes.arw(context, 600),
                                      maxLines: 6,
                                      minLines: 6,
                                    ),
                                    const SizedBox(height: 16),
                                    SizedBox(
                                      width: responsiveWidth(400, 600),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            onHover: (value) {
                                              setState(() {
                                                _hoverGetInTouch = value;
                                              });
                                            },
                                            child: Container(
                                              width: responsiveWidth(140, 207),
                                              height: responsiveWidth(50, 70),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 5,
                                              ),
                                              decoration: BoxDecoration(
                                                color: _hoverGetInTouch
                                                    ? Colors.white
                                                    : Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 2,
                                                ),
                                              ),
                                              child: FittedBox(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      'Get In Touch',
                                                      style: GoogleFonts.sora(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: _hoverGetInTouch
                                                            ? Colors.black
                                                            : Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          ...List.generate(
                                            4,
                                            (index) {
                                              return Image.asset(
                                                "assets/icons/facebok.png",
                                                height: responsiveWidth(50, 70),
                                                width: responsiveWidth(50, 70),
                                                fit: BoxFit.cover,
                                                color: Colors.white,
                                                colorBlendMode:
                                                    BlendMode.difference,
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Let's ",
                                        style: GoogleFonts.sora(
                                          fontSize: 36,
                                          letterSpacing: -2,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      StrokeText(
                                        text: "talk",
                                        textSize: 36,
                                        textStyle: GoogleFonts.sora(),
                                        textColor: Colors.black,
                                        letterSpacing: -1,
                                        fontWeight: FontWeight.w800,
                                        strokeWidth: 5,
                                        strokeColor: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        " for",
                                        style: GoogleFonts.sora(
                                          fontSize: 36,
                                          letterSpacing: -2,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Something special",
                                    style: GoogleFonts.sora(
                                      fontSize: 36,
                                      letterSpacing: -2,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "I seek to push the limits of creativity to create high-engaging, user-friendly, and memorable interactive experiences.",
                                    style: GoogleFonts.sora(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white54,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Text(
                                    "yaviralatwork@gmail.com",
                                    style: GoogleFonts.sora(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NewPortfolioTextFieldWidget extends StatelessWidget {
  final double width;

  final int maxLines;
  final int minLines;
  final String hintText;

  const NewPortfolioTextFieldWidget({
    super.key,
    this.width = 400,
    this.maxLines = 1,
    this.minLines = 1,
    this.hintText = "Your Name",
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        // maxLength: maxLines,
        maxLines: maxLines,
        minLines: minLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.sora(
            fontSize: 14,
            letterSpacing: -1,
            color: Colors.white54,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.5,
            ),
          ),
        ),
        cursorHeight: 18,
        cursorColor: Colors.white,
        cursorWidth: 2,
        style: GoogleFonts.sora(
          fontSize: 14,
          letterSpacing: -1,
          color: Colors.white,
        ),
      ),
    );
  }
}

class TestimonialWidget extends StatelessWidget {
  final double width;
  final double height;
  final bool isHovering;
  const TestimonialWidget({
    super.key,
    this.width = 280,
    this.height = 340,
    this.isHovering = false,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 36),
      margin: const EdgeInsets.all(8),
      color: isHovering ? Colors.white : Colors.black,
      side: BorderSide(
        color: Colors.white,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: ASizes.arw(context, 70),
            height: ASizes.arw(context, 70),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/testimonial_example.png",
                  width: ASizes.arw(context, 70),
                  height: ASizes.arw(context, 70),
                  fit: BoxFit.fitWidth,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 12,
                    child: Icon(
                      icon_plus.Iconsax.quote_up_circle_bold,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 100,
            child: FittedBox(
              child: Text(
                "I recently had to jump on\n10+ different callsacross eight\ndifferentcountries to find the\nright owner.",
                textAlign: TextAlign.center,
                style: GoogleFonts.sora(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            width: 120,
            child: Divider(
              color: Colors.white24,
              thickness: 1,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: 72,
            child: FittedBox(
              child: Text(
                "Lorem Impsum",
                style: GoogleFonts.sora(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 54,
            child: FittedBox(
              child: Text(
                "Designer",
                style: GoogleFonts.sora(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectTIleWidget extends StatelessWidget {
  final bool proectImageLeft;
  final double imageWidth;
  final double imageHeight;
  final double projectInfoWidth;
  final double projectInfoHeight;
  const ProjectTIleWidget({
    super.key,
    this.proectImageLeft = true,
    this.imageWidth = 530,
    this.imageHeight = 740,
    this.projectInfoWidth = 530,
    this.projectInfoHeight = 740,
  });

  @override
  Widget build(BuildContext context) {
    var image = SmoothClipRRect(
      side: BorderSide(
        color: Colors.white,
        width: 1,
      ),
      smoothness: 1,
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        "assets/images/project_image.png",
        width: imageWidth,
        height: imageHeight,
        fit: BoxFit.cover,
      ),
    );
    var projectInfo = SizedBox(
      width: projectInfoWidth,
      height: projectInfoHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "01",
            style: GoogleFonts.sora(
              fontSize: 36,
              letterSpacing: -2,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          FittedBox(
            child: Text(
              "Crypto Screener Application",
              style: GoogleFonts.sora(
                fontSize: 40,
                letterSpacing: -2,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "I'm Aviral Yadav Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to specimen book.",
            style: GoogleFonts.sora(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Colors.white54,
            ),
          ),
          const SizedBox(height: 20),
          Icon(
            icon_plus.BoxIcons.bx_link_external,
            color: Colors.white,
          ),
        ],
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          if (!proectImageLeft) SizedBox(),

          proectImageLeft ? image : projectInfo,
          // const SizedBox(width: 40),
          proectImageLeft ? projectInfo : image,
          if (proectImageLeft) SizedBox(),
        ],
      ),
    );
  }
}

class StrokeText extends StatefulWidget {
  const StrokeText({
    super.key,
    this.width,
    this.height,
    this.text,
    this.textSize,
    this.textColor,
    this.strokeColor,
    this.letterSpacing,
    this.strokeWidth,
    this.fontWeight,
    this.textStyle,
  });

  final double? width;
  final double? height;
  final String? text;
  final double? textSize;
  final Color? textColor;
  final Color? strokeColor;
  final double? letterSpacing;
  final double? strokeWidth;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;

  @override
  State<StrokeText> createState() => _StrokeTextState();
}

class _StrokeTextState extends State<StrokeText> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Implement the stroke
        Text(
          widget.text ?? '',
          // style: TextStyle(
          //   fontSize: widget.textSize ?? 16,
          //   letterSpacing: widget.letterSpacing ?? 0,
          //   fontWeight: FontWeight.bold,
          //   foreground: Paint()
          //     ..style = PaintingStyle.stroke
          //     ..strokeWidth = widget.strokeWidth ?? 4
          //     ..color = widget.strokeColor ?? Colors.black,
          // ),
          style: (widget.textStyle ?? TextStyle()).copyWith(
            fontSize: widget.textSize ?? 16,
            letterSpacing: widget.letterSpacing ?? 0,
            fontWeight: widget.fontWeight ?? FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = widget.strokeWidth ?? 4
              ..color = widget.strokeColor ?? Colors.black,
          ),
        ),
        // The text inside
        Text(
          widget.text ?? '',
          // style: TextStyle(
          //   fontSize: widget.textSize ?? 16,
          //   letterSpacing: widget.letterSpacing ?? 0,
          //   fontWeight: FontWeight.bold,
          //   color: widget.textColor ?? Colors.white,
          // ),
          style: (widget.textStyle ?? TextStyle()).copyWith(
            fontSize: widget.textSize ?? 16,
            letterSpacing: widget.letterSpacing ?? 0,
            fontWeight: widget.fontWeight ?? FontWeight.bold,
            color: widget.textColor ?? Colors.white,
          ),
        ),
      ],
    );
  }
}
