import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/models/player_cards_data.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/radius_extension.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';

import '../../constants/colors/app_colors.dart';
import '../../constants/enums/radius_enum.dart';
import '../../custom_widgets/custom_gridView.dart';
import '../../custom_widgets/shimmer_widget.dart';

class PlayerCard extends StatelessWidget {
  final PlayerCardData playerCard;
  const PlayerCard({Key? key, required this.playerCard}) : super(key: key);

  static shimmerWidget(BuildContext context) {
    return CustomGridView(
      verticalAxis: true,
      crossAxisCount: 3,
      aspectRatio: 2 / 5,
      mainSpacing: AppSizes.size8,
      crossSpacing: AppSizes.size4,
      itemCount: 6,
      itemBuilder: (context, index) {
        return ShimmerBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            borderRadius: 8.0,
            margin: EdgeInsets.symmetric(
              horizontal: AppSizes.size4,
              vertical: AppSizes.size12,
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
          vertical: AppSizes.size8,
          horizontal: AppSizes.size4,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: RadiusEnum.lowest.borderRadiusCircular(),
            border: Border.all(
              color: AppColors.red,
            ),
          ),
          child: ClipRRect(
            borderRadius: RadiusEnum.lowest.borderRadiusCircular(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: playerCard.largeArt != null && playerCard.largeArt!.isNotEmpty ? playerCard.largeArt! : 'assets/images/placeholder.png',
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
