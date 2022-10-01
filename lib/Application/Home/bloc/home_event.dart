part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeChangeBackEvent extends HomeEvent {
  final bool behaviour;

  HomeChangeBackEvent(this.behaviour);
}

class HomeGetWeatherData extends HomeEvent {}
