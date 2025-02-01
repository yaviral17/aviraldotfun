import 'dart:developer';

import 'package:aviraldotfun/providers/current_state.dart';
import 'package:aviraldotfun/screen/homescreen/phone_home_page.dart';
import 'package:aviraldotfun/screen/homescreen/phone_screen_wrapper.dart';
import 'package:aviraldotfun/screen/payme/view/auth/signup/phone_view.dart';
import 'package:aviraldotfun/utils/portfolio_sizes.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
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

class _HomePageViewState extends State<HomePageView> {
  double _hoveringOnSkill = -1;
  double _hoveringOnMenuItem = -1;

  List<String> menuItem = ['Home', 'About', 'Projects', 'Contact Me'];

  final _experience = new GlobalKey();
  final _projects = new GlobalKey();
  final _testimonial = new GlobalKey();

  double responsiveWidth(double static, double adaptive,
      {double breakPoint = 950}) {
    return ASizes.screenWidth(context) > breakPoint
        ? static
        : ASizes.arw(context, adaptive);
  }

  // double responsiveHight(double static, double adaptive) {
  //   return ASizes.screenHeight(context) > 950
  //       ? static
  //       : ASizes.arw(context, adaptive);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      log('experience: ${_experience.currentContext}');
      Scrollable.ensureVisible(
        _projects.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 40,
            child: Consumer<CurrentState>(
              // selector: (context, provider) => provider.currentDevice,
              builder: (context, _, __) {
                return DeviceFrame(
                  device: currentState.currentDevice,
                  isFrameVisible: true,
                  screen: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://cors-anywhere.herokuapp.com/https://mrwallpaper.com/images/hd/the-perfect-combination-of-form-function-white-minimalist-iphone-4ajikeuumdt3rgse.jpg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ScreenWrapper(childG: currentState.currentScreen)),
                );
              },
            ),
          ),
          SizedBox(
            width: ASizes.arw(context, 1200),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Navbar
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 72,
                        // vertical: 10,
                      ),
                      height: 90,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // logo and name
                          Row(
                            children: [
                              Image.network(
                                'https://yaviral.website/web-release/favicon.png',
                                height: 36,
                                width: 36,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Aviral',
                                style: GoogleFonts.sora(
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),

                          // menu
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                menuItem.length,
                                (index) {
                                  return InkWell(
                                    onTap: () {
                                      if (index == 2) {
                                        log('index: $index');
                                        Scrollable.ensureVisible(
                                          _projects.currentContext!,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeInOut,
                                          alignmentPolicy:
                                              ScrollPositionAlignmentPolicy
                                                  .explicit,
                                        );
                                      }
                                    },
                                    onHover: (value) {
                                      log('value: $value');
                                      setState(() {
                                        _hoveringOnMenuItem =
                                            value ? index.toDouble() : -1;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        menuItem[index],
                                        style: GoogleFonts.sora(
                                          letterSpacing: -1,
                                          fontSize: responsiveWidth(16, 24,
                                              breakPoint: 840),
                                          fontWeight:
                                              _hoveringOnMenuItem == index
                                                  ? FontWeight.w800
                                                  : FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          // resume button
                          Container(
                            width: 100,
                            height: 36,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: FittedBox(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Resume',
                                    style: GoogleFonts.sora(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(
                                    Iconsax.document_download,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),

                  // Headder Section

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 72,
                    ),
                    child: SizedBox(
                      height: ASizes.arh(context, 1300),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Spacer(),
                              Row(
                                children: [
                                  Text(
                                    "Hello, I'am ",
                                    style: GoogleFonts.sora(
                                      fontSize: 36,
                                      letterSpacing: -2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "Aviral Yadav.",
                                    style: GoogleFonts.sora(
                                      fontSize: 36,
                                      letterSpacing: -2,
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
                                      fontSize: 36,
                                      letterSpacing: -2,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  StrokeText(
                                    text: "Developer",
                                    textSize: 36,
                                    textStyle: GoogleFonts.sora(),
                                    textColor: Colors.white,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w800,
                                    strokeWidth: 5,
                                    strokeColor: Colors.black,
                                  ),
                                  Text(
                                    " & ",
                                    style: GoogleFonts.sora(
                                      fontSize: 36,
                                      letterSpacing: -2,
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
                                      fontSize: 36,
                                      letterSpacing: -2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "Designer ",
                                    style: GoogleFonts.sora(
                                      fontSize: 36,
                                      letterSpacing: -2,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 36),
                              SizedBox(
                                width:
                                    responsiveWidth(600, 650, breakPoint: 1180),
                                child: Text(
                                  "I'm Aviral yadav Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to specimen book.",
                                  style: GoogleFonts.sora(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0,
                                    color: Color(0xff71717A),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 36),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Image.asset(
                                      "assets/icons/facebok.png",
                                      height: ASizes.arh(context, 117),
                                      width: ASizes.arh(context, 117),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Image.asset(
                                      "assets/icons/facebok.png",
                                      height: ASizes.arh(context, 117),
                                      width: ASizes.arh(context, 117),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Image.asset(
                                      "assets/icons/facebok.png",
                                      height: ASizes.arh(context, 117),
                                      width: ASizes.arh(context, 117),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Image.asset(
                                      "assets/icons/facebok.png",
                                      height: ASizes.arh(context, 117),
                                      width: ASizes.arh(context, 117),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),

                          // headder image
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Spacer(),
                              Image.asset(
                                "assets/icons/hadder_person.png",
                                width: ASizes.arw(context, 800),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10)
                        ],
                      ),
                    ),
                  ),

                  // Skills section

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "My ",
                          style: GoogleFonts.sora(
                            fontSize: 36,
                            letterSpacing: -2,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Skills",
                          style: GoogleFonts.sora(
                            fontSize: 36,
                            letterSpacing: -2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 72),
                    child: Wrap(
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
                              width: 126,
                              height: 126,
                              decoration: BoxDecoration(
                                color: _hoveringOnSkill == index
                                    ? Colors.black
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(color: Colors.black, width: 2),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      icon_plus.LineAwesome.git,
                                      size: 36,
                                      color: _hoveringOnSkill == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Git",
                                      style: GoogleFonts.sora(
                                        color: _hoveringOnSkill == index
                                            ? Colors.white
                                            : Colors.black,
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
                  ),

                  /// My Experience section,

                  const SizedBox(
                    height: 80,
                  ),
                  Container(
                    key: _experience,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 72,
                      vertical: 60,
                    ),
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    // height: 500,
                    child: Column(
                      children: [
                        Row(
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
                                        "Lead Software Engineer at Google",
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
                                    "As a Senior Software Engineer at Google, I played a pivotal role in developing innovative solutions for Google's core search algorithms. Collaborating with a dynamic team of engineers, I contributed to the enhancement of search accuracy and efficiency, optimizing user experiences for millions of users worldwide.",
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
                      ],
                    ),
                  ),

                  /// About me
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                      vertical: 60,
                    ),
                    color: Colors.white,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/about_me_vector.png",
                          width: responsiveWidth(400, 600, breakPoint: 1000),
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
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "Me ",
                                  style: GoogleFonts.sora(
                                    fontSize: 40,
                                    letterSpacing: -2,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: 460,
                              child: Flexible(
                                child: Text(
                                  "I'm a passionate, self-proclaimed designer who specializes in full stack development (React.js & Node.js). I am very enthusiastic about bringing the technical and visual aspects of digital products to life. User experience, pixel perfect design, and writing clear, readable, highly performant code matters to me.\n\n\nI began my journey as a web developer in 2015, and since then, I've continued to grow and evolve as a developer, taking on new challenges and learning the latest technologies along the way. Now, in my early thirties, 7 years after starting my web development journey, I'm building cutting-edge web applications using modern technologies such as Next.js, TypeScript, Nestjs, Tailwindcss, Supabase and much more.\n\n\nWhen I'm not in full-on developer mode, you can find me hovering around on twitter or on indie hacker, witnessing the journey of early startups or enjoying some free time. You can follow me on Twitter where I share tech-related bites and build in public, or you can follow me on GitHub.",
                                  style: GoogleFonts.sora(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff71717A),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// My Projects

                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 72,
                      vertical: 60,
                    ),
                    width: ASizes.screenWidth(context),
                    color: Colors.black,
                    child: Column(
                      children: [
                        Row(
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
                          key: _projects,
                          imageWidth:
                              responsiveWidth(500, 530, breakPoint: 1180),
                          imageHeight: 400,
                          projectInfoHeight: 300,
                          projectInfoWidth:
                              responsiveWidth(500, 530, breakPoint: 1180),
                          proectImageLeft: true,
                        ),
                        ProjectTIleWidget(
                          imageWidth:
                              responsiveWidth(500, 530, breakPoint: 1180),
                          imageHeight: 400,
                          projectInfoHeight: 300,
                          projectInfoWidth:
                              responsiveWidth(500, 530, breakPoint: 1180),
                          proectImageLeft: false,
                        ),
                        ProjectTIleWidget(
                          imageWidth:
                              responsiveWidth(500, 530, breakPoint: 1180),
                          imageHeight: 400,
                          projectInfoHeight: 300,
                          projectInfoWidth:
                              responsiveWidth(500, 530, breakPoint: 1180),
                          proectImageLeft: true,
                        ),
                      ],
                    ),
                  ),

                  /// Testimonials
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "My ",
                        style: GoogleFonts.sora(
                          fontSize: 36,
                          letterSpacing: -2,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Testimonials",
                        style: GoogleFonts.sora(
                          fontSize: 36,
                          letterSpacing: -2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),

                  // Row(
                  //   mainAxisSize: MainAxisSize.max,
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     TestimonialWidget(),
                  //     TestimonialWidget(),
                  //     TestimonialWidget(),
                  //   ],
                  // ),

                  SizedBox(
                    height: 60,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: responsiveWidth(200, 20, breakPoint: 1480)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: responsiveWidth(500, 600),
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
                                width: responsiveWidth(500, 600),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: responsiveWidth(140, 207),
                                      height: responsiveWidth(50, 70),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: FittedBox(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Get In Touch',
                                              style: GoogleFonts.sora(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
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
                                        );
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: responsiveWidth(500, 600),
                          child: Flexible(
                            child: Column(
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
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    StrokeText(
                                      text: "talk",
                                      textSize: 36,
                                      textStyle: GoogleFonts.sora(),
                                      textColor: Colors.white,
                                      letterSpacing: -1,
                                      fontWeight: FontWeight.w800,
                                      strokeWidth: 5,
                                      strokeColor: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      " for",
                                      style: GoogleFonts.sora(
                                        fontSize: 36,
                                        letterSpacing: -2,
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
                                    color: Colors.black54,
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
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    key: _testimonial,
                    height: 60,
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
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
                            ),
                            Text(
                              " by Aviral Yadav using ",
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
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
            color: Colors.black54,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Colors.black,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Colors.black,
              width: 1.5,
            ),
          ),
        ),
        cursorHeight: 18,
        cursorColor: Colors.black,
        cursorWidth: 2,
        style: GoogleFonts.sora(
          fontSize: 14,
          letterSpacing: -1,
          color: Colors.black,
        ),
      ),
    );
  }
}

class TestimonialWidget extends StatelessWidget {
  const TestimonialWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      height: 340,
      width: 280,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 36),
      color: Colors.black,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: ASizes.arw(context, 100),
            height: ASizes.arw(context, 100),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/testimonial_example.png",
                  width: ASizes.arw(context, 100),
                  height: ASizes.arw(context, 100),
                  fit: BoxFit.fitWidth,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 10,
                    child: Icon(
                      icon_plus.Iconsax.quote_up_circle_bold,
                      size: 20,
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
          Text(
            "I recently had to jump on 10+ different calls across eight different countries to find the right owner.",
            textAlign: TextAlign.center,
            style: GoogleFonts.sora(
              fontSize: 12,
              color: Colors.white,
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
          Text(
            "Aviral Yadav",
            style: GoogleFonts.sora(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Designer",
            style: GoogleFonts.sora(
              fontSize: 12,
              color: Colors.white,
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
      child: Expanded(
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
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          proectImageLeft ? image : projectInfo,
          const SizedBox(width: 40),
          proectImageLeft ? projectInfo : image,
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
