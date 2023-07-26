import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/models/weapons_data.dart';
import 'package:valorant_wiki_app/ui/constants/colors/app_colors.dart';
import 'package:valorant_wiki_app/ui/constants/enums/padding_enum.dart';
import 'package:valorant_wiki_app/ui/constants/enums/radius_enum.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/padding_extension.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/radius_extension.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';

class WeaponCard extends StatelessWidget {
  final WeaponsData weaponsData;
  const WeaponCard({super.key, required this.weaponsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppSizes.size12,
        horizontal: AppSizes.size8,
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: RadiusEnum.lowest.borderRadiusAll(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4,
          padding: PaddingEnum.normal.paddingAll(),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.red),
            borderRadius: RadiusEnum.lowest.borderRadiusAll(),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: weaponsData.displayIcon != null &&
                          weaponsData.displayIcon!.isNotEmpty
                      ? weaponsData.displayIcon!
                      : 'assets/images/placeholder.png',
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Padding(padding: PaddingEnum.normal.paddingVertical()),
              Text(
                weaponsData.displayName!,
                style: TextStyle(
                  fontWeight: AppWeights.bold,
                  fontSize: AppSizes.size20,
                  fontFamily: AppFonts.valorant,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
