part of 'weapons_bloc.dart';

abstract class WeaponsState {}

class WeaponsLoadingState extends WeaponsState {}

class WeaponsLoadedState extends WeaponsState {
  final List<WeaponsData> weaponList;

  WeaponsLoadedState({required this.weaponList});
}

class WeaponsErrorState extends WeaponsState {
  final String errorMessage;

  WeaponsErrorState({required this.errorMessage});
}
