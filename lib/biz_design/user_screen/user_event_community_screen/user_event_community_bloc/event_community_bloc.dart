import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:code/biz_design/user_screen/user_event_community_screen/user_event_community_bloc/event_community_event.dart';
import 'package:code/biz_design/user_screen/user_event_community_screen/user_event_community_bloc/event_community_state.dart';

class EventCommunityBloc extends Bloc<EventCommunityEvent, EventCommunityState>{
  EventCommunityBloc() :super(EventCommunityInitialState()){
    on<EventCommunityInitialEvent>(eventCommunityInitialEvent);
    on<ClickToEventCommunityDetailEvent>(clickToEventCommunityDetailEvent);
    on<ClickToEventCommunityPeopleEvent>(clickToEventCommunityPeopleEvent);
  }

  FutureOr<void> eventCommunityInitialEvent(EventCommunityInitialEvent event, Emitter<EventCommunityState> emit) {
  emit(EventCommunityInitialState());
  }

  FutureOr<void> clickToEventCommunityDetailEvent(ClickToEventCommunityDetailEvent event, Emitter<EventCommunityState> emit) {
    emit(ClickToEventCommunityDetailState());
  }

  FutureOr<void> clickToEventCommunityPeopleEvent(ClickToEventCommunityPeopleEvent event, Emitter<EventCommunityState> emit) {
  emit(ClickToEventCommunityPeopleState());
  }
}