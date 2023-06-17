import 'package:flutter/material.dart';

enum FontsEnum {
  rubik('Rubik'),
  archivo('Archivo'),
  roboto('Roboto');

  final String fontName;

  const FontsEnum(this.fontName);
}

class AppSizes {
  AppSizes._();
  static const bodySmall = 12.0;
  static const bodyMedium = 14.0;
  static const bodyLarge = 16.0;
  static const labelSmall = 11.0;
  static const labelMedium = 12.0;
  static const labelLarge = 14.0;
  static const titleSmall = 14.0;
  static const titleMedium = 16.0;
  static const titleLarge = 22.0;
  static const headlineSmall = 24.0;
  static const headlineMedium = 28.0;
  static const headlineLarge = 32.0;
}

enum FontWeightEnum {
  bold(FontWeight.bold),
  normal(FontWeight.normal);

  final FontWeight fontWeight;
  const FontWeightEnum(this.fontWeight);
}
