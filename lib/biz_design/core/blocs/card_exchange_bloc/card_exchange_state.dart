
import '../../../models/card_exchange_model/card_exchange_model.dart';

abstract class CardExchangeState{}

abstract class CardExchangeActionState extends CardExchangeState{}

class CardExchangeInitialState extends CardExchangeState{
}

class CardLoadedSuccessState extends CardExchangeState{
  final List<CardExchangeModel> cards;
  CardLoadedSuccessState({
    required this.cards
  });
}

class ClickToDetailCardState extends CardExchangeState{}

class ClickToSendCardRequestState extends CardExchangeState{}

class ClickToSearchCardState extends CardExchangeState{}