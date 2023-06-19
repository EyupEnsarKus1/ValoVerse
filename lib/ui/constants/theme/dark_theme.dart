import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppDarkTheme {
  AppDarkTheme._();

  static final ThemeData darkTheme = ThemeData(
    colorScheme: _colorScheme,
    scaffoldBackgroundColor: AppColors.blue,
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
}
