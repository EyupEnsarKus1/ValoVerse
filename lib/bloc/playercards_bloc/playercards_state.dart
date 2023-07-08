part of 'playercards_bloc.dart';

abstract class PlayercardsState {}

class PlayercardsLoadingState extends PlayercardsState {}

class PlayercardsLoadedState extends PlayercardsState {
  final List<PlayerCardData> playerCardList;

  PlayercardsLoadedState({required this.playerCardList});
}

class PlayercardsErrorState extends PlayercardsState {
  final String errorMessage;

  PlayercardsErrorState({required this.errorMessage});
}
