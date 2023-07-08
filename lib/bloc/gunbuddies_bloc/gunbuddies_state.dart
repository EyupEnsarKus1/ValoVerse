part of 'gunbuddies_bloc.dart';

abstract class GunbuddiesState {}

class GunbuddiesLoadingState extends GunbuddiesState {}

class GunbuddiesLoadedState extends GunbuddiesState {
  final List<BuddyData> gunBuddiesList;

  GunbuddiesLoadedState({required this.gunBuddiesList});
}

class GunbuddiesErrorState extends GunbuddiesState {
  final String errorMessage;

  GunbuddiesErrorState({required this.errorMessage});
}
