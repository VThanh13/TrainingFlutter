import 'package:flutter/cupertino.dart';

@immutable
abstract class NameCardEvent {}

class NameCardInitialEvent extends NameCardEvent{}

class ClickChangeNameCardEvent extends NameCardEvent{}

class ClickSendNameCardEvent extends NameCardEvent{}