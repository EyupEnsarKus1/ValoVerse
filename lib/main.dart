import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        ScreenUtil.init(context);
        AppSizes.init();
        return MediaQuery(
          data: mediaQueryData,
          child: child!,
        );
      },
      title: 'ValorantWikiApp',
      debugShowCheckedModeBanner: false,
      theme: AppLightTheme.lightTheme,
      darkTheme: AppDarkTheme.darkTheme,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "İsmail Yüksek",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: AppSizes.headlineLarge,
                fontWeight: AppWeights.veryBold,
                fontFamily: AppFonts.rubik,
              ),
            )
          ],
        ),
      ),
    );
  }
}
