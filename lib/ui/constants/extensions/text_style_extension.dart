import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../enums/fonts_enum.dart';

extension TextStyleExtension on FontsEnum {
  // Custom Text Style With Color
  TextStyle textStyleWithColor(double fontSize, FontWeight fontWeight, Color color) => TextStyle(
        fontFamily: fontName,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
      );

  // Custom Text Style Without Color
  TextStyle textStyle(double fontSize, FontWeight fontWeight) => TextStyle(
        fontFamily: fontName,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      );
}
