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
// List<AppModel> apps = [
//   AppModel(
//       title: "About",
//       backgroundColor: const Color(0xFF1D1C1C),
//       iconColor: Colors.white,
//       icon: Iconsax.user,
//       screen: const AboutMe()),
//   AppModel(
//     title: "Resume",
//     backgroundColor: Colors.white,
//     iconColor: Colors.white,
//     icon: Iconsax.document,
//     link: resumeLink,
//   ),
//   AppModel(
//       title: "Skills",
//       backgroundColor: Colors.white,
//       iconColor: Colors.white,
//       icon: Icons.ac_unit_rounded,
//       screen: const Skills()),
//   // AppModel(
//   //   title: "Youtube",
//   //   assetPath: "assets/icons/youtube.png",
//   //   color: Colors.white,
//   //   link: youtubeChannel,
//   // ),
//   AppModel(
//     title: "LinkedIn",
//     assetPath: "assets/icons/linkedin.png",
//     backgroundColor: Colors.white,
//     iconColor: Colors.white,
//     link: linkedIn,
//   ),
//   AppModel(
//     title: "Twitter/X",
//     assetPath: "assets/icons/x.png",
//     backgroundColor: Colors.white,
//     iconColor: Colors.white,
//     link: twitter,
//   ),
//   AppModel(
//     title: "Topmate",
//     assetPath: "assets/icons/topMate.png",
//     backgroundColor: Colors.white,
//     iconColor: Colors.white,
//     link: topMate,
//   ),
//   AppModel(
//       title: "Experience",
//       backgroundColor: Colors.white,
//       icon: FontAwesomeIcons.idBadge,
//       iconColor: Colors.white,
//       screen: const Experience()),
//   AppModel(
//     title: "Education",
//     backgroundColor: Colors.white,
//     iconColor: Colors.white,
//     icon: FontAwesomeIcons.edge,
//     screen: const Education(),
//   ),
//   AppModel(
//     title: "Github",
//     assetPath: "assets/icons/github.png",
//     backgroundColor: Colors.white,
//     iconColor: Colors.white,
//     link: github,
//   ),
//   AppModel(
//     title: "PayME",
//     assetPath: "assets/images/logo_icon.png",
//     backgroundColor: Colors.black,
//     iconColor: Colors.white,
//     screen: GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: PayMeAppTheme.lightTheme,
//       darkTheme: PayMeAppTheme.darkTheme,
//       themeMode: ThemeMode.dark,
//       navigatorKey: paymeNavigationKey,
//       home: const AuthView(),
//     ),
//   ),
//   AppModel(
//     title: "Play Store",
//     assetPath: "assets/icons/playstore.png",
//     backgroundColor: Colors.white,
//     iconColor: Colors.white,
//     link: playApps,
//   ),
// ];

final List<JobExperience> education = [
  JobExperience(
    color: Colors.red,
    location: "Bhopal, Madhya Prafesh",
    title: 'Computer Science Engineering',
    company: 'VIT Bhopal University',
    startDate: 'June 2021',
    endDate: 'Present',
    bulletPoints: [
      "Currently in the final year of my college!",
      "Most productive years of my life"
    ],
  ),
  JobExperience(
    color: Colors.blue,
    location: "Etah, Uttar Pradesh",
    title: '10 + 2',
    company: 'St. Paul\'s Sr. Sec. School',
    startDate: 'June 2017',
    endDate: 'June 2021',
    bulletPoints: [
      'Stressed years of my life',
    ],
  ),
  JobExperience(
    color: Colors.blue,
    location: "Etah, Uttar Pradesh",
    title: '10th',
    company: 'St. Paul\'s Sr. Sec. School',
    startDate: 'June 2016',
    endDate: 'June 2017',
    bulletPoints: [
      'Best year of college life',
    ],
  ),
];

final List<JobExperience> jobExperiences = [
  JobExperience(
    color: Colors.blue,
    location: "Bhopal, India",
    title: 'Tech Lead',
    company: 'PayME Fintech',
    startDate: 'Sep 2024',
    endDate: 'Dec 2024',
    bulletPoints: [
      "Build UI/UX from scratch and frontend",
      "Did API intigration for functional UI.",
      "Took part in invester pitch to present Technical aspacts of Payme",
      "Hosted and managed beta launch for PayMe payment mobile app.",
      "It is a baby startup",
    ],
  ),
  // Add more job experiences here...
  JobExperience(
    color: Colors.redAccent,
    location: "Remote",
    title: 'Flutter Developer Intern',
    company: 'Memoneet',
    startDate: 'Oct 2022',
    endDate: 'Jan 2023',
    bulletPoints: [
      "worked on removing bugs and building UI for Provided UX and making enhancements according to users feedback",
    ],
  ),
  JobExperience(
    color: Colors.orangeAccent,
    location: "Remote",
    title: 'Technical And Marketing Intern',
    company: 'PLnX World Pvt. Ltd.',
    startDate: 'Sep 2023',
    endDate: 'Apr 2024',
    bulletPoints: [
      "Revamped codebase by integrating theme colors in place of hard-coded colors, ensuring uniformity across 50+ screens, which boosted user satisfaction by 20% and improved overall app aesthetics.",
      "Enhanced layout for both user and vendor apps across various devices, improving user experience ratings by 15%.",
      "Developed a video selector, editor, and compressor reducing video size up to 40% less.",
    ],
  ),
  JobExperience(
    color: Colors.greenAccent,
    location: "Remote",
    title: 'SDE Intern',
    company: 'Shortsqueeze',
    startDate: 'Dec 2022',
    endDate: 'Apr 2023',
    bulletPoints: [
      "Assisted in developing the front end of 3 mobile applications using Dart and the Flutter framework. Inspire Manak - Managed 30+ screens, achieving 100k+ downloads and a 4.2 rating on the Play Store. Racing Line - Created 20+ screens and is unreleased. Podium Pay - Designed 10+ screens with animations, pending release.",
      "Worked on a PDF generating feature in the Inspire Manak App, facilitating document generation for 50k+ users.",
      "Engineered 40+ interactive and responsive screens featuring seamless animations, leading to a 30% increase in user interaction and a 20% boost in session duration.",
      "Implemented AES encryption for secure OTP transactions, increasing security by about 25%.",
      "Achieved Security Audit certification for the Inspire Manak App by implementing rigorous security protocols; enhanced app security resulting in a 40% reduction in vulnerability threats and improved user trust.",
    ],
  ),
  // JobExperience(
  //   color: Colors.black,
  //   location: "Remote",
  //   title: 'Flutter App Intern',
  //   company: 'Cogent Web Services',
  //   startDate: 'Dec 2020',
  //   endDate: 'June 2021',
  //   bulletPoints: [
  //     "Developed a mobile application alternative to Splitwise, enabling unlimited expense splits and personal expense tracking, with over 100 users tracking their bills.",
  //     "Integrated Gemini API for contextual chatting, enhancing money management features, resulting in a 20% increase in user engagement.",
  //     "Implemented Firebase Authentication, Firestore, and Storage bucket services, improving app reliability and reducing backend maintenance time by 15%.",
  //   ],
  // ),
];

// const String youtubeChannel = "https://www.youtube.com/@highcoder";
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
