import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary — PDAM Blue
  static const primary = Color(0xFF1565C0);
  static const primaryLight = Color(0xFF1E88E5);
  static const primaryDark = Color(0xFF0D47A1);
  static const primaryContainer = Color(0xFF0D3B66);
  static const primaryFixedDim = Color(0xFFA4C9FC);
  static const onPrimaryContainer = Color(0xFF81A6D7);

  // Secondary — Water Teal
  static const secondary = Color(0xFF00897B);
  static const secondaryLight = Color(0xFF26A69A);
  static const secondaryDark = Color(0xFF00695C);

  // Accent — Alert Orange
  static const accent = Color(0xFFFF6F00);
  static const accentLight = Color(0xFFFFA726);
  static const accentDark = Color(0xFFE65100);

  // Status
  static const success = Color(0xFF2E7D32);
  static const warning = Color(0xFFF9A825);
  static const error = Color(0xFFC62828);
  static const errorContainer = Color(0xFFFFDAD6);
  static const info = Color(0xFF0288D1);

  // Neutrals
  static const background = Color(0xFFF5F5F5);
  static const surface = Color(0xFFFFFFFF);
  static const divider = Color(0xFFE0E0E0);
  static const textPrimary = Color(0xFF212121);
  static const textSecondary = Color(0xFF757575);
  static const textHint = Color(0xFFBDBDBD);

  // Dark mode
  static const darkBackground = Color(0xFF121212);
  static const darkSurface = Color(0xFF1E1E1E);
  static const darkDivider = Color(0xFF2C2C2C);
  static const darkTextPrimary = Color(0xFFE0E0E0);
  static const darkTextSecondary = Color(0xFF9E9E9E);

  // Pre-computed opacity overlays (avoids withOpacity allocations on every build)
  // Primary overlays
  static const primaryOverlay02 = Color(0x051565C0);
  static const primaryOverlay05 = Color(0x0D1565C0);
  static const primaryOverlay10 = Color(0x1A1565C0);
  static const primaryOverlay15 = Color(0x261565C0);
  static const primaryOverlay20 = Color(0x331565C0);
  static const primaryOverlay30 = Color(0x4D1565C0);
  static const primaryOverlay60 = Color(0x991565C0);
  static const primaryOverlay75 = Color(0xBF1565C0);

  // Accent overlays
  static const accentOverlay10 = Color(0x1AFF6F00);
  static const accentOverlay30 = Color(0x4DFF6F00);
  static const accentOverlay80 = Color(0xCCFF6F00);

  // Status overlays
  static const successOverlay10 = Color(0x1A2E7D32);
  static const errorOverlay10 = Color(0x1AC62828);
  static const errorOverlay30 = Color(0x4DC62828);
  static const secondaryOverlay60 = Color(0x9900897B);

  // Black/white overlays (for shadows and surfaces)
  static const blackOverlay04 = Color(0x0A000000);
  static const blackOverlay06 = Color(0x0F000000);
  static const blackOverlay10 = Color(0x1A000000);
  static const blackOverlay15 = Color(0x26000000);
  static const blackOverlay20 = Color(0x33000000);
  static const blackOverlay30 = Color(0x4D000000);
  static const whiteOverlay15 = Color(0x26FFFFFF);
  static const whiteOverlay20 = Color(0x33FFFFFF);
  static const whiteOverlay80 = Color(0xCCFFFFFF);
  static const whiteOverlay85 = Color(0xD9FFFFFF);
}
