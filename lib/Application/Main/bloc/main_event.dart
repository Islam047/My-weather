part of 'main_bloc.dart';

abstract class MainEvent {
  const MainEvent();
}

class MainChangePageEvent extends MainEvent {
  final int index;
  final BuildContext context;

  const MainChangePageEvent(this.index, this.context);
}


