import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/notification_controller.dart';
import 'notification_event.dart';
import 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitialState()) {
    on<NotificationInitialEvent>(notificationInitialEvent);
    on<ClickToDetailNotificationEvent>(clickToDetailNotificationEvent);
    on<ClickToEditNotificationEvent>(clickToEditNotificationEvent);
    on<ClickToDeleteNotificationEvent>(clickToDeleteNotificationEvent);
    on<ClickToCreateNotificationEvent>(clickToCreateNotificationEvent);
  }

  FutureOr<void> notificationInitialEvent(
      NotificationInitialEvent event, Emitter<NotificationState> emit) async {
    emit(NotificationLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    NotificationController notificationController = NotificationController();
    emit(NotificationLoadedState(
        notifications: notificationController.notifications));
  }

  FutureOr<void> clickToDetailNotificationEvent(
      ClickToDetailNotificationEvent event, Emitter<NotificationState> emit) {
    emit(ClickToDetailNotificationState());
  }

  FutureOr<void> clickToEditNotificationEvent(
      ClickToEditNotificationEvent event, Emitter<NotificationState> emit) {
    emit(ClickToEditNotificationState());
  }

  FutureOr<void> clickToDeleteNotificationEvent(
      ClickToDeleteNotificationEvent event, Emitter<NotificationState> emit) {
    emit(ClickToDeleteNotificationState());
  }

  FutureOr<void> clickToCreateNotificationEvent(
      ClickToCreateNotificationEvent event, Emitter<NotificationState> emit) {
    emit(ClickToCreateNotificationState());
  }
}
