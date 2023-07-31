import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/repositories/generic_repo.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_appBar.dart';

import 'home_page_card.dart';
import 'home_page_extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "VALORANT",
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
                itemCount: PageEnums.values.length,
                itemBuilder: (context, index) {
                  final PageEnums data = PageEnums.values[index];
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
