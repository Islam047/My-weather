part of 'air_quality_bloc.dart';

abstract class AirQualityState extends Equatable {
  const AirQualityState();
}

class AirQualityInitial extends AirQualityState {
  @override
  List<Object> get props => [];
}
