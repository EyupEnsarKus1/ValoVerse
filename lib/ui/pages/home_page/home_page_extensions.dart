import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/repositories/generic_repo.dart';
import 'package:valorant_wiki_app/ui/pages/gun_buddies_pages/gun_buddies_page.dart';
import 'package:valorant_wiki_app/ui/pages/maps_page/maps_page.dart';
import 'package:valorant_wiki_app/ui/pages/player_cards_pages/player_cards_page.dart';
import 'package:valorant_wiki_app/ui/pages/ranks_pages/ranks_page.dart';
import 'package:valorant_wiki_app/ui/pages/settings_page/settings_page.dart';
import 'package:valorant_wiki_app/ui/pages/spray_pages/sprays_page.dart';
import 'package:valorant_wiki_app/ui/pages/weapons_pages/weapons_page.dart';

import '../agents_page/agentsPage.dart';

extension HomePageExtensions on PageEnums {
  String get title {
    switch (this) {
      case PageEnums.agents:
        return "Ajanlar";
      case PageEnums.weapons:
        return "Silahlar";
      case PageEnums.competitivetiers:
        return "Rütbeler";
      case PageEnums.sprays:
        return "Spreyler";
      case PageEnums.playercards:
        return "Oyuncu Kartları";
      case PageEnums.maps:
        return "Haritalar";
      case PageEnums.buddies:
        return "Ugurlar";
      case PageEnums.settings:
        return "Ayarlar";
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
