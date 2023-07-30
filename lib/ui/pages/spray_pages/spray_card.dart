import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/models/sprays_data.dart';
import 'package:valorant_wiki_app/ui/constants/colors/app_colors.dart';
import 'package:valorant_wiki_app/ui/constants/enums/padding_enum.dart';
import 'package:valorant_wiki_app/ui/constants/enums/radius_enum.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/padding_extension.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/radius_extension.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';

import '../../custom_widgets/custom_gridView.dart';
import '../../custom_widgets/shimmer_widget.dart';

class SprayCard extends StatelessWidget {
  final SprayData spray;
  const SprayCard({Key? key, required this.spray}) : super(key: key);

  static shimmerWidget(BuildContext context) {
    return CustomGridView(
      verticalAxis: true,
      crossAxisCount: 2,
      aspectRatio: 0.7,
      mainSpacing: AppSizes.size8,
      crossSpacing: AppSizes.size8,
      itemCount: 10,
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
                  flex: 2,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: spray.fullTransparentIcon != null &&
                            spray.fullTransparentIcon!.isNotEmpty
                        ? spray.fullTransparentIcon!
                        : 'assets/images/placeholder.png',
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Padding(padding: PaddingEnum.normal.paddingVertical()),
                Expanded(
                  flex: 1,
                  child: Text(
                    spray.displayName ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: AppWeights.bold,
                      fontSize: AppSizes.size16,
                      fontFamily: AppFonts.archivo,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
