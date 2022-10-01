import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'elevation_event.dart';
part 'elevation_state.dart';

class ElevationBloc extends Bloc<ElevationEvent, ElevationState> {
  ElevationBloc() : super(ElevationInitial()) {
    on<ElevationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
