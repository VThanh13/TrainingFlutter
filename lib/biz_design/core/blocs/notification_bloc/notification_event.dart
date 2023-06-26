import 'package:flutter/cupertino.dart';

@immutable
abstract class NotificationEvent {}

class NotificationInitialEvent extends NotificationEvent {}

class ClickToDetailNotificationEvent extends NotificationEvent {}

class ClickToEditNotificationEvent extends NotificationEvent {}

class ClickToDeleteNotificationEvent extends NotificationEvent {}

class ClickToCreateNotificationEvent extends NotificationEvent {}
