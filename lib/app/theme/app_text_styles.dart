import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTextStyles {
  static TextStyle get displayLarge => GoogleFonts.roboto(
    fontSize: 57,
    height: 64 / 57,
    letterSpacing: -0.25,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get headlineLarge => GoogleFonts.roboto(
    fontSize: 32,
    height: 40 / 32,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get headlineMedium => GoogleFonts.roboto(
    fontSize: 28,
    height: 36 / 28,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get titleLarge => GoogleFonts.roboto(
    fontSize: 22,
    height: 28 / 22,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get titleMedium => GoogleFonts.roboto(
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get bodyLarge => GoogleFonts.roboto(
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get bodyMedium => GoogleFonts.roboto(
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get labelLarge => GoogleFonts.roboto(
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get labelMedium => GoogleFonts.roboto(
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  );
}
