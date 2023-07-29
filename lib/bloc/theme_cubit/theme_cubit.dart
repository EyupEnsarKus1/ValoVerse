import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/constants/theme/dark_theme.dart';
import '../../ui/constants/theme/light_theme.dart';

class ThemeCubit extends Cubit<ThemeState> {
  SharedPreferences? prefs;

  ThemeCubit() : super(ThemeState(themeData: AppDarkTheme.darkTheme, isLight: false)) {
    loadTheme();
  }

  Future<void> loadTheme() async {
    prefs = await SharedPreferences.getInstance();
    bool isLight = prefs!.getBool('isLight') ?? false;
    final themeData = isLight ? AppLightTheme.lightTheme : AppDarkTheme.darkTheme;
    emit(ThemeState(themeData: themeData, isLight: isLight));
  }

  Future<void> setTheme(bool newTheme) async {
    prefs = await SharedPreferences.getInstance();
    final themeData = newTheme ? AppLightTheme.lightTheme : AppDarkTheme.darkTheme;
    await _saveTheme(newTheme);
    emit(ThemeState(themeData: themeData, isLight: newTheme));
  }

  Future<void> _saveTheme(bool isLight) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setBool('isLight', isLight);
  }
}

class ThemeState {
  final ThemeData themeData;
  final bool isLight;

  ThemeState({
    required this.themeData,
    required this.isLight,
  });
}
