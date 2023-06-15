import 'package:flutter/cupertino.dart';

@immutable
abstract class EventCommunityState{}

abstract class EventCommunityActionState extends EventCommunityState{}

class EventCommunityInitialState extends EventCommunityState{}

class ClickToEventCommunityDetailState extends EventCommunityState{}

class ClickToEventCommunityPeopleState extends EventCommunityState{}
