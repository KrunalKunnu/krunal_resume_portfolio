import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/portfolio_data.dart';
import '../../../../theme/glass_theme.dart';
import '../../../../widget/custom_text_view.dart';
import '../../../../widget/glass_container.dart';
import '../../controller/home_controller.dart';
import '../widgets/section_title.dart';

class ExperienceSection extends StatelessWidget {
  final bool isDesktop;
  final bool isMobile;
  final double hPadding;

  const ExperienceSection({
    super.key,
    required this.isDesktop,
    required this.isMobile,
    required this.hPadding,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Container(
      key: controller.experienceKey,
      padding: EdgeInsets.symmetric(
        horizontal: hPadding,
        vertical: isMobile ? 60 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: PortfolioData.experienceTitle),
          const SizedBox(height: 40),
          ...PortfolioData.experience.map(
            (exp) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isMobile) ...[
                    Column(
                      children: [
                        const Icon(
                          Icons.circle,
                          color: GlassTheme.primaryColor,
                          size: 16,
                        ),
                        Container(
                          width: 2,
                          height: 100,
                          color: GlassTheme.primaryColor.withValues(alpha: 0.1),
                        ),
                      ],
                    ),
                    const SizedBox(width: 32),
                  ],
                  Expanded(
                    child: GlassContainer(
                      padding: EdgeInsets.all(isMobile ? 24 : 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flex(
                            direction: isMobile
                                ? Axis.vertical
                                : Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: isMobile ? 0 : 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextView(
                                      text: exp.role,
                                      style: GlassTheme.h3.copyWith(
                                        fontSize: isMobile ? 20 : 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                    CustomTextView(
                                      text: exp.company,
                                      style: GlassTheme.body.copyWith(
                                        color: GlassTheme.secondaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (isMobile) const SizedBox(height: 8),
                              CustomTextView(
                                text: exp.duration,
                                style: GlassTheme.body.copyWith(
                                  fontSize: 14,
                                  color: Colors.white38,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: isMobile ? 20 : 24),
                          ...exp.highlights.map(
                            (h) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Icon(
                                      Icons.circle,
                                      size: 6,
                                      color: GlassTheme.primaryColor,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: CustomTextView(
                                      text: h,
                                      style: GlassTheme.body.copyWith(
                                        fontSize: isMobile ? 14 : 16,
                                        height: 1.6,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
