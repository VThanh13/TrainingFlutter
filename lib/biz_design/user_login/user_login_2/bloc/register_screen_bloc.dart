import 'dart:async';

import 'package:bloc/bloc.dart';

import 'register_screen_event.dart';
import 'register_screen_state.dart';

class ExpScreenBloc extends Bloc<ExpScreenEvent, ExpScreenState>{
  ExpScreenBloc() : super(ExpScreenInitial()){
    on<ExpScreenInitialEvent>(expScreenInitialEvent);
    on<ExpScreenNavigateLogin2Event>(expScreenNavigateLogin2Event);
  }

  FutureOr<void> expScreenInitialEvent(ExpScreenInitialEvent event, Emitter<ExpScreenState> emit) {
    emit(ExpScreenInitial());
  }

  FutureOr<void> expScreenNavigateLogin2Event(ExpScreenNavigateLogin2Event event, Emitter<ExpScreenState> emit) {
    emit(ExpScreenNavigateLogin2State());
  }
}