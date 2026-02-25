import 'package:flutter/material.dart';
import 'app_text_style.dart';

class GlassTheme {
  static const Color primaryColor = Color(0xFF8B5CF6);
  static const Color secondaryColor = Color(0xFF06B6D4);
  static const Color accentColor = Color(0xFFF472B6);

  static const Color backgroundColor = Color(0xFF030712);
  static const Color surfaceColor = Color(0xFF111827);

  static Color glassWhite = Colors.white.withValues(alpha: 0.12);
  static Color glassBlack = Colors.black.withValues(alpha: 0.5);
  static Color glassBorder = Colors.white.withValues(alpha: 0.1);

  static const Color textColor = Colors.white;
  static const Color textColorSecondary = Color(0xFF9CA3AF);

  // Gradients that feel "expensive"
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, secondaryColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient liquidGradient = LinearGradient(
    colors: [primaryColor, accentColor],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static LinearGradient cardGradient({bool isHovered = false}) =>
      LinearGradient(
        colors: [
          Colors.white.withValues(alpha: isHovered ? 0.15 : 0.08),
          Colors.white.withValues(alpha: isHovered ? 0.05 : 0.02),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static TextStyle get h1 =>
      AppTextStyle.bold(size: 56, color: textColor, letterSpacing: -1.5);

  static TextStyle get h2 =>
      AppTextStyle.semiBold(size: 36, color: textColor, letterSpacing: -0.5);

  static TextStyle get h3 => AppTextStyle.semiBold(size: 22, color: textColor);

  static TextStyle get body =>
      AppTextStyle.regular(size: 17, color: textColorSecondary, height: 1.6);

  static TextStyle get navLink =>
      AppTextStyle.medium(size: 15, color: textColor);

  static TextStyle get caption =>
      AppTextStyle.regular(size: 14, color: textColorSecondary);

  static TextStyle get tag =>
      AppTextStyle.semiBold(size: 12, color: secondaryColor);
}
