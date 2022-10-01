part of 'home_bloc.dart';

// @immutable
// abstract class HomeState {
//   final bool behaviour;
//   final ForecastModel? forecastModel;
//   const HomeState(this.behaviour, this.forecastModel);
// }
//
// class HomeInitial extends HomeState {
//   const HomeInitial(super.behaviour,super.forecastModel);
// }
//
// class HomeChangeBGState extends HomeState {
//   const HomeChangeBGState(super.behaviour, super.forecastModel);
// }
//
// class HomeSuccessState extends HomeState {
//   final String successState;
//
//   const HomeSuccessState(this.successState) : super(false, null) ;
// }
//
// class HomeFailState extends HomeState {
//   final String errorState;
//
//   const HomeFailState(this.errorState) : super(false,null);
// }
//
// class HomeGetDataState extends HomeState {
//   const HomeGetDataState(super.behaviour, super.forecastModel);
//
//
// }
// class HomeLoadingState extends HomeState {
//   final bool isLoading;
//   const HomeLoadingState(this.isLoading) : super(false, null);
//
//
// }
//

class HomeState {
  bool? behaviour;
  ForecastModel? forecastModel;
  String? successState;
  String? errorState;
  bool? isLoading;

  HomeState({
     this.behaviour = false,
    this.forecastModel,
    this.successState,
    this.errorState,
    this.isLoading,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['behaviour'] = behaviour;
    if (forecastModel != null) {
      map['forecastModel'] = forecastModel?.toJson();
    }
    map['successState'] = successState;
    map['errorState'] = errorState;
    map['isLoading'] = isLoading;

    return map;

  }

  factory HomeState.fromMap(Map<String, dynamic> map) {
    return HomeState(
      behaviour: map['behaviour'] as bool,
      forecastModel : map['forecastModel'] != null ? ForecastModel.fromJson(map['forecastModel']) : null ,
      successState: map['successState'] as String,
      errorState: map['errorState'] as String,
      isLoading: map['isLoading'] as bool,
    );
  }
}
