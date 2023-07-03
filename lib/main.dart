import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:valorant_wiki_app/bloc/lang_cubit/lang_cubit.dart';
import 'package:valorant_wiki_app/bloc/theme_cubit/theme_cubit.dart';
import 'package:valorant_wiki_app/ui/constants/colors/app_colors.dart';
import 'package:valorant_wiki_app/ui/constants/enums/fonts_enum.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/string_extension.dart';
import 'package:valorant_wiki_app/ui/constants/localization/localization_constants.dart';
import 'package:valorant_wiki_app/ui/pages/agentsPage.dart';

import 'core/locale_keys.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: LocalizationConstants.path,
      supportedLocales: LocalizationConstants.supportedLocales,
      fallbackLocale: LocalizationConstants.enLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<LangCubit>(
          create: (_) => LangCubit(context: context),
        ),
      ],
      child: BlocBuilder<LangCubit, LangState>(
        builder: (context, langState) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return ScreenUtilInit(
                builder: (context, child) {
                  return MaterialApp(
                    title: 'ValorantWikiApp',
                    debugShowCheckedModeBanner: false,
                    theme: themeState.themeData,
                    locale: langState.locale,
                    supportedLocales: context.supportedLocales,
                    localizationsDelegates: context.localizationDelegates,
                    home: HomePage(),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final langCubit = BlocProvider.of<LangCubit>(context);
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    langCubit.setTurkish();
    themeCubit.setTheme();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    final langCubit = BlocProvider.of<LangCubit>(context);
                    langCubit.setTurkish();
                  },
                  icon: Text('tr'),
                ),
                IconButton(
                  onPressed: () {
                    final langCubit = BlocProvider.of<LangCubit>(context);
                    langCubit.setEnglish();
                  },
                  icon: Text('en'),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                final themeCubit = BlocProvider.of<ThemeCubit>(context);
                themeCubit.setTheme();
              },
              icon: Icon(
                MaterialIcons.brightness_3,
                color: BlocProvider.of<ThemeCubit>(context)
                            .state
                            .themeData
                            .brightness ==
                        Brightness.light
                    ? AppColors.blue
                    : AppColors.primaryColor,
              ),
            ),
          ],
          centerTitle: true,
          title: Text(
            "Valorant",
            style: TextStyle(
              color: BlocProvider.of<ThemeCubit>(context)
                          .state
                          .themeData
                          .brightness ==
                      Brightness.light
                  ? AppColors.blue
                  : AppColors.primaryColor,
              fontSize: AppSizes.headlineMedium,
              fontWeight: AppWeights.veryBold,
              fontFamily: AppFonts.valorant,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(LocaleKeys.agents_abilities.translate),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AgentsPage(),
                    ),
                  );
                },
                child: Text(""),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
