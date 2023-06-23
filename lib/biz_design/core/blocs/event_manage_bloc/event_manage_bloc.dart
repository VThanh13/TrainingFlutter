import 'dart:async';

import 'package:bloc/bloc.dart';
import 'event_manage_event.dart';
import 'event_manage_state.dart';

class EventManageBloc extends Bloc<EventManageEvent, EventManageState> {
  EventManageBloc() : super(EventManageInitialState()) {
    on<EventManageInitialEvent>(eventManageInitialEvent);
    on<ClickToCreateGroupEvent>(clickToCreateGroupEvent);
    on<ClickToChooseCateEvent>(clickToChooseCateEvent);
    on<ClickToDetailEvent>(clickToDetailEvent);
    on<ClickToPeopleGroupEvent>(clickToPeopleGroupEvent);
  }

  FutureOr<void> eventManageInitialEvent(
      EventManageInitialEvent event, Emitter<EventManageState> emit) {
    emit(EventManageInitialState());
  }

  FutureOr<void> clickToCreateGroupEvent(
      ClickToCreateGroupEvent event, Emitter<EventManageState> emit) {
    emit(ClickToCreateGroupState());
  }

  FutureOr<void> clickToChooseCateEvent(
      ClickToChooseCateEvent event, Emitter<EventManageState> emit) {
    emit(ClickToChooseCateState());
  }

  FutureOr<void> clickToDetailEvent(
      ClickToDetailEvent event, Emitter<EventManageState> emit) {
    emit(ClickToDetailEventState());
  }

  FutureOr<void> clickToPeopleGroupEvent(
      ClickToPeopleGroupEvent event, Emitter<EventManageState> emit) {
    emit(ClickToPeopleGroupState());
  }
}
