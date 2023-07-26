import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki_app/ui/constants/theme/dark_theme.dart';
import 'package:valorant_wiki_app/ui/constants/theme/light_theme.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(ThemeState(themeData: AppDarkTheme.darkTheme, isLight: false));

  void setTheme() {
    if (state.themeData == AppLightTheme.lightTheme) {
      final updateState =
          ThemeState(themeData: AppDarkTheme.darkTheme, isLight: false);
      emit(updateState);
    } else {
      final updateState =
          ThemeState(themeData: AppLightTheme.lightTheme, isLight: true);
      emit(updateState);
    }
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
