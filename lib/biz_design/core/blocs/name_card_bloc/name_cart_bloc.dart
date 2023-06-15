import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'name_card_event.dart';
import 'name_card_state.dart';

class NameCardBloc extends Bloc<NameCardEvent, NameCardState>{
  NameCardBloc() :super(NameCardInitialState()){
    on<NameCardInitialEvent>(nameCardInitialEvent);
    on<ClickChangeNameCardEvent>(clickChangeNameCardEvent);
    on<ClickSendNameCardEvent>(clickSendNameCardEvent);
  }

  FutureOr<void> nameCardInitialEvent(NameCardInitialEvent event, Emitter<NameCardState> emit) {
    emit(NameCardInitialState());
  }

  FutureOr<void> clickChangeNameCardEvent(ClickChangeNameCardEvent event, Emitter<NameCardState> emit) {
  emit(ClickChangeNameCardState());
  }

  FutureOr<void> clickSendNameCardEvent(ClickSendNameCardEvent event, Emitter<NameCardState> emit) {
  emit(ClickSendNameCardState());
  }
}