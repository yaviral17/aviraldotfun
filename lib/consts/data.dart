import 'package:aviraldotfun/models/app_model.dart';
import 'package:aviraldotfun/models/color_model.dart';
import 'package:aviraldotfun/models/device_model.dart';
import 'package:aviraldotfun/screen/miniProjects/education/education.dart';
import 'package:aviraldotfun/screen/miniProjects/experience/experience.dart';
import 'package:aviraldotfun/screen/payme/utils/theme/theme.dart';
import 'package:aviraldotfun/screen/payme/view/auth/auth_view.dart';
import 'package:aviraldotfun/screen/payme/view/home/home_view.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:iconsax/iconsax.dart';

import '../models/experience_model.dart';
import '../models/skill_model.dart';
import '../screen/miniProjects/about/about.dart';
import '../screen/miniProjects/skills/skills.dart';

const double baseHeight = 790;
const double baseWidth = 1440;

List<DeviceModel> devices = [
  DeviceModel(
    device: Devices.android.onePlus8Pro,
    icon: Icons.android,
  ),
  DeviceModel(
    device: Devices.ios.iPhone13,
    icon: Icons.apple,
  ),
  DeviceModel(
    device: Devices.ios.iPad,
    icon: Icons.tablet,
  ),
];

List<ColorModel> colorPalette = [
  ColorModel(
    svgPath: "assets/images/cloudRed.svg",
    color: Colors.yellowAccent,
    gradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      // transform: Grad,
      end: Alignment.topRight,
      colors: [Colors.yellowAccent, Colors.deepOrange],
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: Colors.blue,
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      colors: [Colors.blue, Colors.black45],
    ),
  ),
  ColorModel(
      svgPath: "assets/images/cloudyBlue.svg",
      color: const Color(0xff00d6ca),
      gradient: const LinearGradient(
        colors: [Color(0xff00ebd5), Color(0xff293474)],
        stops: [0, 1],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      )),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xff123cd1),
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(-0.31, 0.95),
      colors: [Color(0xFF1042F4), Color(0x00203EA6)],
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: Colors.purple,
    gradient: const LinearGradient(
      colors: [Color(0xffc95edb), Colors.black12],
      stops: [0, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xfff35a32),
    gradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Colors.indigo, Colors.deepOrange], // Adjust colors as needed
    ),
  ),
];
final paymeNavigationKey = GlobalKey<NavigatorState>();
List<AppModel> apps = [
  AppModel(
      title: "About",
      color: Colors.white,
      icon: Icons.person,
      screen: const AboutMe()),
  AppModel(
    title: "Resume",
    color: Colors.white,
    icon: Iconsax.document,
    link: resumeLink,
  ),
  AppModel(
      title: "Skills",
      color: Colors.white,
      icon: Icons.ac_unit_rounded,
      screen: const Skills()),
  // AppModel(
  //   title: "Youtube",
  //   assetPath: "assets/icons/youtube.png",
  //   color: Colors.white,
  //   link: youtubeChannel,
  // ),
  AppModel(
    title: "LinkedIn",
    assetPath: "assets/icons/linkedin.png",
    color: Colors.white,
    link: linkedIn,
  ),
  AppModel(
    title: "Twitter/X",
    assetPath: "assets/icons/x.png",
    color: Colors.white,
    link: twitter,
  ),
  AppModel(
    title: "Topmate",
    assetPath: "assets/icons/topMate.png",
    color: Colors.white,
    link: topMate,
  ),
  AppModel(
      title: "Experience",
      color: Colors.white,
      icon: FontAwesomeIcons.idBadge,
      screen: const Experience()),
  AppModel(
    title: "Education",
    color: Colors.white,
    icon: FontAwesomeIcons.edge,
    screen: const Education(),
  ),
  AppModel(
    title: "Github",
    assetPath: "assets/icons/github.png",
    color: Colors.white,
    link: github,
  ),
  AppModel(
    title: "PayME",
    assetPath: "assets/images/logo_icon.png",
    color: Colors.black,
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
    title: "Play Store",
    assetPath: "assets/icons/playstore.png",
    color: Colors.white,
    link: playApps,
  ),
];

final List<JobExperience> education = [
  JobExperience(
    color: Colors.red,
    location: "Patiala, India",
    title: 'Computer Engineering',
    company: 'Thapar Institure of Engineering',
    startDate: 'June 2021',
    endDate: 'Present',
    bulletPoints: [
      "Currently in the final year of my college!",
    ],
  ),
  JobExperience(
    color: Colors.blue,
    location: "Patiala, India",
    title: 'Diploma in Computer Science',
    company: 'Thapar Polytechnic College',
    startDate: 'June 2018',
    endDate: 'June 2021',
    bulletPoints: [
      'Some of the best years of college life',
    ],
  ),
];

