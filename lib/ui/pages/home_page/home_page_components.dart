import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/repositories/generic_repo.dart';
import 'package:valorant_wiki_app/ui/pages/gun_buddies_pages/gun_buddies_page.dart';
import 'package:valorant_wiki_app/ui/pages/maps_page/maps_page.dart';
import 'package:valorant_wiki_app/ui/pages/player_cards_pages/player_cards_page.dart';
import 'package:valorant_wiki_app/ui/pages/ranks_pages/ranks_page.dart';
import 'package:valorant_wiki_app/ui/pages/spray_pages/sprays_page.dart';
import 'package:valorant_wiki_app/ui/pages/weapons_pages/weapons_page.dart';

import '../agents_page/agentsPage.dart';

extension DataTypesExtension on Params {
  String get title {
    switch (this) {
      case Params.agents:
        return "Ajanlar";
      case Params.weapons:
        return "Silahlar";
      case Params.competitivetiers:
        return "Rütbeler";
      case Params.sprays:
        return "Spreyler";
      case Params.playercards:
        return "Oyuncu Kartları";
      case Params.maps:
        return "Haritalar";
      case Params.buddies:
        return "Ugurlar";
    }
  }

  String get mainCardAssets {
    switch (this) {
      case Params.agents:
        return "assets/images/agents.png";
      case Params.weapons:
        return "assets/images/weapons.png";
      case Params.competitivetiers:
        return "assets/images/ranks.png";
      case Params.sprays:
        return "assets/images/sprays.png";
      case Params.playercards:
        return "assets/images/playercards.png";
      case Params.maps:
        return "assets/images/maps.png";
      case Params.buddies:
        return "assets/images/gunbuddies.png";
      default:
        return "";
    }
  }

  Future navigateToPage(BuildContext context) {
    switch (this) {
      case Params.agents:
        return Navigator.push(
            context, MaterialPageRoute(builder: (context) => AgentsPage()));
      case Params.weapons:
        return Navigator.push(
            context, MaterialPageRoute(builder: (context) => WeaponsPage()));
      case Params.competitivetiers:
        return Navigator.push(
            context, MaterialPageRoute(builder: (context) => RanksPage()));
      case Params.sprays:
        return Navigator.push(
            context, MaterialPageRoute(builder: (context) => SpraysPage()));
      case Params.playercards:
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => PlayerCardsPage()));
      case Params.maps:
        return Navigator.push(
            context, MaterialPageRoute(builder: (context) => MapsPage()));
      case Params.buddies:
        return Navigator.push(
            context, MaterialPageRoute(builder: (context) => GunBuddiesPage()));
      default:
        return Future.error('Invalid DataType');
    }
  }
}
