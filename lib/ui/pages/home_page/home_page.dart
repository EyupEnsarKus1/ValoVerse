import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/repositories/generic_repo.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_appBar.dart';

import 'home_page_card.dart';
import 'home_page_components.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "VALORANT",
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: DataTypes.values.length,
                itemBuilder: (context, index) {
                  final DataTypes data = DataTypes.values[index];
                  return HomePageCard(
                    imageAsset: data.mainCardAssets,
                    title: data.title,
                    onTap: () {
                      data.navigateToPage(context);
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
