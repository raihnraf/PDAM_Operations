import 'package:flutter/material.dart';

/// Responsive breakpoint constants for tablet/large screen support.
/// Target audience is field workers on phones, but these breakpoints
/// prepare the app for future tablet deployment.
class AppBreakpoints {
  AppBreakpoints._();

  static const double phone = 600;
  static const double tablet = 900;

  static bool isPhone(BuildContext context) =>
      MediaQuery.sizeOf(context).width < phone;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= phone &&
      MediaQuery.sizeOf(context).width < tablet;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= tablet;

  /// Returns horizontal padding appropriate for screen size.
  static EdgeInsets horizontalPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= tablet) return const EdgeInsets.symmetric(horizontal: 32);
    if (width >= phone) return const EdgeInsets.symmetric(horizontal: 24);
    return const EdgeInsets.symmetric(horizontal: 16);
  }

  /// Returns max content width for large screens.
  static double maxContentWidth(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= tablet) return 600;
    return width;
  }
}
