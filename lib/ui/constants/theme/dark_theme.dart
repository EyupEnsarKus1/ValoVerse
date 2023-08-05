import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/app_colors.dart';

class AppDarkTheme {
  AppDarkTheme._();

  static final ThemeData darkTheme = ThemeData(
    colorScheme: _colorScheme,
    appBarTheme: _appBarTheme,
    scaffoldBackgroundColor: AppColors.blue,
  );

  static AppBarTheme get _appBarTheme => const AppBarTheme(
        backgroundColor: AppColors.blue,
        iconTheme: IconThemeData(color: AppColors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
        ),
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
