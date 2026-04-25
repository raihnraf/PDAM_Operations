import 'package:flutter/material.dart';

class AppShadow {
  AppShadow._();

  static const cardShadow = Color(0x0A000000);

  static List<BoxShadow> get card => [
        BoxShadow(
          color: cardShadow,
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];
}
