import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki_app/bloc/tier_bloc/tier_bloc.dart';
import 'package:valorant_wiki_app/core/locale_keys.g.dart';
import 'package:valorant_wiki_app/models/competitive_tier_data.dart';
import 'package:valorant_wiki_app/repositories/competitive_tier_repository/competitive_tier_repository.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/string_extension.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_appBar.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/shimmer_widget.dart';
import 'package:valorant_wiki_app/ui/pages/ranks_pages/rank_card.dart';

CompetitiveTierRepository repo = CompetitiveTierRepository();

class RanksPage extends StatelessWidget {
  const RanksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TierBloc>(
      create: (_) {
        final bloc = TierBloc(repo);
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
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: AppSizes.size8,
                  crossAxisSpacing: AppSizes.size8,
                ),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.size16,
                ),
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
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: AppSizes.size8,
                  crossAxisSpacing: AppSizes.size8,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.size16,
                ),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
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
