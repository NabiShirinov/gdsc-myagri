import 'package:flutter/material.dart';

abstract class ConstTextStyle {
  static TextStyle? get titleTextStyle => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );
  static TextStyle? get subTitleTextStyle => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );
}
