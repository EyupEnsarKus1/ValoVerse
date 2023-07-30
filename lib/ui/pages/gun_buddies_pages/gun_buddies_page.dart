import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki_app/bloc/gunbuddies_bloc/gunbuddies_bloc.dart';
import 'package:valorant_wiki_app/bloc/lang_cubit/lang_cubit.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/string_extension.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_gridView.dart';
import 'package:valorant_wiki_app/ui/pages/gun_buddies_pages/gun_buddie_card.dart';

import '../../../core/locale_keys.g.dart';
import '../../constants/styles/fonts.dart';
import '../../custom_widgets/custom_appBar.dart';
import '../../repo_implementation/repo_implementation.dart';

class GunBuddiesPage extends StatelessWidget {
  const GunBuddiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GunbuddiesBloc>(
      create: (_) {
        final bloc = GunbuddiesBloc(buddiesRepo, LangCubit(context: context));
        bloc.add(GetGunBudiesEvent());
        return bloc;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.home_gunBuddies.translate,
        ),
        body: BlocBuilder<GunbuddiesBloc, GunbuddiesState>(
          builder: (context, state) {
            if (state is GunbuddiesLoadingState) {
              return GunBuddieCard.shimmerWidget(context);
            } else if (state is GunbuddiesLoadedState) {
              return CustomGridView(
                crossAxisCount: 2,
                aspectRatio: 0.7,
                mainSpacing: AppSizes.size8,
                crossSpacing: AppSizes.size8,
                verticalAxis: true,
                itemCount: state.gunBuddiesList.length,
                itemBuilder: (context, index) {
                  return GunBuddieCard(
                    buddie: state.gunBuddiesList[index],
                  );
                },
              );
            } else if (state is GunbuddiesErrorState) {
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
