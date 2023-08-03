import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/ui/constants/enums/radius_enum.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/radius_extension.dart';

import '../../constants/colors/app_colors.dart';
import '../../constants/styles/fonts.dart';

class HomePageCard extends StatelessWidget {
  final String title;
  final double? height;
  final VoidCallback onTap;
  final String imageAsset;

  const HomePageCard({
    Key? key,
    required this.title,
    this.height,
    required this.onTap,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSizes.size20,
        vertical: AppSizes.size8,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: RadiusEnum.normal.borderRadiusAll(),
        child: Container(
          height: 138.0,
          decoration: BoxDecoration(
            borderRadius: RadiusEnum.normal.borderRadiusAll(),
            border: Border.all(
              color: AppColors.red,
            ),
          ),
          child: ClipRRect(
            borderRadius: RadiusEnum.normal.borderRadiusAll(),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: AppSizes.size20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: AppFonts.roboto,
                        fontSize: AppSizes.size20,
                        fontWeight: AppWeights.bold,
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColors.blue
                            : AppColors.white,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    imageAsset,
                    height: 138.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
