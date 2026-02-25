import 'package:flutter/material.dart';
import '../../../../data/portfolio_data.dart';
import '../../../../theme/glass_theme.dart';
import '../../../../widget/custom_text_view.dart';
import '../../../../widget/glass_container.dart';
import '../widgets/section_title.dart';

class EducationSection extends StatelessWidget {
  final bool isDesktop;
  final bool isMobile;
  final double hPadding;

  const EducationSection({
    super.key,
    required this.isDesktop,
    required this.isMobile,
    required this.hPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: hPadding,
        vertical: isMobile ? 100 : 140,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: PortfolioData.educationTitle),
          const SizedBox(height: 40),
          ...PortfolioData.education.map(
            (edu) => GlassContainer(
              margin: EdgeInsets.only(bottom: isMobile ? 12 : 16),
              padding: EdgeInsets.all(isMobile ? 24 : 40),
              child: Row(
                children: [
                  Icon(
                    Icons.school_rounded,
                    color: GlassTheme.primaryColor,
                    size: isMobile ? 32 : 48,
                  ),
                  SizedBox(width: isMobile ? 24 : 40),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextView(
                          text: edu.degree,
                          style: GlassTheme.h3.copyWith(
                            fontSize: isMobile ? 18 : 24,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        CustomTextView(
                          text: "${edu.institution} • ${edu.year}",
                          style: GlassTheme.body.copyWith(
                            color: GlassTheme.secondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 12 : 14,
                          ),
                        ),
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
