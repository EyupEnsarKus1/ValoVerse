import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:valorant_wiki_app/core/locale_keys.g.dart';
import 'package:valorant_wiki_app/ui/constants/enums/padding_enum.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/padding_extension.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/string_extension.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_appBar.dart';
import 'package:valorant_wiki_app/ui/pages/weapons_pages/skin_card.dart';

import '../../../models/weapons_data.dart';
import '../../constants/colors/app_colors.dart';

class WeaponsDetailPage extends StatelessWidget {
  final WeaponsData weapon;
  const WeaponsDetailPage({Key? key, required this.weapon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: weapon.displayName ?? ''),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: PaddingEnum.high.paddingHorizontal(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: PaddingEnum.normal.paddingVertical(),
                child: CachedNetworkImage(
                    height: 150,
                    imageUrl:
                        weapon.displayIcon ?? 'assets/images/placeholder.png'),
              ),
              Padding(padding: PaddingEnum.highest.paddingVertical()),
              StatsRow(
                stat: weapon.shopData?.category ?? '',
                title: LocaleKeys.detailPages_weapons_type.translate,
              ),
              const Divider(
                color: AppColors.lightBlackLevel4,
              ),
              StatsRow(
                stat: weapon.shopData?.cost.toString() ?? '',
                title: LocaleKeys.detailPages_weapons_creds.translate,
              ),
              const Divider(
                color: AppColors.lightBlackLevel4,
              ),
              StatsRow(
                stat: weapon.weaponStats?.magazineSize.toString() ?? '',
                title: LocaleKeys.detailPages_weapons_magazine.translate,
              ),
              const Divider(
                color: AppColors.lightBlackLevel4,
              ),
              Padding(
                padding: PaddingEnum.high.paddingVertical(),
                child: Text(
                  LocaleKeys.detailPages_weapons_damage.translate,
                  style: titleStyle,
                ),
              ),
              const StatsHeadlines(),
              StatsList(weapon: weapon),
              Padding(
                padding: PaddingEnum.normal.paddingVertical(),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    LocaleKeys.detailPages_weapons_skins.translate,
                    style: titleStyle,
                  ),
                ),
              ),
              SkinsList(weapon: weapon),
            ],
          ),
        ),
      ),
    );
  }
}

class SkinsList extends StatelessWidget {
  const SkinsList({
    super.key,
    required this.weapon,
  });

  final WeaponsData weapon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: PaddingEnum.high.paddingVertical(),
        itemCount: weapon.skins?.length ?? 0,
        itemBuilder: (context, index) {
          final skin = weapon.skins![index];
          return Padding(
            padding: PaddingEnum.low.paddingAll(),
            child: SkinCard(
              skinURL: skin.displayIcon,
            ),
          );
        },
      ),
    );
  }
}

class StatsHeadlines extends StatelessWidget {
  const StatsHeadlines({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          LocaleKeys.detailPages_weapons_range.translate,
          style: titleStyle,
        ),
        Text(
          LocaleKeys.detailPages_weapons_body.translate,
          style: titleStyle,
        ),
        Text(
          LocaleKeys.detailPages_weapons_head.translate,
          style: titleStyle,
        ),
        Text(
          LocaleKeys.detailPages_weapons_leg.translate,
          style: titleStyle,
        ),
      ],
    );
  }
}

class StatsList extends StatelessWidget {
  const StatsList({
    super.key,
    required this.weapon,
  });

  final WeaponsData weapon;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: PaddingEnum.high.paddingVertical(),
      itemCount: weapon.weaponStats?.damageRanges?.length ?? 0,
      itemBuilder: (context, index) {
        final weaponRanges = weapon.weaponStats!.damageRanges![index];
        return Padding(
          padding: PaddingEnum.normal.paddingVertical(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${weaponRanges.rangeStartMeters}-${weaponRanges.rangeEndMeters}',
                style: descriptionStyle,
              ),
              Text(
                weaponRanges.headDamage!.toStringAsFixed(1),
                style: descriptionStyle,
              ),
              Text(
                weaponRanges.bodyDamage!.toStringAsFixed(1),
                style: descriptionStyle,
              ),
              Text(
                weaponRanges.legDamage!.toStringAsFixed(1),
                style: descriptionStyle,
              ),
            ],
          ),
        );
      },
    );
  }
}

class StatsRow extends StatelessWidget {
  const StatsRow({
    super.key,
    required this.title,
    required this.stat,
  });
  final String title;
  final String stat;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        Text(
          stat,
          style: descriptionStyle,
        )
      ],
    );
  }
}

TextStyle titleStyle = TextStyle(
  fontFamily: AppFonts.roboto,
  fontWeight: AppWeights.veryBold,
  fontSize: AppSizes.size20,
  color: AppColors.red,
);
TextStyle descriptionStyle = TextStyle(
  fontFamily: AppFonts.roboto,
  color: AppColors.white,
  fontSize: AppSizes.size15,
  fontWeight: AppWeights.bold,
);
