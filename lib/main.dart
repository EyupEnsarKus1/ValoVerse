import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valorant_wiki_app/bloc/lang_cubit/lang_cubit.dart';
import 'package:valorant_wiki_app/bloc/theme_cubit/theme_cubit.dart';
import 'package:valorant_wiki_app/core/constants/app_constants.dart';
import 'package:valorant_wiki_app/core/locale_keys.g.dart';
import 'package:valorant_wiki_app/ui/constants/localization/localization_constants.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_alertDialog.dart';
import 'package:valorant_wiki_app/ui/pages/home_page/home_page.dart';

import 'bloc/connection_cubit/connection_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
        BlocProvider<LangCubit>(create: (_) => LangCubit(context: context)),
        BlocProvider<ConnectionCubit>(create: (_) => ConnectionCubit()),
      ],
      child: BlocBuilder<LangCubit, LangState>(
        builder: (context, langState) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return ScreenUtilInit(
                builder: (context, child) {
                  return MaterialApp(
                    title: AppConstants.appTitle,
                    debugShowCheckedModeBanner: false,
                    theme: themeState.themeData,
                    locale: langState.locale,
                    supportedLocales: context.supportedLocales,
                    localizationsDelegates: context.localizationDelegates,
                    home: BlocListener<ConnectionCubit, ConnectionStatus>(
                      listener: (context, state) async {
                        if (state is ConnectionFailure) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) => WillPopScope(
                              onWillPop: () async => false,
                              child: const CustomAlertDialog(
                                title: LocaleKeys.connectivity_connectionError,
                                content:
                                    LocaleKeys.connectivity_checkConnection,
                              ),
                            ),
                          );
                        }
                      },
                      child: const HomePage(),
                    ),
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
