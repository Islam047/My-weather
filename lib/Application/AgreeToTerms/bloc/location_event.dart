part of 'location_bloc.dart';

@immutable
abstract class LocationEvent {}

class GetUserLocationEvent extends LocationEvent{
 GetUserLocationEvent();
}

