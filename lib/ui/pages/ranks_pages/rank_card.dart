import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_wiki_app/models/competitive_tier_data.dart';
import 'package:valorant_wiki_app/ui/constants/enums/padding_enum.dart';
import 'package:valorant_wiki_app/ui/constants/enums/radius_enum.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/padding_extension.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/radius_extension.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';

import '../../constants/colors/app_colors.dart';
import '../../custom_widgets/custom_gridView.dart';

class RankCard extends StatelessWidget {
  final CompetitiveTierData rank;
  const RankCard({Key? key, required this.rank}) : super(key: key);

  static Widget shimmerWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: AppColors.shimmerBaseColor,
          highlightColor: AppColors.shimmerHighlightColor,
          child: Container(
            margin: EdgeInsets.only(
              left: AppSizes.size20,
              bottom: AppSizes.size16,
            ),
            alignment: Alignment.centerLeft,
            height: 20.0,
            width: MediaQuery.of(context).size.width / 4,
            color: AppColors.shimmerBaseColor,
          ),
        ),
        CustomGridView(
          verticalAxis: true,
          crossAxisCount: 3,
          aspectRatio: 2 / 3,
          mainSpacing: AppSizes.size8,
          crossSpacing: AppSizes.size8,
          itemCount: 6,
          itemBuilder: (context, subIndex) {
            return Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: AppSizes.size4,
                  horizontal: AppSizes.size4,
                ),
                child: Shimmer.fromColors(
                  baseColor: AppColors.shimmerBaseColor,
                  highlightColor: AppColors.shimmerHighlightColor,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    padding: PaddingEnum.normal.paddingVertical() + PaddingEnum.low.paddingHorizontal(),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: RadiusEnum.lowest.borderRadiusAll(),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            color: AppColors.shimmerBaseColor,
                          ),
                        ),
                        Padding(padding: PaddingEnum.normal.paddingVertical()),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            color: AppColors.shimmerBaseColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
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
          padding: PaddingEnum.normal.paddingVertical() + PaddingEnum.low.paddingHorizontal(),
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
                  fontSize: AppSizes.size12,
                  fontFamily: AppFonts.archivo,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
