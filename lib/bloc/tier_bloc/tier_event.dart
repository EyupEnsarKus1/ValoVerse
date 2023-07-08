part of 'tier_bloc.dart';

abstract class TierEvent {}

class GetTierEvent extends TierEvent {}

class GetTierByIdEvent extends TierEvent {
  final String id;

  GetTierByIdEvent({required this.id});
}
