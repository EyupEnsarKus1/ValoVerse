import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valorant_wiki_app/constants/enums/radius_enum.dart';

extension RadiusExtension on RadiusEnum {
  // BorderRadius Circular
  BorderRadius borderRadiusCircular() => BorderRadius.circular(radius.sp);

  // BorderRadius All
  BorderRadius borderRadiusAll() =>
      BorderRadius.all(Radius.circular(radius.sp));
}
