import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/ui/constants/enums/radius_enum.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/radius_extension.dart';

import '../constants/colors/app_colors.dart';
import '../constants/styles/fonts.dart';
import '../constants/styles/styles.dart';

class HomePageCard extends StatelessWidget {
  final String title;
  final double? height;
  const HomePageCard({Key? key, required this.title, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 138.5,
      margin: EdgeInsets.symmetric(horizontal: AppSizes.titleMedium, vertical: AppSizes.bodySmall),
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.headlineLarge,
        horizontal: AppSizes.headlineSmall,
      ),
      decoration: BoxDecoration(
        borderRadius: RadiusEnum.normal.borderRadiusAll(),
        border: Border.all(
          color: AppColors.red,
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: headlineSmallTextStyle(),
          ),
        ],
      ),
    );
  }
}
