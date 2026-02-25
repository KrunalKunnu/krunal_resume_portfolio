import 'package:flutter/material.dart';
import '../../../../data/portfolio_data.dart';
import '../../../../theme/glass_theme.dart';
import '../../../../widget/custom_text_view.dart';

class Footer extends StatelessWidget {
  final double hPadding;

  const Footer({super.key, required this.hPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 80),
      child: Column(
        children: [
          const Divider(color: Colors.white12),
          const SizedBox(height: 48),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 24,
            runSpacing: 12,
            children: [
              CustomTextView(
                text: "© 2026 ${PortfolioData.name}",
                style: GlassTheme.body.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white24,
                  letterSpacing: 2,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const FlutterLogo(size: 16),
                  const SizedBox(width: 8),
                  CustomTextView(
                    text: "MADE WITH FLUTTER",
                    style: GlassTheme.body.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: Colors.white24,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
