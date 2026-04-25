import 'package:flutter/material.dart';

class AppSpacing {
  AppSpacing._();

  // Base spacing values
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
  static const xxl = 48.0;

  // Symmetric horizontal
  static const horizontalSm = EdgeInsets.symmetric(horizontal: sm);
  static const horizontalMd = EdgeInsets.symmetric(horizontal: md);
  static const horizontalLg = EdgeInsets.symmetric(horizontal: lg);

  // Symmetric vertical
  static const verticalXs = EdgeInsets.symmetric(vertical: xs);
  static const verticalSm = EdgeInsets.symmetric(vertical: sm);
  static const verticalMd = EdgeInsets.symmetric(vertical: md);

  // All sides
  static const allXs = EdgeInsets.all(xs);
  static const allSm = EdgeInsets.all(sm);
  static const allMd = EdgeInsets.all(md);
  static const allLg = EdgeInsets.all(lg);
  static const allXl = EdgeInsets.all(xl);

  // Single direction
  static const topSm = EdgeInsets.only(top: sm);
  static const topMd = EdgeInsets.only(top: md);
  static const bottomXs = EdgeInsets.only(bottom: xs);
  static const bottomSm = EdgeInsets.only(bottom: sm);
  static const bottomMd = EdgeInsets.only(bottom: md);
  static const bottomLg = EdgeInsets.only(bottom: lg);

  // Common compound patterns
  static const horizontalMdVerticalSm =
      EdgeInsets.symmetric(horizontal: md, vertical: sm);
  static const horizontalMdVerticalMd =
      EdgeInsets.symmetric(horizontal: md, vertical: md);
  static const horizontalMdVerticalLg =
      EdgeInsets.symmetric(horizontal: md, vertical: lg);
  static const horizontalSmVerticalSm =
      EdgeInsets.symmetric(horizontal: sm, vertical: sm);
  static const horizontalSmVerticalMd =
      EdgeInsets.symmetric(horizontal: sm, vertical: md);
  static const horizontalLgVerticalSm =
      EdgeInsets.symmetric(horizontal: lg, vertical: sm);
  static const horizontalLgVerticalMd =
      EdgeInsets.symmetric(horizontal: lg, vertical: md);
}
