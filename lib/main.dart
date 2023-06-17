import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/ui/constants/theme/app_dark_theme.dart';
import 'package:valorant_wiki_app/ui/constants/theme/app_light_theme.dart';

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
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
