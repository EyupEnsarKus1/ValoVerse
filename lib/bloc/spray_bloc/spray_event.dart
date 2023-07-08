part of 'spray_bloc.dart';

abstract class SprayEvent {}

class GetSpraysEvent extends SprayEvent {}

class GetSpraysByIdEvent extends SprayEvent {
  final String id;

  GetSpraysByIdEvent({required this.id});
}
