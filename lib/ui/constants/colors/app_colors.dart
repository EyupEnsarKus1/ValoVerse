import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Main Colors

  static const black = Color(0xff111111);
  static const white = Color(0xffECE8E1);
  static const red = Color(0xffFF4655);
  static const blue = Color(0xff0F1923);

  // Light Colors

  static const lightBlackLevel2 = Color(0xff333333);
  static const lightBlackLevel3 = Color(0xff555555);
  static const lightBlackLevel4 = Color(0xff777777);

  static const lightRedLevel2 = Color(0xffFF6A70);
  static const lightRedLevel3 = Color(0xffFF8E8B);
  static const lightRedLevel4 = Color(0xffFFB2A6);

  static const lightBlueLevel2 = Color(0xff33414B);
  static const lightBlueLevel3 = Color(0xff576973);
  static const lightBlueLevel4 = Color(0xff7B919B);

  static const Color lightGray = Color(0xffe0e0e0);

  static Color shimmerBaseColor = lightGray.withOpacity(0.5);
  static Color shimmerHighlightColor = lightGray.withOpacity(0.2);

  // Color Scheme Light

  static const primaryColor = Color(0xffff4655);
  static const primaryVariantColor = Color(0xff99000c);
  static const secondaryColor = Color(0xffff0015);
  static const secondaryVariantColor = Color(0xff99000c);
  static const surfaceColor = Color(0xffffffff);
  static const backgroundColor = Color(0xffff99a1);
  static const errorColor = Color(0xffd32f2f);
  static const onPrimaryColor = Color(0xffffffff);
  static const onSecondaryColor = Color(0xffffffff);
  static const onSurfaceColor = Color(0xff000000);
  static const onBackgroundColor = Color(0xffffffff);
  static const onErrorColor = Color(0xffffffff);
  static const brightnessLight = Brightness.light;

// Color Scheme Dark

  static const darkPrimaryColor = Color(0xffff4655);
  static const darkPrimaryVariantColor = Color(0xff99000c);
  static const darkSecondaryColor = Color(0xffbbc7db);
  static const darkSecondaryVariantColor = Color(0xff3b4858);
  static const darkSurfaceColor = Color(0xff1a1c1e);
  static const darkBackgroundColor = Color(0xff1a1c1e);
  static const darkErrorColor = Color(0xffffb4ab);
  static const darkOnPrimaryColor = Color(0xffffffff);
  static const darkOnSecondaryColor = Color(0xff253140);
  static const darkOnSurfaceColor = Color(0xffe2e2e6);
  static const darkOnBackgroundColor = Color(0xffe2e2e6);
  static const darkOnErrorColor = Color(0xff690005);
  static const brightnessDark = Brightness.dark;
}
