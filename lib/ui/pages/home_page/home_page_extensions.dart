import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/repositories/generic_repo.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/string_extension.dart';
import 'package:valorant_wiki_app/ui/pages/gun_buddies_pages/gun_buddies_page.dart';
import 'package:valorant_wiki_app/ui/pages/maps_page/maps_page.dart';
import 'package:valorant_wiki_app/ui/pages/player_cards_pages/player_cards_page.dart';
import 'package:valorant_wiki_app/ui/pages/ranks_pages/ranks_page.dart';
import 'package:valorant_wiki_app/ui/pages/settings_page/settings_page.dart';
import 'package:valorant_wiki_app/ui/pages/spray_pages/sprays_page.dart';
import 'package:valorant_wiki_app/ui/pages/weapons_pages/weapons_page.dart';

import '../../../core/locale_keys.g.dart';
import '../agents_page/agents_page.dart';

extension HomePageExtensions on PageEnums {
  String get title {
    switch (this) {
      case PageEnums.agents:
        return LocaleKeys.home_agents.translate;
      case PageEnums.weapons:
        return LocaleKeys.home_weapons.translate;
      case PageEnums.competitivetiers:
        return LocaleKeys.home_tiers.translate;
      case PageEnums.sprays:
        return LocaleKeys.home_sprays.translate;
      case PageEnums.playercards:
        return LocaleKeys.home_playerCards.translate;
      case PageEnums.maps:
        return LocaleKeys.home_maps.translate;
      case PageEnums.buddies:
        return LocaleKeys.home_gunBuddies.translate;
      case PageEnums.settings:
        return LocaleKeys.settings.translate;
    }
  }

  String get mainCardAssets {
    switch (this) {
      case PageEnums.agents:
        return "assets/images/agents.png";
      case PageEnums.weapons:
        return "assets/images/weapons.png";
      case PageEnums.competitivetiers:
        return "assets/images/ranks.png";
      case PageEnums.sprays:
        return "assets/images/sprays.png";
      case PageEnums.playercards:
        return "assets/images/playercards.png";
      case PageEnums.maps:
        return "assets/images/maps.png";
      case PageEnums.buddies:
        return "assets/images/gunbuddies.png";
      case PageEnums.settings:
        return "assets/images/settings.png";
      default:
        return "";
    }
  }

  Future navigateToPage(BuildContext context) {
    switch (this) {
      case PageEnums.agents:
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AgentsPage()));
      case PageEnums.weapons:
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WeaponsPage()));
      case PageEnums.competitivetiers:
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RanksPage()));
      case PageEnums.sprays:
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SpraysPage()));
      case PageEnums.playercards:
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PlayerCardsPage()));
      case PageEnums.maps:
        return Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MapsPage()));
      case PageEnums.buddies:
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => const GunBuddiesPage()));
      case PageEnums.settings:
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SettingsPage()));
      default:
        return Future.error('Invalid DataType');
    }
  }
}
