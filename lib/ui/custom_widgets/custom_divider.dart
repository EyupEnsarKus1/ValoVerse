import 'package:flutter/material.dart';

class DividerWithoutPadding extends StatelessWidget {
  final EdgeInsets? margin;
  final double? thickness;
  final Color? color;

  const DividerWithoutPadding({Key? key, this.margin, this.thickness, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      // height: 1.0,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: (thickness ?? DividerTheme.of(context).thickness) ?? 0.0, color: color ?? Theme.of(context).dividerColor),
        ),
      ),
    );
  }
}
