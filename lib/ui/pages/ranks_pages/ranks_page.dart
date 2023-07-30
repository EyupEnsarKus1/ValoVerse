import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki_app/bloc/lang_cubit/lang_cubit.dart';
import 'package:valorant_wiki_app/bloc/tier_bloc/tier_bloc.dart';
import 'package:valorant_wiki_app/core/locale_keys.g.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/string_extension.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_appBar.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_gridView.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/shimmer_widget.dart';
import 'package:valorant_wiki_app/ui/pages/ranks_pages/rank_card.dart';

import '../../repo_implementation/repo_implementation.dart';

class RanksPage extends StatelessWidget {
  const RanksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TierBloc>(
      create: (_) {
        final bloc = TierBloc(rankRepo, LangCubit(context: context));
        bloc.add(GetTierEvent());
        return bloc;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.home_tiers.translate,
        ),
        body: BlocBuilder<TierBloc, TierState>(
          builder: (context, state) {
            if (state is TierLoadingState) {
              return CustomGridView(
                verticalAxis: true,
                crossAxisCount: 2,
                aspectRatio: 1,
                mainSpacing: AppSizes.size8,
                crossSpacing: AppSizes.size8,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ShimmerBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5,
                      borderRadius: 8.0,
                      margin: EdgeInsets.symmetric(
                        horizontal: AppSizes.size4,
                        vertical: AppSizes.size12,
                      ));
                },
              );
            } else if (state is TierLoadedState) {
              return CustomGridView(
                verticalAxis: true,
                crossAxisCount: 2,
                aspectRatio: 1,
                mainSpacing: AppSizes.size8,
                crossSpacing: AppSizes.size8,
                itemCount: state.tierList.length,
                itemBuilder: (context, index) {
                  return RankCard(
                    rank: state.tierList[index],
                  );
                },
              );
            } else if (state is TierErrorState) {
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
