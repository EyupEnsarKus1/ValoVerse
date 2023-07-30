import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki_app/bloc/lang_cubit/lang_cubit.dart';
import 'package:valorant_wiki_app/bloc/tier_bloc/tier_bloc.dart';
import 'package:valorant_wiki_app/core/locale_keys.g.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/string_extension.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_appBar.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_gridView.dart';
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
              return RankCard.shimmerWidget(context);
            } else if (state is TierLoadedState) {
              final bloc = BlocProvider.of<TierBloc>(context);
              var groupedData = bloc.groupByDivisionName(state.tierList);

              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: groupedData.keys.length,
                itemBuilder: (context, index) {
                  var divisionName = groupedData.keys.elementAt(index);
                  final Map<String, Color> colorData = {};

                  groupedData.forEach((division, list) {
                    String hexColor = '#${list.first.color ?? 'ffffff'}';
                    colorData[division] = Color(
                        int.parse(hexColor.substring(1, 7), radix: 16) +
                            0xFF000000);
                  });

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppSizes.size8,
                            horizontal: AppSizes.size20),
                        child: Text(
                          divisionName,
                          style: TextStyle(
                            fontWeight: AppWeights.normal,
                            fontSize: AppSizes.size16,
                            fontFamily: AppFonts.archivo,
                            color: colorData[divisionName],
                          ),
                        ),
                      ), // Title for this division
                      CustomGridView(
                        verticalAxis: true,
                        crossAxisCount: 3,
                        aspectRatio: 1,
                        mainSpacing: AppSizes.size16,
                        crossSpacing: AppSizes.size8,
                        itemCount: groupedData[divisionName]!.length,
                        itemBuilder: (context, subIndex) {
                          return RankCard(
                              rank: groupedData[divisionName]![subIndex]);
                        },
                      ), // Rank cards for this division
                    ],
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
