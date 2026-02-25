import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../theme/glass_theme.dart';
import '../../../../widget/custom_text_view.dart';
import '../../controller/home_controller.dart';

class PremiumLogo extends StatelessWidget {
  const PremiumLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => controller.scrollToSection(controller.heroKey),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [
                      GlassTheme.primaryColor,
                      GlassTheme.secondaryColor,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: GlassTheme.primaryColor.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: CustomTextView(
                    text: "K",
                    style: GlassTheme.h3.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextView(
                    text: "KRUNAL",
                    style: GlassTheme.h3.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                  CustomTextView(
                    text: "MOBILE TEAM LEAD",
                    style: GlassTheme.body.copyWith(
                      color: Colors.white.withValues(alpha: 0.5),
                      fontSize: 8,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
