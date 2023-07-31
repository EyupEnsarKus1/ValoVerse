import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:valorant_wiki_app/models/maps_data.dart';
import 'package:valorant_wiki_app/ui/constants/colors/app_colors.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/padding_extension.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/radius_extension.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_appBar.dart';

import '../../constants/enums/padding_enum.dart';
import '../../constants/enums/radius_enum.dart';
import '../../constants/styles/fonts.dart';
import '../../custom_widgets/shimmer_widget.dart';

class MapCard extends StatelessWidget {
  final MapData map;
  const MapCard({Key? key, required this.map}) : super(key: key);

  static shimmerWidget(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.size16,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
          vertical: AppSizes.size8,
          horizontal: AppSizes.size4,
        ),
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Scaffold(
                  appBar: CustomAppBar(title: map.displayName ?? ''),
                  body: map.displayIcon == null
                      ? const Placeholder()
                      : PhotoView(
                          backgroundDecoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          imageProvider: NetworkImage(map.displayIcon!),
                        ),
                );
              },
            ),
          ),
          borderRadius: RadiusEnum.lowest.borderRadiusAll(),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.red),
              borderRadius: RadiusEnum.lowest.borderRadiusAll(),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: RadiusEnum.lowest.borderRadiusAll(),
                  child: CachedNetworkImage(
                    imageUrl: map.splash != null && map.splash!.isNotEmpty
                        ? map.splash!
                        : 'assets/images/placeholder.png',
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Padding(
                  padding: PaddingEnum.low.paddingAll(),
                  child: Text(
                    map.displayName ?? '',
                    style: TextStyle(
                      fontFamily: AppFonts.archivo,
                      fontSize: AppSizes.size20,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
