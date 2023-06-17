import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/ui/constants/colors/app_colors.dart';

class AppLightTheme {
  AppLightTheme._();

  static ThemeData appThemeLight = ThemeData(
    colorScheme: _colorScheme,
  );

  static ColorScheme get _colorScheme => const ColorScheme(
        brightness: AppColors.brightnessLight,
        primary: AppColors.primaryColor,
        onPrimary: AppColors.onPrimaryColor,
        secondary: AppColors.secondaryColor,
        onSecondary: AppColors.onSecondaryColor,
        error: AppColors.errorColor,
        onError: AppColors.onErrorColor,
        background: AppColors.backgroundColor,
        onBackground: AppColors.onBackgroundColor,
        surface: AppColors.surfaceColor,
        onSurface: AppColors.onSurfaceColor,
      );
}
