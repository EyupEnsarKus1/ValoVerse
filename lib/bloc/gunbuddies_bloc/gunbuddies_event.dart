part of 'gunbuddies_bloc.dart';

abstract class GunbuddiesEvent {}

class GetGunBudiesEvent extends GunbuddiesEvent {}

class GetGunBudiesByIdEvent extends GunbuddiesEvent {
  final String id;

  GetGunBudiesByIdEvent({required this.id});
}