final List<JobExperience> jobExperiences = [
  JobExperience(
    color: Colors.blue,
    location: "Banglore, India",
    title: 'Full Stack Developer',
    company: 'Stimuler',
    startDate: 'Feb 2023',
    endDate: 'Present',
    bulletPoints: [
      "Actively develop and manage push notifications to engage users effectively.",
      "Successfully set up in-app purchase functionality for both iOS and Android platforms.",
      "Utilize the Provider package for streamlined state management and implement real-time data streams.",
      "Employ Amplitude and Firebase Analytics to track and analyze user behavior, informing data-driven decisions.",
      "The Startup has over 3,00,000 lakh active users",
    ],
  ),
  // Add more job experiences here...
  JobExperience(
    color: Colors.redAccent,
    location: "Remote",
    title: 'Flutter Developer',
    company: 'Perpetuum India',
    startDate: 'Oct 2022',
    endDate: 'Jan 2023',
    bulletPoints: [
      "Establish voice calling functionality using Agora SDK to enable real-time communication within the app.",
      "Implement intricate animations using Rive, enhancing the app's visual appeal and engagement.",
      "Collaborate directly with Stanza Living's CTO, gaining insights into industry best practices and cutting-edge technologies.",
      "Acquire proficiency in server-driven UI setup, optimizing app flexibility and scalability through dynamic configuration.",
    ],
  ),
  JobExperience(
    color: Colors.orangeAccent,
    location: "Remote",
    title: 'App Architecture Intern',
    company: 'Habeato',
    startDate: 'Oct 2021',
    endDate: 'Nov 2021',
    bulletPoints: [
      "Collaborated with founders to develop a HealthifyMe clone, demonstrating strong teamwork and app development skills.",
      "Engineered complex animations to enhance user experience and app visual appeal.",
      "Played an active role in system design processes, contributing to efficient and scalable app architecture.",
    ],
  ),
  JobExperience(
    color: Colors.greenAccent,
    location: "Remote",
    title: 'App Developer',
    company: 'Kylo Apps',
    startDate: 'Sep 2021',
    endDate: 'Oct 2021',
    bulletPoints: [
      "Collaborated as a team member in developing a cryptocurrency wallet, akin to Trust Wallet, showcasing strong teamwork and blockchain app development expertise.",
      "Proficiently integrated REST APIs into the application, enhancing its functionality and connectivity with external services."
    ],
  ),
  JobExperience(
    color: Colors.black,
    location: "Remote",
    title: 'Flutter App Intern',
    company: 'Cogent Web Services',
    startDate: 'Dec 2020',
    endDate: 'June 2021',
    bulletPoints: [
      "Independently developed a Life Simulator game using Flutter from scratch, applying state-of-the-art state management practices to ensure a top-tier user experience.",
      "Leveraged Flutter's robust features to craft an immersive and captivating gameplay experience, demonstrating proficiency in app development.",
      "Successfully implemented Google Ads, in-app purchases, and Hive database for efficient user data storage and monetization strategies.",
      "Generated creative ideas for client pitches, fostering creativity and ensuring the game's entertainment value and thought-provoking nature.",
      "Published the game on the Play Store, achieving over 5,000 downloads, showcasing the ability to deliver a popular and engaging mobile application.",
    ],
  ),
];

const String youtubeChannel = "https://www.youtube.com/@highcoder";
const String linkedIn = "https://www.linkedin.com/in/yaviral17/";
const String github = "https://github.com/yaviral17";
const String twitter = "https://twitter.com/sudo_yavi";
const String topMate = "https://topmate.io/yaviral17";
const String resumeLink =
    "https://drive.google.com/file/d/1C4R6GsVOWfIcUIOmem5cXQfutzSOerVD/view?usp=drive_link";
const String email = "yaviralatwork@gmail.com";
String introduction = "";
String intro_markdown = """
## Hi, I’m Aviral Yadav 👋  

A passionate **Software Developer** with **2+ years** of experience crafting elegant and high-performing **cross-platform applications** using the **Flutter framework**. From college projects and internships to leading club activities, I’ve honed my skills in building dynamic mobile apps with a focus on clean UI and delightful **animations** that engage users.

I thrive on solving challenges—whether it’s optimizing app layouts, fixing crashes, or integrating APIs for enhanced features. At **Plana World**, I revamped app aesthetics and boosted user satisfaction, while at **Shortsqueeze**, I developed 40+ responsive screens with seamless animations, increasing user interaction by 30%.  

### Some of My Standout Projects 🚀  
- **Paysa**: An expense management app with AI-powered money management features, helping 100+ users split and track bills.  
- **InShop**: A product detail aggregator, integrating shopping APIs across 50+ websites to optimize performance and user experience.  




""";

// ---
// ### Let’s Connect 🌟
// I’m always excited to collaborate and build something amazing together!
// - [**Topmate**](#)
// - [LinkedIn](https://linkedin.com/in/yaviral17)
// - [GitHub](https://github.com/yaviral17)

// Feel free to reach out and say hi! 🚀

const String playApps =
    "https://play.google.com/store/apps/details?id=space.shortsqueeze.inspire.inspire_scholarship&hl=en-US";

List<SkillsModel> skills = [
  SkillsModel(skillName: "Flutter", colorS: Colors.blue, iconPath: "random"),
  SkillsModel(
    skillName: "Firebase",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Github",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Dart",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "Provider",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "Riverpod",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "GetX",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "Bloc",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "Python",
    colorS: Colors.blue,
  ),

  // SkillsModel(
  //   skillName: "CI/CD",
  //   colorS: Colors.yellow,
  // ),
  // SkillsModel(
  //   skillName: "Code Magic",
  //   colorS: Colors.orange,
  // ),
  // SkillsModel(
  //   skillName: "Firebase",
  //   colorS: Colors.yellow,
  // ),
  SkillsModel(
    skillName: "REST API",
    colorS: Colors.blue,
  ),
];

List<SkillsModel> languages = [
  // SkillsModel(skillName: "Punjabi", colorS: Colors.orange),
  SkillsModel(skillName: "Hindi", colorS: Colors.black),
  SkillsModel(skillName: "English", colorS: Colors.blueGrey),
];
