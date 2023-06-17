import 'package:flutter/material.dart';

enum FontsEnum {
  rubik('Rubik'),
  archivo('Archivo'),
  roboto('Roboto');

  final String fontName;

  const FontsEnum(this.fontName);
}

enum FontSizeEnum {
  bodySmall(12.0),
  bodyMedium(14.0),
  bodyLarge(16.0),
  labelSmall(11.0),
  labelMedium(12.0),
  labelLarge(14.0),
  titleSmall(14.0),
  titleMedium(16.0),
  titleLarge(22.0),
  headlineSmall(24.0),
  headlineMedium(28.0),
  headlineLarge(32.0);

  final double fontSize;
  const FontSizeEnum(this.fontSize);
}

enum FontWeightEnum {
  bold(FontWeight.bold),
  normal(FontWeight.normal);

  final FontWeight fontWeight;
  const FontWeightEnum(this.fontWeight);
}
