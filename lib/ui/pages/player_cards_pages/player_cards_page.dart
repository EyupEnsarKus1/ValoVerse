import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki_app/bloc/lang_cubit/lang_cubit.dart';
import 'package:valorant_wiki_app/bloc/playercards_bloc/playercards_bloc.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/string_extension.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_gridView.dart';
import 'package:valorant_wiki_app/ui/pages/player_cards_pages/player_card.dart';

import '../../../core/locale_keys.g.dart';
import '../../constants/styles/fonts.dart';
import '../../custom_widgets/custom_appBar.dart';
import '../../repo_implementation/repo_implementation.dart';

class PlayerCardsPage extends StatelessWidget {
  const PlayerCardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlayercardsBloc>(
      create: (_) {
        final bloc = PlayercardsBloc(playerCardsRepo, LangCubit(context: context));
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
              return PlayerCard.shimmerWidget(context);
            } else if (state is PlayercardsLoadedState) {
              return CustomGridView(
                verticalAxis: true,
                crossAxisCount: 3,
                aspectRatio: 2 / 5,
                mainSpacing: AppSizes.size8,
                crossSpacing: AppSizes.size4,
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
