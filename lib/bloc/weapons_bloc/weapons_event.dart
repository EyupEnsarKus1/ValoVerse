part of 'weapons_bloc.dart';

abstract class WeaponsEvent {}

class GetWeaponsEvent extends WeaponsEvent {}

class GetWeaponsByIdEvent extends WeaponsEvent {
  final String id;

  GetWeaponsByIdEvent({required this.id});
}
