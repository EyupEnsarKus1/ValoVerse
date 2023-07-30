import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/models/competitive_tier_data.dart';
import 'package:valorant_wiki_app/ui/constants/enums/padding_enum.dart';
import 'package:valorant_wiki_app/ui/constants/enums/radius_enum.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/padding_extension.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/radius_extension.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';

import '../../custom_widgets/custom_gridView.dart';
import '../../custom_widgets/shimmer_widget.dart';

class RankCard extends StatelessWidget {
  final CompetitiveTierData rank;
  const RankCard({Key? key, required this.rank}) : super(key: key);

  static Widget shimmerWidget(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.size8, horizontal: AppSizes.size20),
              child: ShimmerBox(
                width: MediaQuery.of(context).size.width * .3,
                height: MediaQuery.of(context).size.height * .05,
                borderRadius: 8.0,
                margin: EdgeInsets.symmetric(
                  horizontal: AppSizes.size4,
                  vertical: AppSizes.size12,
                ),
              ),
            ), // DivisionName için Shimmer
            CustomGridView(
              verticalAxis: true,
              crossAxisCount: 3,
              aspectRatio: 1,
              mainSpacing: AppSizes.size8,
              crossSpacing: AppSizes.size8,
              itemCount: 3,
              itemBuilder: (context, subIndex) {
                return ShimmerBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                  borderRadius: 8.0,
                  margin: EdgeInsets.symmetric(
                    horizontal: AppSizes.size4,
                    vertical: AppSizes.size12,
                  ),
                );
              },
            ), // Rank cards için Shimmer
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String hexColor = '#${rank.color ?? 'ffffff'}';
    Color color = Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
    return Container(
        margin: EdgeInsets.symmetric(
          vertical: AppSizes.size4,
          horizontal: AppSizes.size4,
        ),
        child: InkWell(
          onTap: () {},
          splashColor: color,
          borderRadius: RadiusEnum.lowest.borderRadiusAll(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            padding: PaddingEnum.normal.paddingVertical(),
            decoration: BoxDecoration(
              border: Border.all(color: color, width: 2),
              borderRadius: RadiusEnum.lowest.borderRadiusAll(),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: rank.largeIcon != null && rank.largeIcon!.isNotEmpty ? rank.largeIcon! : 'assets/images/placeholder.png',
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                Padding(padding: PaddingEnum.normal.paddingVertical()),
                Text(
                  rank.tierName ?? '',
                  style: TextStyle(
                    fontWeight: AppWeights.bold,
                    fontSize: AppSizes.size16,
                    fontFamily: AppFonts.archivo,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ));
  }
}
