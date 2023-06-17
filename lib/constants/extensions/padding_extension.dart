import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valorant_wiki_app/constants/enums/padding_enum.dart';

extension PaddingExtension on PaddingEnum {
  // EdgeInsets All
  EdgeInsets paddingAll() => EdgeInsets.all(padding.sp);

  // EdgeInsets Symetric Horizontal
  EdgeInsets paddingHorizontal() =>
      EdgeInsets.symmetric(horizontal: padding.sp);

  // EdgeInsets Symetric Vertical
  EdgeInsets paddingVertical() => EdgeInsets.symmetric(vertical: padding.sp);

  // EdgeInsets Only Top
  EdgeInsets paddingOnlyTop() => EdgeInsets.only(top: padding.sp);

  // EdgeInsets Only Bottom
  EdgeInsets paddingOnlyBottom() => EdgeInsets.only(bottom: padding.sp);

  // EdgeInsets Only Left
  EdgeInsets paddingOnlyLeft() => EdgeInsets.only(left: padding.sp);

  // EdgeInsets Only Right
  EdgeInsets paddingOnlyRight() => EdgeInsets.only(right: padding.sp);
}
