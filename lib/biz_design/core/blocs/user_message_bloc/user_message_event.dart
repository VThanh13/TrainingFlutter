import 'package:flutter/cupertino.dart';

@immutable
abstract class UserMessageEvent {}

class UserMessageInitialEvent extends UserMessageEvent{}

class CheckNameCardIsAcceptEvent extends UserMessageEvent{}