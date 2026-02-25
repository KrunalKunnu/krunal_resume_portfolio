import 'package:flutter/material.dart';

class ServiceItem {
  final String title;
  final String description;
  final IconData icon;

  ServiceItem({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class PluginItem {
  final String name;
  final String description;
  final String url;

  PluginItem({
    required this.name,
    required this.description,
    required this.url,
  });
}

class ProjectItem {
  final String title;
  final String description;
  final String techStack;
  final String? androidUrl;
  final String? iosUrl;
  final String? webUrl;
  final String? myRole;

  ProjectItem({
    required this.title,
    required this.description,
    required this.techStack,
    this.androidUrl,
    this.iosUrl,
    this.webUrl,
    this.myRole,
  });
}

class ExperienceItem {
  final String role;
  final String company;
  final String location;
  final String duration;
  final List<String> highlights;

  ExperienceItem({
    required this.role,
    required this.company,
    required this.location,
    required this.duration,
    required this.highlights,
  });
}

class EducationItem {
  final String degree;
  final String institution;
  final String location;
  final String year;

  EducationItem({
    required this.degree,
    required this.institution,
    required this.location,
    required this.year,
  });
}

class SocialItem {
  final IconData icon;
  final String url;
  final String label;

  SocialItem({required this.icon, required this.url, required this.label});
}

class PortfolioData {
  static const String name = "KRUNAL PUJARA";
  static const String email = "kpujara27@gmail.com";
  static const String phone = "8460896891";
  static const String location = "Ahmedabad, Gujarat";
  static const String resumeUrl = "assets/resume.pdf";
  static const String hireMeEmail = "mailto:kpujara27@gmail.com";

  static const String aboutTitle = "Professional Summary";
  static const String experienceTitle = "Work History";
  static const String projectsTitle = "Application Projects";
  static const String skillsTitle = "Technical Skills";
  static const String contactTitle = "Contact Me";
  static const String pluginsTitle = "Achievements & Leadership";
  static const String educationTitle = "Education";
  static const String whatIDo = "Expertise";

  static const String navHome = "Home";
  static const String navAbout = "About";
  static const String navExperience = "Experience";
  static const String navProjects = "Projects";
  static const String navContact = "Contact";

  static const String heroIntro = "I AM";
  static const String heroTitle = "Mobile Team Lead";
  static const String heroBio =
      "Lead Mobile Software Engineer with 9.5+ years of experience building scalable, high-performance Android applications using Kotlin and Java, delivering measurable customer and business outcomes. Proven track record of leading cross-functional teams, driving DevSecOps-enabled CI/CD automation, and ensuring code integrity across the full SDLC.";
  static const String resumeButtonText = "Download Resume";
  static const String hireMeButtonText = "Hire Me";

  static final List<String> rotatingTitles = [
    "Android Developer",
    "Mobile Team Lead",
    "Kotlin & Java Expert",
    "CI/CD Engineer",
  ];

  static const String aboutDesc =
      "Lead Mobile Software Engineer with 9.5+ years of experience building scalable, high-performance Android applications using Kotlin and Java, delivering measurable customer and business outcomes. Proven track record of leading cross-functional teams, driving DevSecOps-enabled CI/CD automation, and ensuring code integrity across the full SDLC. Strong technical advocate who translates complex business needs into lean, secure, and maintainable solutions. Committed to fostering engineering excellence, accelerating product delivery, and maximizing ROI on technology investments.";

  static final List<String> skillTags = [
    "Android SDK · Kotlin · Java",
    "iOS Development (Swift – foundational)",
    "Flutter (foundational)",
    "MVVM · MVC · Clean Architecture",
    "SOLID Principles & Design Patterns",
    "Microservices Integration",
    "RESTful APIs & GraphQL",
    "WebSocket · Socket.IO",
    "Firebase (Auth, Firestore, Cloud Functions)",
    "Google Cloud Platform · AWS (Foundational)",
    "CI/CD (GitHub Actions, Fastlane)",
    "Unit Testing & Code Reviews",
    "Deep Linking · Push Notifications (FCM, APNs)",
    "In-App Purchases · AdMob",
    "Payment Gateways (Stripe, PayPal, Razorpay)",
    "Social Login (Google, Facebook, Apple)",
    "Real-time Communication (Agora SDK, WebRTC)",
    "SQLite · Secure Coding Practices",
    "Google Play Console · TestFlight",
    "Git (GitHub, GitLab, Bitbucket)",
    "JIRA · Agile & Scrum Practices",
    "AI-Assisted Development (Claude Code, ChatGPT)",
  ];

  static final List<ServiceItem> services = [
    ServiceItem(
      title: "Android Engineering",
      description:
          "Building high-performance, scalable native Android applications using Kotlin and Java with clean architecture principles.",
      icon: Icons.android_rounded,
    ),
    ServiceItem(
      title: "Architecture & Design",
      description:
          "Designing maintainable MVVM/Clean Architecture systems with SOLID principles, modular structure, and code governance.",
      icon: Icons.architecture_rounded,
    ),
    ServiceItem(
      title: "DevSecOps & CI/CD",
      description:
          "Automating build and release pipelines using GitHub Actions and Fastlane, with unit testing and code profiling for quality assurance.",
      icon: Icons.auto_mode_rounded,
    ),
    ServiceItem(
      title: "Team Leadership",
      description:
          "Leading and mentoring cross-functional engineering teams, conducting code reviews, sprint planning, and driving Agile best practices.",
      icon: Icons.groups_rounded,
    ),
  ];

  static final List<ExperienceItem> experience = [
    ExperienceItem(
      role: "Mobile Team Lead",
      company: "Sapphire Software Solutions",
      location: "Ahmedabad",
      duration: "October 2018 - Present",
      highlights: [
        "Led and mentored 20+ mobile engineers, delivering scalable Android and Flutter applications, increasing team productivity by 30% and accelerating time-to-market.",
        "Owned end-to-end SDLC (requirement analysis to production deployment), ensuring 100% on-time delivery and improving sprint velocity by 25%.",
        "Implemented Clean Architecture, code governance, and CI/CD automation, achieving 95%+ code quality and reducing production defects by 35%.",
        "Reduced development cycle time by 40% through reusable frameworks and AI-assisted engineering tools, decreasing technical debt and increasing ROI.",
      ],
    ),
    ExperienceItem(
      role: "Android Developer",
      company: "Tailored Solutions Pvt. Ltd.",
      location: "Ahmedabad",
      duration: "January 2018 - September 2018",
      highlights: [
        "Developed high-performance native Android applications (Java, Kotlin), achieving 85.0% crash-free rate, improving app stability and boosting customer retention.",
        "Implemented MVVM and modular architecture, enhancing app responsiveness by 35%, resulting in improved user experience and higher engagement metrics.",
        "Integrated RESTful APIs, payment gateways (Stripe, Razorpay), and cloud services, enabling secure digital transactions and expanding revenue-generating capabilities.",
        "Collaborated with cross-functional product, QA, and backend teams to accelerate delivery cycles by 20%, reducing time-to-market and increasing client satisfaction.",
      ],
    ),
    ExperienceItem(
      role: "Jr. Android Developer",
      company: "Nascent Info Pvt. Ltd.",
      location: "Ahmedabad",
      duration: "May 2016 – December 2017",
      highlights: [
        "Built 3+ Android applications for startup clients across e-commerce, logistics, and service-based business domains.",
        "Gained hands-on experience with Android SDK, REST APIs, JSON parsing, and SQLite database management.",
        "Collaborated with UI/UX designers to implement intuitive and responsive Material Design user interfaces.",
      ],
    ),
  ];

  static final List<ProjectItem> projects = [
    ProjectItem(
      title: "Vidyalaya - All-In-One School Management App (Android)",
      description:
          "A multi-role school management mobile application that allows students, teachers, and administrators to manage attendance, exams, fees, communication, and role-based dashboards. Supports real-time updates, secure transactions, and customizable modules for different schools through white-label deployments.",
      techStack:
          "Native Android (Kotlin) · Firebase (Push Notifications & Crashlytics) · REST APIs · Multiple Payment Gateway Integrations (6–7 providers)",
      androidUrl:
          "https://play.google.com/store/apps/details?id=com.vidyalaya.vidyalayaapp",
      myRole:
          "Led end-to-end ownership of the Native Android product, responsible for maintaining and enhancing core modules, resolving production issues, improving Firebase crash-free rates, implementing new features aligned with evolving client requirements, and ensuring stable multi-client (white-label) Play Store releases.",
    ),
    ProjectItem(
      title: "FriendWe (Android)",
      description:
          "A native Android dating application that enables users to meet and connect with new people nearby, discover potential matches, chat in real-time, and interact through personalized profiles, geolocation features, and secure in-app subscriptions.",
      techStack:
          "Native Android (Kotlin) · Firebase (Push Notifications, Realtime Chat, Crashlytics) · REST APIs · Stripe · In-App Subscriptions · AWS Face Recognition · Google Maps",
      androidUrl:
          "https://play.google.com/store/apps/details?id=com.terrietie.usersnew",
      myRole:
          "Maintained and enhanced the product, implemented new features/modules, improved Firebase crash scores, and optimized app performance, increasing user engagement, retention, and app adoption, contributing to client revenue growth.",
    ),
    ProjectItem(
      title: "Beauty INKstitute – Continuous Learning & Skill Development App (Android)",
      description:
          "A native Android application designed as a continuous education platform for permanent makeup and tattooing, offering bite-sized tutorials, progress tracking, gamified learning, and a community for artists.",
      techStack:
          "Native Android (Kotlin) · MVVM Architecture · REST APIs · Firebase (Push Notifications, Crashlytics) · Video Integration like Instagram reels",
      androidUrl:
          "https://play.google.com/store/apps/details?id=com.beautyinkstitute",
      myRole:
          "Built and maintained the product, implemented key features and workflows, optimized UI performance, handled bug fixes, and ensured scalable, maintainable, and testable code.",
    ),
    ProjectItem(
      title: "Hello Queen – Pre-Owned Formal Wear Marketplace (Flutter)",
      description:
          "A Flutter-based mobile marketplace app for pre-owned formal wear, allowing users to buy and sell products seamlessly, with integrated payments, user profiles, and order tracking.",
      techStack:
          "Flutter (GetX Architecture) · REST APIs · Firebase (Push Notifications, Realtime Database) · Stripe · Social Sharing",
      androidUrl:
          "https://play.google.com/store/apps/details?id=com.helloqueen",
      iosUrl:
          "https://apps.apple.com/us/app/hello-queen/id6755137018",
      myRole:
          "Led end-to-end project delivery, coordinated development team, implemented scalable and maintainable features, managed deployments, and ensured timely delivery with ongoing product improvements.",
    ),
    ProjectItem(
      title: "Hobi – Expressive Art Therapy & Wellness App (Flutter)",
      description:
          "A Flutter mobile app focused on expressive art therapy and wellness, enabling users to engage in creative activities, track mental wellness, and interact with supportive communities.",
      techStack:
          "Flutter · Native Android (Kotlin) · MVVM Architecture · REST APIs · Firebase (Push Notifications, Crashlytics) · Play Store & App Store Deployment",
      androidUrl:
          "https://play.google.com/store/apps/details?id=com.hobi&hl=en",
      iosUrl:
          "https://apps.apple.com/us/app/hobi-expressive-art-therapy/id1575216387",
      myRole:
          "Took over existing project, stabilized architecture, fixed critical bugs, implemented new features, optimized performance, and provided long-term maintenance to improve user engagement and retention.",
    ),
    ProjectItem(
      title: "Adani Emcare",
      description:
          "Enterprise occupational health and safety application built for Adani Group, providing comprehensive employee health monitoring and digital medical records.",
      techStack: "Native Android · Firebase · REST APIs",
      androidUrl:
          "https://play.google.com/store/apps/details?id=com.occucare.adani&hl=en_IN",
    ),
    ProjectItem(
      title: "Luke - Patient App",
      description:
          "Telemedicine platform allowing patients to book consultations (in-person, home, or virtual). Features direct doctor payments and flexible scheduling.",
      techStack: "Native Android · Maps · Telemedicine",
      androidUrl:
          "https://play.google.com/store/apps/details?id=com.luke.patient",
    ),
    ProjectItem(
      title: "Kyklaminon",
      description:
          "Event booking and social platform for a multiuse space. Features event discovery, party reservations, real-time notifications, and social invites.",
      techStack: "Native Android · Booking · Firebase",
      androidUrl:
          "https://play.google.com/store/apps/details?id=com.kyklaminon",
    ),
    ProjectItem(
      title: "MemoriPlay",
      description:
          "A memory and fun-focused mobile application delivering engaging games and experiences for users of all ages.",
      techStack: "Native Android · Gaming · Firebase",
      androidUrl:
          "https://play.google.com/store/apps/details?id=com.memoriplayapp",
    ),
    ProjectItem(
      title: "Forage Fox",
      description:
          "A foraging and nature discovery app connecting outdoor enthusiasts with nature-based community features.",
      techStack: "Native Android · Maps · Community",
      androidUrl:
          "https://play.google.com/store/apps/details?id=com.forage.fox",
    ),
    ProjectItem(
      title: "KSTA News",
      description:
          "A regional news platform delivering the latest local and international news stories to users in real time.",
      techStack: "Native Android · News Feed · Firebase",
      androidUrl:
          "https://play.google.com/store/apps/details?id=de.dumont.ksta.android&hl=en_IN",
    ),
    ProjectItem(
      title: "Stride",
      description:
          "A fitness and activity tracking app that helps users set goals, track progress, and stay motivated.",
      techStack: "Native Android · Health · Firebase",
      androidUrl:
          "https://play.google.com/store/apps/details?id=com.stride.app",
    ),
    ProjectItem(
      title: "ReApp – The Real Estate App",
      description:
          "Property listing, advanced search, detailed views, and user inquiry management for buying and renting real estate.",
      techStack: "Native Android · Google Maps · Firebase",
      androidUrl:
          "https://play.google.com/store/apps/details?id=com.reapp.reapp",
    ),
  ];

  static final List<PluginItem> plugins = [
    PluginItem(
      name: "25+ Mobile Apps Deployed",
      description:
          "Successfully deployed 25+ mobile applications on Google Play and Apple App Store, achieving high user satisfaction and contributing to client retention and revenue growth.",
      url: "",
    ),
    PluginItem(
      name: "Team Leadership",
      description:
          "Mentored and led a team of 20+ developers, implementing Agile practices, code reviews, and sprint planning, increasing team productivity by 30%.",
      url: "",
    ),
    PluginItem(
      name: "Performance Optimization",
      description:
          "Improved app performance by 40% and reduced crashes by 60% through optimization and best practices, enhancing product reliability and user engagement.",
      url: "",
    ),
    PluginItem(
      name: "AI-Assisted Development",
      description:
          "Pioneered AI-assisted development tools (Claude Code, ChatGPT, Antigravity), reducing development cycle time by 40%, accelerating time-to-market for clients.",
      url: "",
    ),
    PluginItem(
      name: "CI/CD & Automated Testing",
      description:
          "Established CI/CD pipelines and automated testing frameworks, improving release efficiency by 50%, reducing production issues, and lowering maintenance costs.",
      url: "",
    ),
    PluginItem(
      name: "Lead of the Quarter (2023)",
      description:
          "Recognized as Lead of the Quarter (2023) for outstanding contribution to project delivery and team leadership.",
      url: "",
    ),
  ];

  static final List<EducationItem> education = [
    EducationItem(
      degree: "M.Sc. Mobile Application",
      institution: "Gujarat University",
      location: "Ahmedabad",
      year: "2016 | CGPA: 7.5/10",
    ),
  ];

  static final List<SocialItem> socials = [
    SocialItem(
      icon: Icons.business_center_rounded,
      url: "https://www.linkedin.com/in/krunal-pujara-669395a6",
      label: "LinkedIn",
    ),
    SocialItem(
      icon: Icons.alternate_email_rounded,
      url: "mailto:kpujara27@gmail.com",
      label: "Email",
    ),
    SocialItem(
      icon: Icons.phone_rounded,
      url: "tel:+918460896891",
      label: "Phone",
    ),
  ];

  static const String contactDesc =
      "Lead Mobile Software Engineer with 9.5+ years of experience building scalable Android applications. I am passionate about engineering excellence, mentoring teams, and delivering high-impact mobile solutions. Let's build something great together.";
}
