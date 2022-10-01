

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/Utilities/LogProvider/log_provider.dart';
part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {

  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  InternetBloc() : super(InternetLoadingState(true)) {
    on<InternetConnectionEvent>(internetConnected);
    on<InternetNotConnectionEvent>(internetDisconnected);

    connectivitySubscription = connectivity.onConnectivityChanged.listen(checkNetwork);
    firstCheckInternet();
  }

  void internetConnected(InternetConnectionEvent event, Emitter<InternetState> emitter){
    emitter(InternetConnectedState("Connected..."));
  }
  void internetDisconnected(InternetNotConnectionEvent event, Emitter<InternetState> emitter){
    emitter(InternetDisconnectedState("Connect your internet to get the recent data..."));
  }

  void checkNetwork(ConnectivityResult internet) {
    if (internet == ConnectivityResult.mobile || internet == ConnectivityResult.wifi) {
      add(InternetConnectionEvent());
    }
    else if(internet == ConnectivityResult.none)  {
      add(InternetNotConnectionEvent());
    }
  }

  void firstCheckInternet() async {

    ConnectivityResult result = await connectivity.checkConnectivity();
    if(result == ConnectivityResult.none) {
      LogService.v("Was here firstCheckInternet");

      checkNetwork(result);
    }
  }

  @override
  Future<void> close() {
    connectivitySubscription.cancel();
    return super.close();
  }
}
