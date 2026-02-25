import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/portfolio_data.dart';
import '../../../../theme/glass_theme.dart';
import '../../../../widget/custom_text_view.dart';
import '../../controller/home_controller.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Drawer(
      width: 280,
      backgroundColor: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.94),
            border: const Border(left: BorderSide(color: Colors.white12)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 100),
              _drawerItem(PortfolioData.navHome, controller.heroKey),
              _drawerItem(PortfolioData.navAbout, controller.aboutKey),
              _drawerItem(
                PortfolioData.navExperience,
                controller.experienceKey,
              ),
              _drawerItem(PortfolioData.navProjects, controller.projectsKey),
              _drawerItem(PortfolioData.navContact, controller.contactKey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(String text, GlobalKey key) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      title: CustomTextView(
        text: text.toUpperCase(),
        style: GlassTheme.h3.copyWith(
          letterSpacing: 3,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
      onTap: () {
        Get.back();
        Get.find<HomeController>().scrollToSection(key);
      },
    );
  }
}
