import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFonts {
  static const String rubik = 'Rubik';
  static const String archivo = 'Archivo';
  static const String roboto = 'Roboto';
}

class AppSizeConstants {
  AppSizeConstants._();

  static const double size4 = 4.0;
  static const double size8 = 8.0;
  static const double size12 = 12.0;
  static const double size15 = 15.0;
  static const double size16 = 16.0;
  static const double size20 = 20.0;
  static const double size24 = 24.0;
  static const double size28 = 28.0;
  static const double size32 = 32.0;
}

class AppSizes {
  AppSizes.init();

  static double size4 = AppSizeConstants.size4.sp;
  static double size8 = AppSizeConstants.size8.sp;
  static double size12 = AppSizeConstants.size12.sp;
  static double size15 = AppSizeConstants.size15.sp;
  static double size16 = AppSizeConstants.size16.sp;
  static double size20 = AppSizeConstants.size20.sp;
  static double size24 = AppSizeConstants.size24.sp;
  static double size28 = AppSizeConstants.size28.sp;
  static double size32 = AppSizeConstants.size32.sp;
}

class AppWeights {
  AppWeights._();

  static const FontWeight veryLow = FontWeight.w200;
  static const FontWeight low = FontWeight.w300;
  static const FontWeight normal = FontWeight.w400;
  static const FontWeight bold = FontWeight.w500;
  static const FontWeight veryBold = FontWeight.w600;
}
