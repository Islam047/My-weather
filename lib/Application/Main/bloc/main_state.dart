part of 'main_bloc.dart';

abstract class MainState {
  final int index;
  const MainState(this.index);
}

class MainInitial extends MainState {
  MainInitial(super.index);

}
class MainChangePageState extends MainState{
  MainChangePageState(super.index);
}


