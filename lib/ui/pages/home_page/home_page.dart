import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/core/locale_keys.g.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/string_extension.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_appBar.dart';

import 'home_page_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.homePage.translate),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: DataTypes.values.length,
                itemBuilder: (context, index) {
                  final DataTypes data = DataTypes.values[index];
                  return HomePageCard(title: data._title);
                }),
          ],
        ),
      ),
    );
  }
}

enum DataTypes {
  agents,
  weapons,
  ranks,
  sprays,
  playerCards,
  maps,
  gunBuddies,
}

extension DataTypesExtension on DataTypes {
  String get _title {
    switch (this) {
      case DataTypes.agents:
        return LocaleKeys.home_agents.translate;
      case DataTypes.weapons:
        return LocaleKeys.home_weapons.translate;
      case DataTypes.ranks:
        return LocaleKeys.home_tiers.translate;
      case DataTypes.sprays:
        return LocaleKeys.home_sprays.translate;
      case DataTypes.playerCards:
        return LocaleKeys.home_playerCards.translate;
      case DataTypes.maps:
        return LocaleKeys.home_maps.translate;
      case DataTypes.gunBuddies:
        return LocaleKeys.home_gunBuddies.translate;
    }
  }
}
