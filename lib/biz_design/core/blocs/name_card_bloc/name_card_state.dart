import 'package:flutter/cupertino.dart';

@immutable
abstract class NameCardState{}

abstract class NameCardActionState extends NameCardState{}

class NameCardInitialState extends NameCardState{}

class ClickChangeNameCardState extends NameCardState{}

class ClickSendNameCardState extends NameCardState{}