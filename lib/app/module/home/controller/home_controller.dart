import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/portfolio_data.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final RxDouble scrollOffset = 0.0.obs;
  final RxInt rotatingIndex = 0.obs;
  Timer? _timer;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  final RxString activeSection = 'Home'.obs;

  bool _isManualScrolling = false;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      scrollOffset.value = scrollController.offset;
      if (!_isManualScrolling) _updateActiveSection();
    });

    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      rotatingIndex.value =
          (rotatingIndex.value + 1) % PortfolioData.rotatingTitles.length;
    });
  }

  void _updateActiveSection() {
    final sections = {
      PortfolioData.navHome: heroKey,
      PortfolioData.navAbout: aboutKey,
      PortfolioData.navExperience: experienceKey,
      PortfolioData.navProjects: projectsKey,
      PortfolioData.navContact: contactKey,
    };

    String? currentSection;
    double maxVisibleArea = -1.0;

    sections.forEach((name, key) {
      final context = key.currentContext;
      if (context != null) {
        final renderBox = context.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero).dy;
        final height = renderBox.size.height;
        final viewportHeight = Get.height;

        final visibleTop = position.clamp(0.0, viewportHeight);
        final visibleBottom = (position + height).clamp(0.0, viewportHeight);
        final visibleHeight = visibleBottom - visibleTop;

        if (visibleHeight > maxVisibleArea) {
          maxVisibleArea = visibleHeight;
          currentSection = name;
        }
      }
    });

    if (currentSection != null && activeSection.value != currentSection) {
      activeSection.value = currentSection!;
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    _timer?.cancel();
    super.onClose();
  }

  void scrollToSection(GlobalKey key) {
    _isManualScrolling = true;

    if (key == heroKey) activeSection.value = PortfolioData.navHome;
    if (key == aboutKey) activeSection.value = PortfolioData.navAbout;
    if (key == experienceKey) activeSection.value = PortfolioData.navExperience;
    if (key == projectsKey) activeSection.value = PortfolioData.navProjects;
    if (key == contactKey) activeSection.value = PortfolioData.navContact;

    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      ).then((_) => _isManualScrolling = false);
    } else {
      _isManualScrolling = false;
    }
  }
}
