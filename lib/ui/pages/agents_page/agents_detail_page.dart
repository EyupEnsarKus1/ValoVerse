import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/models/agents_data.dart';
import 'package:valorant_wiki_app/ui/constants/enums/padding_enum.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/padding_extension.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/radius_extension.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_appBar.dart';

import '../../constants/colors/app_colors.dart';
import '../../constants/enums/radius_enum.dart';
import '../../custom_widgets/custom_divider.dart';

class AgentDetailPage extends StatelessWidget {
  final AgentsData data;
  const AgentDetailPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: data.displayName ?? "",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.size16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: PaddingEnum.low.paddingOnlyTop(),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: CachedNetworkImage(
                        imageUrl: data.background!,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        color: Theme.of(context).brightness == Brightness.light ? AppColors.blue : AppColors.white,
                      ),
                    ),
                    Center(
                      child: CachedNetworkImage(
                        imageUrl: data.bustPortrait!,
                        alignment: Alignment.center,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ],
                ),
              ),
              DividerWithoutPadding(
                margin: PaddingEnum.high.paddingVertical(),
                color: AppColors.lightBlackLevel4,
              ),
              Padding(
                padding: PaddingEnum.low.paddingOnlyBottom(),
                child: Text(
                  "Açıklama",
                  style: titleStyle,
                ),
              ),
              Text(
                data.description!,
                style: descriptionStyle,
              ),
              DividerWithoutPadding(
                margin: PaddingEnum.high.paddingVertical(),
                color: AppColors.lightBlackLevel4,
              ),
              Padding(
                padding: PaddingEnum.low.paddingOnlyBottom(),
                child: Text(
                  data.role!.displayName!,
                  style: titleStyle,
                ),
              ),
              Text(
                data.role!.description!,
                style: descriptionStyle,
              ),
              DividerWithoutPadding(
                margin: PaddingEnum.high.paddingVertical(),
                color: AppColors.lightBlackLevel4,
              ),
              Text(
                "Yetenekler",
                style: titleStyle,
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: PaddingEnum.highest.paddingOnlyBottom(),
                  itemCount: data.abilities!.length,
                  itemBuilder: (context, index) {
                    final Abilities abilitiesData = data.abilities![index];
                    return AgentAbilityCard(
                      abilitiesData: abilitiesData,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class AgentAbilityCard extends StatelessWidget {
  final Abilities abilitiesData;
  const AgentAbilityCard({Key? key, required this.abilitiesData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: PaddingEnum.high.paddingOnlyTop(),
      decoration: BoxDecoration(
        borderRadius: RadiusEnum.lowest.borderRadiusAll(),
        border: Border.all(
          color: AppColors.red,
          width: 1,
        ),
      ),
      padding: PaddingEnum.normal.paddingAll(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                abilitiesData.displayIcon!,
                color: Theme.of(context).brightness == Brightness.light ? AppColors.blue : AppColors.white,
                width: AppSizes.size28,
                height: AppSizes.size28,
                fit: BoxFit.cover,
              ),
              Padding(padding: PaddingEnum.lowest.paddingAll()),
              Expanded(
                child: Text(
                  abilitiesData.displayName!,
                  style: TextStyle(
                    fontFamily: AppFonts.roboto,
                    fontWeight: AppWeights.bold,
                    fontSize: AppSizes.size20,
                    color: AppColors.red,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Padding(padding: PaddingEnum.normal.paddingOnlyTop()),
          Text(
            abilitiesData.description!,
            style: descriptionStyle,
          ),
        ],
      ),
    );
  }
}

TextStyle titleStyle = TextStyle(
  fontFamily: AppFonts.roboto,
  fontWeight: AppWeights.bold,
  fontSize: AppSizes.size24,
  color: AppColors.red,
);
TextStyle descriptionStyle = TextStyle(
  color: AppColors.lightBlueLevel4,
  fontSize: AppSizes.size15,
  fontWeight: AppWeights.normal,
  fontFamily: AppFonts.rubik,
);
