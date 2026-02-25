import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/portfolio_data.dart';
import '../../../../theme/glass_theme.dart';
import '../../../../widget/custom_text_view.dart';
import '../../../../widget/glass_container.dart';
import '../../controller/home_controller.dart';
import '../widgets/section_title.dart';
import '../widgets/services_grid.dart';

class AboutSection extends StatelessWidget {
  final bool isDesktop;
  final bool isMobile;
  final double hPadding;

  const AboutSection({
    super.key,
    required this.isDesktop,
    required this.isMobile,
    required this.hPadding,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Container(
      key: controller.aboutKey,
      padding: EdgeInsets.symmetric(
        horizontal: hPadding,
        vertical: isMobile ? 60 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: PortfolioData.aboutTitle),
          const SizedBox(height: 40),
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: AboutTextCard()),
                SizedBox(width: 60),
                Expanded(flex: 2, child: SkillsGrid()),
              ],
            )
          else
            Column(
              children: [AboutTextCard(), SizedBox(height: 40), SkillsGrid()],
            ),
          const SizedBox(height: 56),
          ServicesGrid(
            isDesktop: isDesktop,
            isMobile: isMobile,
            hPadding: hPadding,
          ),
        ],
      ),
    );
  }
}

class AboutTextCard extends StatelessWidget {
  const AboutTextCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return GlassContainer(
      padding: EdgeInsets.all(isMobile ? 32 : 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextView(
            text: PortfolioData.aboutDesc,
            style: GlassTheme.body.copyWith(
              fontSize: isMobile ? 16 : 18,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 56),
          Row(
            children: [
              StatItem(val: "9.5+", lab: "YEARS EXP"),
              StatItem(val: "16+", lab: "PROJECTS"),
              StatItem(val: "100%", lab: "SUCCESS"),
            ],
          ),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String val, lab;
  const StatItem({super.key, required this.val, required this.lab});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextView(
            text: val,
            style: GlassTheme.h2.copyWith(
              color: GlassTheme.primaryColor,
              fontWeight: FontWeight.w900,
              fontSize: isMobile ? 24 : 32,
            ),
          ),
          CustomTextView(
            text: lab,
            style: GlassTheme.body.copyWith(
              fontSize: isMobile ? 9 : 11,
              fontWeight: FontWeight.bold,
              color: Colors.white38,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class SkillsGrid extends StatelessWidget {
  const SkillsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: PortfolioData.skillTags.map((skill) {
        return GlassContainer(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          borderRadius: 10,
          color: Colors.white.withValues(alpha: 0.03),
          child: CustomTextView(
            text: skill,
            style: GlassTheme.body.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
        );
      }).toList(),
    );
  }
}
