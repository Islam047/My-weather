part of 'location_bloc.dart';

@immutable
abstract class LocationState {
  final String locationPlace;
  const LocationState(this.locationPlace);
}

class LocationInitial extends LocationState {
  const LocationInitial(super.locationPlace);
}

class LocationIndicatorState extends LocationState {
  const LocationIndicatorState(super.locationPlace);
}
