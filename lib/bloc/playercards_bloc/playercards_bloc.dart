import 'package:bloc/bloc.dart';
import 'package:valorant_wiki_app/bloc/lang_cubit/lang_cubit.dart';
import 'package:valorant_wiki_app/models/player_cards_data.dart';
import 'package:valorant_wiki_app/repositories/player_cards_repository/player_cards_repository.dart';

part 'playercards_event.dart';
part 'playercards_state.dart';

class PlayercardsBloc extends Bloc<PlayercardsEvent, PlayercardsState> {
  final PlayerCardsRepository playerCardsRepo;
  final LangCubit langCubit;
  PlayercardsBloc(this.playerCardsRepo, this.langCubit)
      : super(PlayercardsLoadingState()) {
    on<GetPlayerCardsEvent>(_onGetPlayerCardsEvent);
    on<GetPlayerCardsByIdEvent>(_onGetPlayerCardsByIdEvent);
  }

  _onGetPlayerCardsEvent(
      GetPlayerCardsEvent event, Emitter<PlayercardsState> emit) async {
    try {
      emit(PlayercardsLoadingState());
      final List<PlayerCardData> playerCards =
          await playerCardsRepo.getAllData(langCubit.state.locale);
      if (playerCards != null) {
        emit(PlayercardsLoadedState(playerCardList: playerCards));
      } else {
        emit(PlayercardsErrorState(errorMessage: 'playerCards is null'));
      }
    } catch (e) {
      emit(PlayercardsErrorState(errorMessage: e.toString()));
    }
  }

  _onGetPlayerCardsByIdEvent(
      GetPlayerCardsByIdEvent event, Emitter<PlayercardsState> emit) async {
    try {
      emit(PlayercardsLoadingState());
      final PlayerCardData playerCard =
          await playerCardsRepo.getDataById(event.id);
      if (playerCard != null) {
        emit(PlayercardsLoadedState(playerCardList: [playerCard]));
      } else {
        emit(PlayercardsErrorState(errorMessage: 'playerCard is null'));
      }
    } catch (e) {
      emit(PlayercardsErrorState(errorMessage: e.toString()));
    }
  }
}
