import 'package:flutter/material.dart';
import '../../../../theme/glass_theme.dart';
import '../../../../widget/custom_text_view.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextView(
          text: title.toUpperCase(),
          style: GlassTheme.h1.copyWith(
            fontSize: isMobile ? 32 : 48,
            letterSpacing: 4,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: 80,
          height: 5,
          decoration: BoxDecoration(
            gradient: GlassTheme.primaryGradient,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}
