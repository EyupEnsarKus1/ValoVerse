import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/ui/constants/enums/padding_enum.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/padding_extension.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/radius_extension.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';

import '../../constants/colors/app_colors.dart';
import '../../constants/enums/radius_enum.dart';

class SkinCard extends StatelessWidget {
  final String? skinURL;
  final String? skinName;
  final String heroTag;
  final Function(String) onTap;
  const SkinCard(
      {Key? key,
      required this.skinURL,
      required this.heroTag,
      required this.onTap,
      this.skinName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: RadiusEnum.lowest.borderRadiusAll(),
      onTap: () {
        onTap(skinURL!);
      },
      child: Padding(
        padding: PaddingEnum.low.paddingAll(),
        child: Container(
          width: MediaQuery.of(context).size.width / 1.7,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.red),
            borderRadius: RadiusEnum.lowest.borderRadiusAll(),
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: PaddingEnum.low.paddingAll(),
                  child: Hero(
                    tag: heroTag,
                    child: CachedNetworkImage(
                      imageUrl: skinURL!,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: PaddingEnum.low.paddingAll(),
                child: Text(
                  skinName ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: AppFonts.archivo,
                      fontSize: AppSizeConstants.size16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
