part of 'tier_bloc.dart';

abstract class TierState {}

class TierLoadingState extends TierState {}

class TierLoadedState extends TierState {
  final List<CompetitiveTierData> tierList;

  TierLoadedState({required this.tierList});
}

class TierErrorState extends TierState {
  final String errorMessage;

  TierErrorState({required this.errorMessage});
}
