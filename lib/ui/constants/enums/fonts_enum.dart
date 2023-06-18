import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFonts {
  static const String rubik = 'Rubik';
  static const String archivo = 'Archivo';
  static const String roboto = 'Roboto';
}

class AppSizes {
  static double bodySmall = AppSizeConstants.bodySmall.sp;
  static double bodyMedium = AppSizeConstants.bodyMedium.sp;
  static double bodyLarge = AppSizeConstants.bodyLarge.sp;
  static double labelSmall = AppSizeConstants.labelSmall.sp;
  static double labelMedium = AppSizeConstants.labelMedium.sp;
  static double labelLarge = AppSizeConstants.labelLarge.sp;
  static double titleSmall = AppSizeConstants.titleSmall.sp;
  static double titleMedium = AppSizeConstants.titleMedium.sp;
  static double titleLarge = AppSizeConstants.titleLarge.sp;
  static double headlineSmall = AppSizeConstants.headlineSmall.sp;
  static double headlineMedium = AppSizeConstants.headlineMedium.sp;
  static double headlineLarge = AppSizeConstants.headlineLarge.sp;
}

class AppSizeConstants {
  AppSizeConstants._();
  static const double bodySmall = 12.0;
  static const double bodyMedium = 14.0;
  static const double bodyLarge = 16.0;
  static const double labelSmall = 11.0;
  static const double labelMedium = 12.0;
  static const double labelLarge = 14.0;
  static const double titleSmall = 14.0;
  static const double titleMedium = 16.0;
  static const double titleLarge = 22.0;
  static const double headlineSmall = 24.0;
  static const double headlineMedium = 28.0;
  static const double headlineLarge = 32.0;
}

class CWeights {
  CWeights._();

  static const FontWeight veryLow = FontWeight.w200;
  static const FontWeight low = FontWeight.w300;
  static const FontWeight normal = FontWeight.w400;
  static const FontWeight bold = FontWeight.w500;
  static const FontWeight veryBold = FontWeight.w600;
}
