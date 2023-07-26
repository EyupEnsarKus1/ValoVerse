import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/models/agents_data.dart';
import 'package:valorant_wiki_app/ui/constants/enums/padding_enum.dart';
import 'package:valorant_wiki_app/ui/constants/enums/radius_enum.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/padding_extension.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/radius_extension.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/shimmer_widget.dart';

import '../../constants/colors/app_colors.dart';
import 'agents_detail_page.dart';

class AgentCard extends StatelessWidget {
  final AgentsData agentsData;
  const AgentCard({Key? key, required this.agentsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
          vertical: AppSizes.size12,
          horizontal: AppSizes.size4,
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AgentDetailPage(
                  data: agentsData,
                ),
              ),
            );
          },
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
                Expanded(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: agentsData.fullPortrait != null && agentsData.fullPortrait!.isNotEmpty
                        ? agentsData.fullPortrait!
                        : 'assets/images/placeholder.png',
                    placeholder: (context, url) => ShimmerBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      borderRadius: RadiusEnum.low.radius,
                      padding: PaddingEnum.normal.paddingVertical(),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Padding(padding: PaddingEnum.normal.paddingVertical()),
                Text(
                  agentsData.displayName!,
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
        ));
  }
}
