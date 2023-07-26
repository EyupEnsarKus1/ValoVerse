import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/colors/app_colors.dart';

class ShimmerBox extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Alignment alignment;

  const ShimmerBox({
    Key? key,
    required this.height,
    required this.width,
    required this.borderRadius,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        child: Shimmer.fromColors(
          baseColor: AppColors.shimmerBaseColor,
          highlightColor: AppColors.shimmerHighlightColor,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.shimmerBaseColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
      ),
    );
  }
}
