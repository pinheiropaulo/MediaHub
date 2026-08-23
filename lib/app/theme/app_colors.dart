import 'package:flutter/material.dart';

abstract final class AppColors {
  // Surfaces
  static const Color surface = Color(0xFF121317);
  static const Color surfaceDim = Color(0xFF121317);
  static const Color surfaceBright = Color(0xFF38393D);

  static const Color surfaceContainerLowest = Color(0xFF0D0E12);
  static const Color surfaceContainerLow = Color(0xFF1A1B20);
  static const Color surfaceContainer = Color(0xFF1F1F24);
  static const Color surfaceContainerHigh = Color(0xFF292A2E);
  static const Color surfaceContainerHighest = Color(0xFF343439);

  // Content on surfaces
  static const Color onSurface = Color(0xFFE3E2E7);
  static const Color onSurfaceVariant = Color(0xFFD4C5AB);

  // Primary - Amber
  static const Color primary = Color(0xFFFFE4AF);
  static const Color onPrimary = Color(0xFF3F2E00);
  static const Color primaryContainer = Color(0xFFFFC107);
  static const Color onPrimaryContainer = Color(0xFF6D5100);

  static const Color primaryFixed = Color(0xFFFFDF9E);
  static const Color primaryFixedDim = Color(0xFFFABD00);
  static const Color onPrimaryFixed = Color(0xFF261A00);
  static const Color onPrimaryFixedVariant = Color(0xFF5B4300);

  // Secondary
  static const Color secondary = Color(0xFFC7C6CC);
  static const Color onSecondary = Color(0xFF2F3035);
  static const Color secondaryContainer = Color(0xFF46464C);
  static const Color onSecondaryContainer = Color(0xFFB5B4BB);

  // Tertiary
  static const Color tertiary = Color(0xFFE7E6ED);
  static const Color onTertiary = Color(0xFF2F3035);
  static const Color tertiaryContainer = Color(0xFFCBCAD1);
  static const Color onTertiaryContainer = Color(0xFF54555A);

  // Error
  static const Color error = Color(0xFFFFB4AB);
  static const Color onError = Color(0xFF690005);
  static const Color errorContainer = Color(0xFF93000A);
  static const Color onErrorContainer = Color(0xFFFFDAD6);

  // Borders
  static const Color outline = Color(0xFF9C8F78);
  static const Color outlineVariant = Color(0xFF4F4632);

  // Other
  static const Color background = Color(0xFF121317);
  static const Color onBackground = Color(0xFFE3E2E7);
  static const Color surfaceVariant = Color(0xFF343439);
  static const Color surfaceTint = Color(0xFFFABD00);
  static const Color inverseSurface = Color(0xFFE3E2E7);
  static const Color inverseOnSurface = Color(0xFF2F3035);
  static const Color inversePrimary = Color(0xFF785900);
}
