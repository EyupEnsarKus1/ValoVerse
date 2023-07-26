// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/ui/constants/enums/padding_enum.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/padding_extension.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/radius_extension.dart';

import '../../constants/colors/app_colors.dart';
import '../../constants/enums/radius_enum.dart';
import '../../constants/styles/fonts.dart';

class SettingsPageCard extends StatelessWidget {
  final String title;
  final Widget? child;

  const SettingsPageCard({
    Key? key,
    required this.title,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSizes.size20,
        vertical: AppSizes.size8,
      ),
      child: InkWell(
        borderRadius: RadiusEnum.normal.borderRadiusAll(),
        child: Container(
          height: 120.0,
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
                        fontFamily: AppFonts.valorant,
                        fontSize: AppSizes.size20,
                        fontWeight: AppWeights.normal,
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColors.blue
                            : AppColors.white,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: PaddingEnum.high.paddingHorizontal(),
                    child: child ?? const SizedBox.shrink(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
