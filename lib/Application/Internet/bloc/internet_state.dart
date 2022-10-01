part of 'internet_bloc.dart';

@immutable
abstract class InternetState {}


class InternetLoadingState extends InternetState {
  final bool loading;
  InternetLoadingState(this.loading) ;
}

class InternetConnectedState extends InternetState {
  final String message;
  InternetConnectedState(this.message) ;
}

class InternetDisconnectedState extends InternetState {
  final String message;
  InternetDisconnectedState(this.message) ;
}