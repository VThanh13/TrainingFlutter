import 'package:flutter/cupertino.dart';

@immutable
abstract class EventManageEvent{}

class EventManageInitialEvent extends EventManageEvent{}

class ClickToCreateGroupEvent extends EventManageEvent{}

class ClickToChooseCateEvent extends EventManageEvent{}

class ClickToDetailEvent extends EventManageEvent{}

class ClickToPeopleGroupEvent extends EventManageEvent{}