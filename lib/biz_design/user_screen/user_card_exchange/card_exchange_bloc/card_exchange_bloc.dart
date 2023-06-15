import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:code/biz_design/user_screen/user_card_exchange/card_exchange_bloc/card_exchange_event.dart';
import 'package:code/biz_design/user_screen/user_card_exchange/card_exchange_bloc/card_exchange_state.dart';

class CardExchangeBloc extends Bloc<CardExchangeEvent, CardExchangeState>{
  CardExchangeBloc():super(CardExchangeInitialState()){
    on<CardExchangeInitialEvent>(cardExchangeInitialEvent);
    on<ClickToDetailCardEvent>(clickToDetailCardEvent);
  }

  FutureOr<void> cardExchangeInitialEvent(CardExchangeInitialEvent event, Emitter<CardExchangeState> emit) {
  emit(CardExchangeInitialState());
  }

  FutureOr<void> clickToDetailCardEvent(ClickToDetailCardEvent event, Emitter<CardExchangeState> emit) {
  emit(ClickToDetailCardState());
  }
}