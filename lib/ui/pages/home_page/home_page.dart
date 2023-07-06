import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_appBar.dart';

import 'home_page_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Ana Sayfa"),
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
                  return HomePageCard(
                    title: data._title,
                  );
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
        return "Ajanlar";
      case DataTypes.weapons:
        return "Silahlar";
      case DataTypes.ranks:
        return "Rütbeler";
      case DataTypes.sprays:
        return "Spreyler";
      case DataTypes.playerCards:
        return "Oyuncu Kartları";
      case DataTypes.maps:
        return "Haritalar";
      case DataTypes.gunBuddies:
        return "Silah Arkadaşları";
    }
  }
}
