import 'package:flutter/foundation.dart';

import '../../../models/notification_model/notification_model.dart';

@immutable
abstract class NotificationState {}

abstract class NotificationActionState extends NotificationState {}

class NotificationInitialState extends NotificationState {}

class NotificationLoadingState extends NotificationState {}

class NotificationLoadedState extends NotificationState {
  final List<NotificationModel> notifications;
  NotificationLoadedState({
    required this.notifications,
  });
}

class NotificationErrorState extends NotificationState {}

class ClickToDetailNotificationState extends NotificationState {}

class ClickToEditNotificationState extends NotificationState {}

class ClickToCreateNotificationState extends NotificationState {}

class ClickToDeleteNotificationState extends NotificationState {}
