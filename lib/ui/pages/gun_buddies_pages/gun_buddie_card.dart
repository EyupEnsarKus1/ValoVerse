import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/models/gun_buddies_data.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/padding_extension.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/radius_extension.dart';

import '../../constants/colors/app_colors.dart';
import '../../constants/enums/padding_enum.dart';
import '../../constants/enums/radius_enum.dart';
import '../../constants/styles/fonts.dart';

class GunBuddieCard extends StatelessWidget {
  final BuddyData buddie;
  const GunBuddieCard({Key? key, required this.buddie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
          vertical: AppSizes.size4,
          horizontal: AppSizes.size4,
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: RadiusEnum.lowest.borderRadiusAll(),
          child: Container(
            padding: PaddingEnum.normal.paddingVertical(),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.red),
              borderRadius: RadiusEnum.lowest.borderRadiusAll(),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: buddie.displayIcon != null &&
                            buddie.displayIcon!.isNotEmpty
                        ? buddie.displayIcon!
                        : 'assets/images/placeholder.png',
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Padding(padding: PaddingEnum.normal.paddingVertical()),
                Expanded(
                  flex: 1,
                  child: Text(
                    buddie.displayName ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: AppWeights.bold,
                      fontSize: AppSizes.size20,
                      fontFamily: AppFonts.valorant,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}