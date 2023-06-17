import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/ui/constants/colors/app_colors.dart';
import 'package:valorant_wiki_app/ui/constants/enums/fonts_enum.dart';
import 'package:valorant_wiki_app/ui/constants/theme/dark_theme.dart';
import 'package:valorant_wiki_app/ui/constants/theme/light_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: AppLightTheme.lightTheme,
      darkTheme: AppDarkTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Material App Bar',
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.light ? AppColors.primaryColor : AppColors.darkPrimaryColor,
              fontFamily: AppFonts.archivo,
            ),
          ),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
