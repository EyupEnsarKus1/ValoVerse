import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_appBar.dart';
import 'package:valorant_wiki_app/ui/pages/settings_page/settings_page_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Ayarlar',
          backgroundColor: Colors.transparent,
          showBackButton: true),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SettingsPageCard(
              title: 'Tema',
              child: Switch.adaptive(
                value: true,
                onChanged: (value) {},
              ),
            ),
            SettingsPageCard(
              title: 'Dil',
              child: DropdownButton(
                items: const [
                  DropdownMenuItem(
                    value: 'tr',
                    child: Text('TR'),
                  ),
                  DropdownMenuItem(
                    value: 'en',
                    child: Text('EN'),
                  )
                ],
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
