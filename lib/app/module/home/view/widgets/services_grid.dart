import 'package:flutter/material.dart';
import '../../../../data/portfolio_data.dart';
import '../../../../theme/glass_theme.dart';
import '../../../../widget/custom_text_view.dart';
import '../../../../widget/glass_container.dart';

class ServicesGrid extends StatelessWidget {
  final bool isDesktop;
  final bool isMobile;
  final double hPadding;

  const ServicesGrid({
    super.key,
    required this.isDesktop,
    required this.isMobile,
    required this.hPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: PortfolioData.services.map((item) {
        return SizedBox(
          width: isDesktop
              ? (MediaQuery.of(context).size.width -
                        (hPadding * 2) -
                        (24 * 3)) /
                    4
              : isMobile
              ? double.infinity
              : (MediaQuery.of(context).size.width - (hPadding * 2) - 24) / 2,
          child: GlassContainer(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(item.icon, color: GlassTheme.secondaryColor, size: 36),
                const SizedBox(height: 24),
                CustomTextView(
                  text: item.title,
                  style: GlassTheme.h3.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                CustomTextView(
                  text: item.description,
                  style: GlassTheme.body.copyWith(
                    fontSize: 13,
                    color: Colors.white54,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
