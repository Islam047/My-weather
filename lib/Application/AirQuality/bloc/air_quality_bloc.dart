import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'air_quality_event.dart';
part 'air_quality_state.dart';

class AirQualityBloc extends Bloc<AirQualityEvent, AirQualityState> {
  AirQualityBloc() : super(AirQualityInitial()) {
    on<AirQualityEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
