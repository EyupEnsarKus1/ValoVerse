import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki_app/bloc/lang_cubit/lang_cubit.dart';
import 'package:valorant_wiki_app/bloc/weapons_bloc/weapons_bloc.dart';
import 'package:valorant_wiki_app/core/locale_keys.g.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/string_extension.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_appBar.dart';
import 'package:valorant_wiki_app/ui/pages/weapons_pages/weapon_card.dart';

import '../../repo_implementation/repo_implementation.dart';

class WeaponsPage extends StatelessWidget {
  const WeaponsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeaponsBloc>(
      create: (_) {
        final bloc = WeaponsBloc(weaponsRepo, LangCubit(context: context));
        bloc.add(GetWeaponsEvent());
        return bloc;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.home_weapons.translate,
        ),
        body: BlocBuilder<WeaponsBloc, WeaponsState>(
          builder: (context, state) {
            if (state is WeaponsLoadingState) {
              return WeaponCard.shimmerWidget(context);
            } else if (state is WeaponsLoadedState) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  vertical: AppSizes.size16,
                  horizontal: AppSizes.size16,
                ),
                itemCount: state.weaponList.length,
                itemBuilder: (context, index) {
                  return WeaponCard(
                    weaponsData: state.weaponList[index],
                  );
                },
              );
            } else if (state is WeaponsErrorState) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return const Center(
                child: Text("Unexpected state"),
              );
            }
          },
        ),
      ),
    );
  }
}
