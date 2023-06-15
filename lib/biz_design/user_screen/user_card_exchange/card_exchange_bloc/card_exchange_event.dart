import 'package:flutter/cupertino.dart';

@immutable
abstract class CardExchangeEvent{}

class CardExchangeInitialEvent extends CardExchangeEvent{}

class ClickToDetailCardEvent extends CardExchangeEvent{}