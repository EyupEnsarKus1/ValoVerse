part of 'maps_bloc.dart';

abstract class MapsEvent {}

class GetMapsEvent extends MapsEvent {}

class GetMapByIdEvent extends MapsEvent {
  final String id;

  GetMapByIdEvent({required this.id});
}
