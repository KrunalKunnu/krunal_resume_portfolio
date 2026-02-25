import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'font_family.dart';

class AppTextStyle {
  static TextStyle _base({
    required double size,
    required String fontFamily,
    Color color = Colors.black,
    double? height,
    FontWeight? weight,
    TextOverflow? overflow,
    TextDecoration? decoration,
    double? letterSpacing,
    TextDecorationStyle? decorationStyle,
    Color? decorationColor,
    FontStyle? fontStyle,
  }) {
    // Map FontFamily to GoogleFonts
    TextStyle googleFontStyle;
    if (fontFamily == FontFamily.regular.value) {
      googleFontStyle = GoogleFonts.inter(fontWeight: FontWeight.w400);
    } else if (fontFamily == FontFamily.medium.value) {
      googleFontStyle = GoogleFonts.inter(fontWeight: FontWeight.w500);
    } else if (fontFamily == FontFamily.semiBold.value) {
      googleFontStyle = GoogleFonts.poppins(fontWeight: FontWeight.w600);
    } else if (fontFamily == FontFamily.bold.value) {
      googleFontStyle = GoogleFonts.poppins(fontWeight: FontWeight.bold);
    } else if (fontFamily == FontFamily.italic.value) {
      googleFontStyle = GoogleFonts.inter(fontStyle: FontStyle.italic);
    } else {
      googleFontStyle = GoogleFonts.inter();
    }

    return googleFontStyle.copyWith(
      fontSize: size,
      color: color,
      height: height,
      overflow: overflow,
      decoration: decoration,
      letterSpacing: letterSpacing,
      fontWeight: weight,
      fontStyle: fontStyle,
      decorationStyle: decorationStyle,
      decorationColor: decorationColor,
    );
  }

  static TextStyle regular({
    required double size,
    Color color = Colors.black,
    double? height,
    FontWeight fontWeight = FontWeight.w400,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color? decorationColor,
    double? letterSpacing,
  }) => _base(
    size: size,
    fontFamily: FontFamily.regular.value,
    color: color,
    height: height,
    weight: fontWeight,
    overflow: overflow,
    decoration: decoration,
    decorationColor: decorationColor,
    letterSpacing: letterSpacing,
  );

  static TextStyle medium({
    required double size,
    Color color = Colors.black,
    double? height,
    FontWeight fontWeight = FontWeight.w500,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color? decorationColor,
    double? letterSpacing,
  }) => _base(
    size: size,
    fontFamily: FontFamily.medium.value,
    color: color,
    height: height,
    weight: fontWeight,
    overflow: overflow,
    decoration: decoration,
    decorationColor: decorationColor,
    letterSpacing: letterSpacing,
  );

  static TextStyle semiBold({
    required double size,
    Color color = Colors.black,
    double? height,
    FontWeight fontWeight = FontWeight.w600,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color? decorationColor,
    double? letterSpacing,
  }) => _base(
    size: size,
    fontFamily: FontFamily.semiBold.value,
    color: color,
    height: height,
    weight: fontWeight,
    overflow: overflow,
    decoration: decoration,
    decorationColor: decorationColor,
    letterSpacing: letterSpacing,
  );

  static TextStyle bold({
    required double size,
    Color color = Colors.black,
    double? height,
    FontWeight fontWeight = FontWeight.w700,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color? decorationColor,
    double? letterSpacing,
  }) => _base(
    size: size,
    fontFamily: FontFamily.bold.value,
    color: color,
    height: height,
    weight: fontWeight,
    overflow: overflow,
    decoration: decoration,
    decorationColor: decorationColor,
    letterSpacing: letterSpacing,
  );

  static TextStyle appBarTitle({
    double size = 18,
    Color color = Colors.white,
    double? letterSpacing,
  }) => semiBold(size: size, color: color, letterSpacing: letterSpacing);
}
