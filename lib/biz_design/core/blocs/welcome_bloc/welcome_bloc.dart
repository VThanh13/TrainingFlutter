import 'dart:async';

import 'package:bloc/bloc.dart';

import 'welcome_event.dart';
import 'welcome_state.dart';

class Login1Bloc extends Bloc<Login1Event, Login1State>{
  Login1Bloc() : super(Login1Initial()){
    on<Login1InitialEvent>(login1InitialEvent);
    on<Login1NavigateLogin2Event>(login1NavigateLogin2Event);
    on<Login1NavigateExpScreenEvent>(login1NavigateExpScreenEvent);
  }

  FutureOr<void> login1InitialEvent(Login1InitialEvent event, Emitter<Login1State> emit) {
    emit(Login1Initial());
  }

  FutureOr<void> login1NavigateLogin2Event(Login1NavigateLogin2Event event, Emitter<Login1State> emit) {
    emit(Login1NavigateLogin2State());
  }

  FutureOr<void> login1NavigateExpScreenEvent(Login1NavigateExpScreenEvent event, Emitter<Login1State> emit) {
    emit(Login1NavigateExpScreenState());
  }
}