import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/repositories/generic_repo.dart';
import 'package:valorant_wiki_app/ui/pages/gun_buddies_pages/gun_buddies_page.dart';
import 'package:valorant_wiki_app/ui/pages/maps_page/maps_page.dart';
import 'package:valorant_wiki_app/ui/pages/player_cards_pages/player_cards_page.dart';
import 'package:valorant_wiki_app/ui/pages/ranks_pages/ranks_page.dart';
import 'package:valorant_wiki_app/ui/pages/spray_pages/sprays_page.dart';
import 'package:valorant_wiki_app/ui/pages/weapons_pages/weapons_page.dart';

import '../agents_page/agentsPage.dart';

extension DataTypesExtension on DataTypes {
  String get title {
    switch (this) {
      case DataTypes.agents:
        return "Ajanlar";
      case DataTypes.weapons:
        return "Silahlar";
      case DataTypes.competitivetiers:
        return "Rütbeler";
      case DataTypes.sprays:
        return "Spreyler";
      case DataTypes.playercards:
        return "Oyuncu Kartları";
      case DataTypes.maps:
        return "Haritalar";
      case DataTypes.buddies:
        return "Ugurlar";
    }
  }

  String get mainCardAssets {
    switch (this) {
      case DataTypes.agents:
        return "assets/images/agents.png";
      case DataTypes.weapons:
        return "assets/images/weapons.png";
      case DataTypes.competitivetiers:
        return "assets/images/ranks.png";
      case DataTypes.sprays:
        return "assets/images/sprays.png";
      case DataTypes.playercards:
        return "assets/images/playercards.png";
      case DataTypes.maps:
        return "assets/images/maps.png";
      case DataTypes.buddies:
        return "assets/images/gunbuddies.png";
      default:
        return "";
    }
  }

  Future navigateToPage(BuildContext context) {
    switch (this) {
      case DataTypes.agents:
        return Navigator.push(context, MaterialPageRoute(builder: (context) => AgentsPage()));
      case DataTypes.weapons:
        return Navigator.push(context, MaterialPageRoute(builder: (context) => WeaponsPage()));
      case DataTypes.competitivetiers:
        return Navigator.push(context, MaterialPageRoute(builder: (context) => RanksPage()));
      case DataTypes.sprays:
        return Navigator.push(context, MaterialPageRoute(builder: (context) => SpraysPage()));
      case DataTypes.playercards:
        return Navigator.push(context, MaterialPageRoute(builder: (context) => PlayerCardsPage()));
      case DataTypes.maps:
        return Navigator.push(context, MaterialPageRoute(builder: (context) => MapsPage()));
      case DataTypes.buddies:
        return Navigator.push(context, MaterialPageRoute(builder: (context) => GunBuddiesPage()));
      default:
        return Future.error('Invalid DataType');
    }
  }
}
