import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki_app/bloc/lang_cubit/lang_cubit.dart';
import 'package:valorant_wiki_app/bloc/theme_cubit/theme_cubit.dart';
import 'package:valorant_wiki_app/core/locale_keys.g.dart';
import 'package:valorant_wiki_app/ui/constants/enums/radius_enum.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/radius_extension.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/string_extension.dart';
import 'package:valorant_wiki_app/ui/constants/localization/localization_constants.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_appBar.dart';
import 'package:valorant_wiki_app/ui/pages/settings_page/settings_page_card.dart';

import '../../constants/colors/app_colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.settings.translate, showBackButton: true),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return SettingsPageCard(
                  title: LocaleKeys.theme.translate,
                  child: Switch.adaptive(
                    value: state.isLight,
                    onChanged: (value) {
                      context.read<ThemeCubit>().setTheme(!state.isLight);
                    },
                  ),
                );
              },
            ),
            BlocBuilder<LangCubit, LangState>(
              builder: (context, state) {
                return SettingsPageCard(
                  title: LocaleKeys.language.translate,
                  child: DropdownButton(
                    value: context.locale,
                    borderRadius: RadiusEnum.normal.borderRadiusAll(),
                    underline: const SizedBox.shrink(),
                    style: TextStyle(
                      fontSize: AppSizes.size12,
                      fontFamily: AppFonts.archivo,
                      color: Theme.of(context).brightness == Brightness.light ? AppColors.blue : AppColors.white,
                    ),
                    items: [
                      DropdownMenuItem(
                        value: LocalizationConstants.trLocale,
                        child: Text(LocaleKeys.tr.translate),
                      ),
                      DropdownMenuItem(
                        value: LocalizationConstants.enLocale,
                        child: Text(LocaleKeys.en.translate),
                      )
                    ],
                    onChanged: (newLocale) {
                      context.read<LangCubit>().setLang(newLocale!);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
