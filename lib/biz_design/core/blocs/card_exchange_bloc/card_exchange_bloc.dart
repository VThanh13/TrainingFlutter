import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../core/data/card_exchange_data.dart';
import '../../../models/card_exchange_model/card_exchange_model.dart';
import 'card_exchange_event.dart';
import 'card_exchange_state.dart';

class CardExchangeBloc extends Bloc<CardExchangeEvent, CardExchangeState>{
  CardExchangeBloc():super(CardExchangeInitialState()){
    on<CardExchangeInitialEvent>(cardExchangeInitialEvent);
    on<ClickToDetailCardEvent>(clickToDetailCardEvent);
    on<ClickToSendCardRequestEvent>(clickToSendCardRequestEvent);
    on<ClickToSearchCardEvent>(clickToSearchCardEvent);
  }

  FutureOr<void> cardExchangeInitialEvent(CardExchangeInitialEvent event, Emitter<CardExchangeState> emit) {
  emit(CardLoadedSuccessState(
      cards: CardData.cardData.map((e) =>
      CardExchangeModel(
      name: e['name'],
      status: e['status'],
      image: e['image'],
      description: e['description'])).toList()
    ));
  }

  FutureOr<void> clickToDetailCardEvent(ClickToDetailCardEvent event, Emitter<CardExchangeState> emit) {
  emit(ClickToDetailCardState());
  }

  FutureOr<void> clickToSendCardRequestEvent(ClickToSendCardRequestEvent event, Emitter<CardExchangeState> emit) {
  emit(ClickToSendCardRequestState());
  }

  FutureOr<void> clickToSearchCardEvent(ClickToSearchCardEvent event, Emitter<CardExchangeState> emit) {
  emit(ClickToSearchCardState());
  }
}