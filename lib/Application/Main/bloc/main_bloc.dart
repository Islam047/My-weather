import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/Data/NotificationProvider/notification_provider.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  MainBloc() : super(MainInitial(1)) {
    initBloc();
    on<MainChangePageEvent>(changeMainPage);
  }

  void initBloc() async {
    await NotificationService.init(initScheduled:true);
    NotificationService.showScheduledNotification(title: "Start planning your day with the weather today",body: "Plans can easily be broken with only an umbrella which was forgotten.",payload: "Payload");
  }

  void changeMainPage(MainChangePageEvent event, Emitter<MainState> emitter) {
    emitter(MainChangePageState(event.index));
  }
}
