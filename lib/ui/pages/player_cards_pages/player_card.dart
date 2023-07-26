import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/models/player_cards_data.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/padding_extension.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/radius_extension.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';

import '../../constants/enums/padding_enum.dart';
import '../../constants/enums/radius_enum.dart';

class PlayerCard extends StatelessWidget {
  final PlayerCardData playerCard;
  const PlayerCard({Key? key, required this.playerCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
          vertical: AppSizes.size12,
          horizontal: AppSizes.size4,
        ),
        child: Container(
          padding: PaddingEnum.normal.paddingVertical(),
          decoration: BoxDecoration(
            borderRadius: RadiusEnum.lowest.borderRadiusAll(),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: playerCard.largeArt != null &&
                          playerCard.largeArt!.isNotEmpty
                      ? playerCard.largeArt!
                      : 'assets/images/placeholder.png',
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ],
          ),
        ));
  }
}
