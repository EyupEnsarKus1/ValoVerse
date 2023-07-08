part of 'playercards_bloc.dart';

abstract class PlayercardsEvent {}

class GetPlayerCardsEvent extends PlayercardsEvent {}

class GetPlayerCardsByIdEvent extends PlayercardsEvent {
  final String id;

  GetPlayerCardsByIdEvent({required this.id});
}
