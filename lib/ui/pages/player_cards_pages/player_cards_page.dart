import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki_app/bloc/lang_cubit/lang_cubit.dart';
import 'package:valorant_wiki_app/bloc/playercards_bloc/playercards_bloc.dart';
import 'package:valorant_wiki_app/repositories/player_cards_repository/player_cards_repository.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/string_extension.dart';
import 'package:valorant_wiki_app/ui/pages/player_cards_pages/player_card.dart';

import '../../../core/locale_keys.g.dart';
import '../../constants/styles/fonts.dart';
import '../../custom_widgets/custom_appBar.dart';
import '../../custom_widgets/shimmer_widget.dart';

PlayerCardsRepository repo = PlayerCardsRepository();

class PlayerCardsPage extends StatelessWidget {
  const PlayerCardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlayercardsBloc>(
      create: (_) {
        final bloc = PlayercardsBloc(repo, LangCubit(context: context));
        bloc.add(GetPlayerCardsEvent());
        return bloc;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.home_playerCards.translate,
        ),
        body: BlocBuilder<PlayercardsBloc, PlayercardsState>(
          builder: (context, state) {
            if (state is PlayercardsLoadingState) {
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 3,
                  mainAxisSpacing: AppSizes.size8,
                  crossAxisSpacing: AppSizes.size8,
                ),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.size16,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ShimmerBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      borderRadius: 8.0,
                      margin: EdgeInsets.symmetric(
                        horizontal: AppSizes.size4,
                        vertical: AppSizes.size12,
                      ));
                },
              );
            } else if (state is PlayercardsLoadedState) {
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 3,
                  mainAxisSpacing: AppSizes.size8,
                  crossAxisSpacing: AppSizes.size8,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.size16,
                ),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: state.playerCardList.length,
                itemBuilder: (context, index) {
                  return PlayerCard(
                    playerCard: state.playerCardList[index],
                  );
                },
              );
            } else if (state is PlayercardsErrorState) {
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
