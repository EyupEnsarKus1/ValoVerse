import 'package:flutter/material.dart';

import '../constants/styles/fonts.dart';

class CustomGridView extends StatelessWidget {
  final int itemCount;
  final bool verticalAxis;
  final int crossAxisCount;
  final double aspectRatio;
  final double? mainSpacing;
  final double? crossSpacing;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext, int) itemBuilder;

  const CustomGridView({
    Key? key,
    required this.itemCount,
    required this.verticalAxis,
    required this.crossAxisCount,
    required this.aspectRatio,
    required this.itemBuilder,
    this.mainSpacing,
    this.crossSpacing,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: verticalAxis ? Axis.vertical : Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: AppSizes.size16,
          ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: aspectRatio,
        mainAxisSpacing: mainSpacing ?? 0,
        crossAxisSpacing: crossSpacing ?? 0,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
