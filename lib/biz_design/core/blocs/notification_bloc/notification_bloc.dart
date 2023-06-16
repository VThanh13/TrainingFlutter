import 'dart:async';

import 'package:code/biz_design/core/blocs/notification_bloc/notification_event.dart';
import 'package:code/biz_design/core/blocs/notification_bloc/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState>{
  NotificationBloc(): super(NotificationInitialState()){
    on<NotificationInitialEvent>(notificationInitialEvent);
    on<ClickToDetailNotificationEvent>(clickToDetailNotificationEvent);
    on<ClickToEditNotificationEvent>(clickToEditNotificationEvent);
  }

  FutureOr<void> notificationInitialEvent(NotificationInitialEvent event, Emitter<NotificationState> emit) {
  emit(NotificationInitialState());
  }

  FutureOr<void> clickToDetailNotificationEvent(ClickToDetailNotificationEvent event, Emitter<NotificationState> emit) {
  emit(ClickToDetailNotificationState());
  }

  FutureOr<void> clickToEditNotificationEvent(ClickToEditNotificationEvent event, Emitter<NotificationState> emit) {
  emit(ClickToEditNotificationState());
  }
}