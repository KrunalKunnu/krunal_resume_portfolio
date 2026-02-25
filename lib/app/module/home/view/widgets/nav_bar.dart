import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/portfolio_data.dart';
import '../../../../theme/glass_theme.dart';
import '../../../../widget/custom_text_view.dart';
import '../../../../widget/glass_container.dart';
import '../../controller/home_controller.dart';
import 'premium_logo.dart';
import 'mobile_menu_trigger.dart';

class NavBar extends StatelessWidget {
  final bool isDesktop;
  final bool isMobile;
  final double hPadding;

  const NavBar({
    super.key,
    required this.isDesktop,
    required this.isMobile,
    required this.hPadding,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(() {
      final isScrolled = controller.scrollOffset.value > 50;
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(
          horizontal: hPadding,
          vertical: isScrolled ? 10 : 20,
        ),
        decoration: BoxDecoration(
          color: isScrolled
              ? Colors.black.withValues(alpha: 0.8)
              : Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: isScrolled
                  ? Colors.white.withValues(alpha: 0.05)
                  : Colors.transparent,
              width: 1,
            ),
          ),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: isScrolled ? 10 : 0,
              sigmaY: isScrolled ? 10 : 0,
            ),
            child: isDesktop
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const PremiumLogo(),
                      const Spacer(),
                      GlassContainer(
                        enableHover: false,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 8,
                        ),
                        borderRadius: 40,
                        color: Colors.white.withValues(alpha: 0.03),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _navItem(PortfolioData.navHome, controller.heroKey),
                            _navItem(
                              PortfolioData.navAbout,
                              controller.aboutKey,
                            ),
                            _navItem(
                              PortfolioData.navExperience,
                              controller.experienceKey,
                            ),
                            _navItem(
                              PortfolioData.navProjects,
                              controller.projectsKey,
                            ),
                            _navItem(
                              PortfolioData.navContact,
                              controller.contactKey,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      // Add a small fixed width to balance the logo if needed, or just Spacer is enough.
                      // Removed the arbitrary SizedBox(width: 50) that might cause overflow.
                    ],
                  )
                : Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 10,
                    children: [const PremiumLogo(), const MobileMenuTrigger()],
                  ),
          ),
        ),
      );
    });
  }

  Widget _navItem(String title, GlobalKey key) {
    final controller = Get.find<HomeController>();
    return Obx(() {
      final isActive = controller.activeSection.value == title;
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => controller.scrollToSection(key),
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: CustomTextView(
              text: title.toUpperCase(),
              style: GlassTheme.body.copyWith(
                color: isActive
                    ? GlassTheme.textColor
                    : GlassTheme.textColorSecondary.withValues(alpha: 0.7),
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w800 : FontWeight.w500,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      );
    });
  }
}
