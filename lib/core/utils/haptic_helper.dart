import 'package:flutter/services.dart';

class HapticHelper {
  HapticHelper._();

  static void confirm() => HapticFeedback.mediumImpact();
  static void success() => HapticFeedback.lightImpact();
  static void error() => HapticFeedback.heavyImpact();
  static void selection() => HapticFeedback.selectionClick();
}
