import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/ui/constants/enums/radius_enum.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/radius_extension.dart';

import '../../constants/colors/app_colors.dart';
import '../../constants/styles/fonts.dart';

class HomePageCard extends StatelessWidget {
  final String title;
  final double? height;
  final VoidCallback onTap;
  const HomePageCard({Key? key, required this.title, this.height, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.titleMedium, vertical: AppSizes.bodySmall),
      child: InkWell(
        onTap: onTap,
        borderRadius: RadiusEnum.normal.borderRadiusAll(),
        child: Container(
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
                style:
                    TextStyle(fontFamily: AppFonts.valorant, fontSize: AppSizes.headlineSmall, fontWeight: AppWeights.normal, color: AppColors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
