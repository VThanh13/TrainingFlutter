import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:code/biz_design/core/blocs/event_manage_bloc/event_manage_event.dart';
import 'package:code/biz_design/core/blocs/event_manage_bloc/event_manage_state.dart';

class EventManageBloc extends Bloc<EventManageEvent, EventManageState>{
  EventManageBloc():super(EventManageInitialState()){
    on<EventManageInitialEvent>(eventManageInitialEvent);
    on<ClickToCreateGroupEvent>(clickToCreateGroupEvent);
    on<ClickToChooseCateEvent>(clickToChooseCateEvent);
  }

  FutureOr<void> eventManageInitialEvent(EventManageInitialEvent event, Emitter<EventManageState> emit) {
  emit(EventManageInitialState());
  }

  FutureOr<void> clickToCreateGroupEvent(ClickToCreateGroupEvent event, Emitter<EventManageState> emit) {
  emit(ClickToCreateGroupState());
  }

  FutureOr<void> clickToChooseCateEvent(ClickToChooseCateEvent event, Emitter<EventManageState> emit) {
  emit(ClickToChooseCateState());
  }
}