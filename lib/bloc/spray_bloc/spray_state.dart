part of 'spray_bloc.dart';

abstract class SprayState {}

class SprayLoadingState extends SprayState {}

class SprayLoadedState extends SprayState {
  final List<SprayData> sprayList;

  SprayLoadedState({required this.sprayList});
}

class SprayErrorState extends SprayState {
  final String errorMessage;

  SprayErrorState({required this.errorMessage});
}
