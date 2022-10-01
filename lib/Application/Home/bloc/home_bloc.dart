// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:my_weather/Data/Model/forecast_model.dart';
// import 'package:my_weather/Domain/home_repository.dart';
//
// part 'home_event.dart';
//
// part 'home_state.dart';
//
// class HomeBloc extends Bloc<HomeEvent, HomeState>  with HydratedMixin{
//   HomeRepository homeRepository = HomeRepository.instance;
//
//   HomeBloc() : super(const HomeInitial(false, null)) {
//     on<HomeChangeBackEvent>(onBehaviourChange);
//     on<HomeGetWeatherData>(getAllWeatherData);
//
//
//   }
//
//   void onBehaviourChange(
//       HomeChangeBackEvent event, Emitter<HomeState> emitter) {
//     emitter(HomeChangeBGState(event.behaviour, state.forecastModel));
//   }
//
//   Future<void> getAllWeatherData(
//       HomeGetWeatherData event, Emitter<HomeState> emitter) async {
//     ForecastModel? forecastModel = await homeRepository.getAllData();
//     if (forecastModel == null) {
//       emitter(const HomeFailState("Could not get the Weather data"));
//     } else {
//       emitter(HomeGetDataState(state.behaviour, forecastModel));
//     }
//   }
//
//   @override
//   HomeState? fromJson(Map<String, dynamic> json) {
//     return
//   }
//
//   @override
//   Map<String, dynamic>? toJson(HomeState state) {
//     // TODO: implement toJson
//     throw UnimplementedError();
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:my_weather/Data/Model/forecast_model.dart';
import 'package:my_weather/Domain/home_repository.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends HydratedBloc<HomeEvent, HomeState> {
  HomeRepository homeRepository = HomeRepository.instance;

  HomeBloc() : super(HomeState()) {
    on<HomeChangeBackEvent>(onBehaviourChange);
    on<HomeGetWeatherData>(getAllWeatherData);
  }

  void onBehaviourChange(
      HomeChangeBackEvent event, Emitter<HomeState> emitter) {
    emitter(HomeState(
        behaviour: event.behaviour, forecastModel: state.forecastModel));
  }

  Future<void> getAllWeatherData(
      HomeGetWeatherData event, Emitter<HomeState> emitter) async {
    try {
      ForecastModel? forecastModel = await homeRepository.getAllData();
      if (forecastModel == null) {
        emitter(HomeState(errorState: "Could not get the Weather data"));
      } else {
        emitter(HomeState(
            behaviour: state.behaviour, forecastModel: forecastModel));
      }
    } catch (e) {
      // LogService.w("Inside Function ${state.behaviour}");
      // emitter(HomeState(
      //     behaviour: state.behaviour, forecastModel: state.forecastModel));
    }
  }

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    return HomeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) {
    // LogService.v("toJson: ${state.forecastModel?.toJson()}");
    if (state == HomeState()) {
      return state.toMap();
    }
    return null;
  }
}
