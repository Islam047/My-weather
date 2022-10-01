part of 'internet_bloc.dart';

@immutable
abstract class InternetEvent {}
class InternetConnectionEvent extends InternetEvent{}

class InternetNotConnectionEvent extends InternetEvent{}
