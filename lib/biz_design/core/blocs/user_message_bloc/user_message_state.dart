import 'package:flutter/cupertino.dart';

@immutable
abstract class UserMessageState{}

abstract class UserMessageActionState extends UserMessageState{}

class UserMessageInitialState extends UserMessageState{}

class CheckNameCardIsAcceptState extends UserMessageState{}