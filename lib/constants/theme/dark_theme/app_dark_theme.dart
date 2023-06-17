import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/constants/extensions/text_style_extension.dart';
import 'package:valorant_wiki_app/constants/theme/app_colors.dart';

import '../../enums/fonts_enum.dart';

class AppDarkTheme {
  AppDarkTheme._();

  static ThemeData appThemeDark = ThemeData(
    colorScheme: _colorScheme,
    textTheme: _textTheme,
  );

  static ColorScheme get _colorScheme => const ColorScheme(
        brightness: AppColors.brightnessDark,
        primary: AppColors.darkPrimaryColor,
        onPrimary: AppColors.darkOnPrimaryColor,
        secondary: AppColors.darkSecondaryColor,
        onSecondary: AppColors.darkOnSecondaryColor,
        error: AppColors.darkErrorColor,
        onError: AppColors.darkOnErrorColor,
        background: AppColors.darkBackgroundColor,
        onBackground: AppColors.darkOnBackgroundColor,
        surface: AppColors.darkSurfaceColor,
        onSurface: AppColors.darkOnSurfaceColor,
      );

  static TextTheme get _textTheme => TextTheme(
        bodySmall: FontsEnum.roboto.textStyle(
          FontSizeEnum.bodySmall.fontSize,
          FontWeightEnum.normal.fontWeight,
        ),
        bodyMedium: FontsEnum.roboto.textStyle(
          FontSizeEnum.bodyMedium.fontSize,
          FontWeightEnum.normal.fontWeight,
        ),
        bodyLarge: FontsEnum.roboto.textStyle(
          FontSizeEnum.bodyLarge.fontSize,
          FontWeightEnum.normal.fontWeight,
        ),
        labelSmall: FontsEnum.roboto.textStyle(
          FontSizeEnum.labelSmall.fontSize,
          FontWeightEnum.normal.fontWeight,
        ),
        labelMedium: FontsEnum.roboto.textStyle(
          FontSizeEnum.labelMedium.fontSize,
          FontWeightEnum.normal.fontWeight,
        ),
        labelLarge: FontsEnum.roboto.textStyle(
          FontSizeEnum.labelLarge.fontSize,
          FontWeightEnum.normal.fontWeight,
        ),
        titleSmall: FontsEnum.roboto.textStyle(
          FontSizeEnum.titleSmall.fontSize,
          FontWeightEnum.normal.fontWeight,
        ),
        titleMedium: FontsEnum.roboto.textStyle(
          FontSizeEnum.titleMedium.fontSize,
          FontWeightEnum.normal.fontWeight,
        ),
        titleLarge: FontsEnum.roboto.textStyle(
          FontSizeEnum.titleLarge.fontSize,
          FontWeightEnum.normal.fontWeight,
        ),
        headlineSmall: FontsEnum.roboto.textStyle(
          FontSizeEnum.headlineSmall.fontSize,
          FontWeightEnum.normal.fontWeight,
        ),
        headlineMedium: FontsEnum.roboto.textStyle(
          FontSizeEnum.headlineMedium.fontSize,
          FontWeightEnum.normal.fontWeight,
        ),
        headlineLarge: FontsEnum.roboto.textStyle(
          FontSizeEnum.headlineLarge.fontSize,
          FontWeightEnum.normal.fontWeight,
        ),
      );
}
