import 'package:flutter/cupertino.dart';

@immutable
abstract class EventCommunityEvent{}

class EventCommunityInitialEvent extends EventCommunityEvent{}


class ClickToEventCommunityDetailEvent extends EventCommunityEvent{}

class ClickToEventCommunityPeopleEvent extends EventCommunityEvent{}