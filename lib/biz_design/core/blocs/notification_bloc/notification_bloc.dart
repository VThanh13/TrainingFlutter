import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/notification_controller.dart';
import '../../../models/notification_model/notification_model.dart';
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

  List<NotificationModel> notifications = [];
  List<NotificationModel> moreItems = [];

  FutureOr<void> notificationInitialEvent(
      NotificationInitialEvent event, Emitter<NotificationState> emit) async {
    emit(NotificationLoadingState());
    NotificationController notificationController = NotificationController();

    try {
      await notificationController.getNotifications();
      notifications = notificationController.notifications;
      moreItems = notificationController.moreItems;
      emit(NotificationLoadedState(
          notifications: notificationController.notifications));
    } catch (e) {
      emit(NotificationErrorState());
    }
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
