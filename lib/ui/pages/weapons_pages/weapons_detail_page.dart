import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/core/locale_keys.g.dart';
import 'package:valorant_wiki_app/ui/constants/enums/padding_enum.dart';
import 'package:valorant_wiki_app/ui/constants/enums/radius_enum.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/padding_extension.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/radius_extension.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/string_extension.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_appBar.dart';
import 'package:valorant_wiki_app/ui/pages/weapons_pages/skin_card.dart';

import '../../../models/weapons_data.dart';
import '../../constants/colors/app_colors.dart';
import '../../custom_widgets/custom_divider.dart';

class WeaponsDetailPage extends StatefulWidget {
  final WeaponsData weapon;
  const WeaponsDetailPage({Key? key, required this.weapon}) : super(key: key);

  @override
  State<WeaponsDetailPage> createState() => _WeaponsDetailPageState();
}

class _WeaponsDetailPageState extends State<WeaponsDetailPage> {
  String? currentIcon;

  void updateIcon(String newIcon) {
    setState(() {
      currentIcon = newIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.weapon.displayName ?? ''),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: PaddingEnum.high.paddingVertical() +
                  PaddingEnum.high.paddingHorizontal(),
              child: Align(
                alignment: Alignment.center,
                child: CachedNetworkImage(
                  height: 150,
                  imageUrl: currentIcon ??
                      widget.weapon.displayIcon ??
                      'assets/images/placeholder.png',
                ),
              ),
            ),
            StatsRow(
              stat: widget.weapon.shopData?.categoryText ?? '',
              title: LocaleKeys.detailPages_weapons_type.translate,
              margin: PaddingEnum.low.paddingVertical(),
            ),
            StatsRow(
              stat: widget.weapon.shopData?.cost.toString() ?? '',
              title: LocaleKeys.detailPages_weapons_creds.translate,
              margin: PaddingEnum.low.paddingVertical(),
            ),
            StatsRow(
              stat: widget.weapon.weaponStats?.magazineSize.toString() ?? '',
              title: LocaleKeys.detailPages_weapons_magazine.translate,
              margin: PaddingEnum.low.paddingOnlyTop(),
            ),
            Padding(
              padding: PaddingEnum.normal.paddingVertical() +
                  PaddingEnum.high.paddingHorizontal(),
              child: Text(
                LocaleKeys.detailPages_weapons_damage.translate,
                style: titleStyle,
              ),
            ),
            StatsTable(
              weapon: widget.weapon,
            ),
            Padding(
              padding: PaddingEnum.high.paddingVertical() +
                  PaddingEnum.high.paddingHorizontal(),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LocaleKeys.detailPages_weapons_skins.translate,
                  style: titleStyle,
                ),
              ),
            ),
            SkinsList(weapon: widget.weapon, onSkinTap: updateIcon),
          ],
        ),
      ),
    );
  }
}

class SkinsList extends StatelessWidget {
  const SkinsList({
    super.key,
    required this.weapon,
    required this.onSkinTap,
  });

  final WeaponsData weapon;
  final Function(String) onSkinTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: PaddingEnum.high.paddingOnlyLeft(),
        scrollDirection: Axis.horizontal,
        itemCount: weapon.skins?.length ?? 0,
        itemBuilder: (context, index) {
          final skin = weapon.skins![index];
          return SkinCard(
            heroTag: "tag-$index",
            skinURL: skin.displayIcon,
            skinName: skin.displayName,
            onTap: onSkinTap,
          );
        },
      ),
    );
  }
}

class StatsTable extends StatelessWidget {
  final WeaponsData weapon;

  const StatsTable({
    Key? key,
    required this.weapon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingEnum.high.paddingHorizontal(),
      child: Table(
        border: TableBorder.all(
            color: AppColors.red,
            borderRadius: RadiusEnum.lowest.borderRadiusCircular()),
        columnWidths: _getColumnWidths(),
        children: _buildTableRows(),
      ),
    );
  }

  Map<int, TableColumnWidth> _getColumnWidths() {
    return const {
      0: FlexColumnWidth(1),
      1: FlexColumnWidth(1),
      2: FlexColumnWidth(1),
      3: FlexColumnWidth(1),
    };
  }

  List<TableRow> _buildTableRows() {
    var tableRows = <TableRow>[];

    var headerRow = TableRow(
      children: [
        _buildTableCell(
            LocaleKeys.detailPages_weapons_range.translate, titleStyle),
        _buildTableCell(
            LocaleKeys.detailPages_weapons_body.translate, titleStyle),
        _buildTableCell(
            LocaleKeys.detailPages_weapons_head.translate, titleStyle),
        _buildTableCell(
            LocaleKeys.detailPages_weapons_leg.translate, titleStyle),
      ],
    );

    tableRows.add(headerRow);

    for (var range in weapon.weaponStats?.damageRanges ?? []) {
      var rangeRow = TableRow(
        children: [
          _buildTableCell('${range.rangeStartMeters}-${range.rangeEndMeters}',
              descriptionStyle),
          _buildTableCell(
              range.headDamage!.toStringAsFixed(1), descriptionStyle),
          _buildTableCell(
              range.bodyDamage!.toStringAsFixed(1), descriptionStyle),
          _buildTableCell(
              range.legDamage!.toStringAsFixed(1), descriptionStyle),
        ],
      );

      tableRows.add(rangeRow);
    }

    return tableRows;
  }

  Widget _buildTableCell(String text, TextStyle style) {
    return Padding(
      padding: PaddingEnum.normal.paddingVertical(),
      child: Text(text, style: style, textAlign: TextAlign.center),
    );
  }
}

class StatsRow extends StatelessWidget {
  const StatsRow({
    Key? key,
    required this.title,
    required this.stat,
    this.showDivider = true,
    this.margin,
  }) : super(key: key);

  final String title;
  final String stat;
  final bool showDivider;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.size16,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: titleStyle,
              ),
              Text(
                stat,
                style: descriptionStyle,
              ),
            ],
          ),
          if (showDivider)
            DividerWithoutPadding(
              color: AppColors.lightBlackLevel4,
              margin: margin,
            ),
        ],
      ),
    );
  }
}

TextStyle titleStyle = TextStyle(
  fontFamily: AppFonts.archivo,
  fontWeight: AppWeights.veryBold,
  fontSize: AppSizes.size20,
  color: AppColors.red,
);
TextStyle descriptionStyle = TextStyle(
  fontFamily: AppFonts.roboto,
  color: AppColors.lightBlueLevel4,
  fontSize: AppSizes.size15,
  fontWeight: AppWeights.bold,
);
