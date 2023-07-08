part of 'maps_bloc.dart';

abstract class MapsState {}

class MapsLoadingState extends MapsState {}

class MapsLoadedState extends MapsState {
  final List<MapData> mapList;

  MapsLoadedState({required this.mapList});
}

class MapsErrorState extends MapsState {
  final String errorMessage;

  MapsErrorState({required this.errorMessage});
}
