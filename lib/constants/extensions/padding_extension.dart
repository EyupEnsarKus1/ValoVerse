import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/constants/enums/padding_enum.dart';

extension PaddingExtension on PaddingEnum {
  // EdgeInsets All
  EdgeInsets paddingAll() => EdgeInsets.all(padding);

  // EdgeInsets Symetric Horizontal
  EdgeInsets paddingHorizontal() => EdgeInsets.symmetric(horizontal: padding);

  // EdgeInsets Symetric Vertical
  EdgeInsets paddingVertical() => EdgeInsets.symmetric(vertical: padding);

  // EdgeInsets Only Top
  EdgeInsets paddingOnlyTop() => EdgeInsets.only(top: padding);

  // EdgeInsets Only Bottom
  EdgeInsets paddingOnlyBottom() => EdgeInsets.only(bottom: padding);

  // EdgeInsets Only Left
  EdgeInsets paddingOnlyLeft() => EdgeInsets.only(left: padding);

  // EdgeInsets Only Right
  EdgeInsets paddingOnlyRight() => EdgeInsets.only(right: padding);
}
