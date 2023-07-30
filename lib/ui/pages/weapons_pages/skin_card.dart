import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/ui/constants/enums/padding_enum.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/padding_extension.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/radius_extension.dart';

import '../../constants/colors/app_colors.dart';
import '../../constants/enums/radius_enum.dart';

class SkinCard extends StatelessWidget {
  final String? skinURL;
  final String heroTag;
  const SkinCard({Key? key, required this.skinURL, required this.heroTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
            opaque: false,
            barrierDismissible: false,
            barrierLabel: "",
            pageBuilder: (BuildContext context, _, __) {
              return Hero(
                transitionOnUserGestures: true,
                tag: heroTag,
                child: skinURL == null
                    ? const Placeholder()
                    : CachedNetworkImage(imageUrl: skinURL!),
              );
            }));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 4.5,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.red),
          borderRadius: RadiusEnum.lowest.borderRadiusAll(),
        ),
        child: Padding(
          padding: PaddingEnum.low.paddingAll(),
          child: skinURL == null
              ? Hero(
                  tag: heroTag,
                  transitionOnUserGestures: true,
                  child: Placeholder(
                    fallbackHeight: MediaQuery.of(context).size.height / 4,
                    fallbackWidth: MediaQuery.of(context).size.width / 3,
                  ),
                )
              : Hero(
                  tag: heroTag,
                  child: CachedNetworkImage(
                    imageUrl: skinURL!,
                  ),
                ),
        ),
      ),
    );
  }
}
