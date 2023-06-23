import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_inform_event.dart';
import 'user_inform_state.dart';

class UserInformBloc extends Bloc<UserInformEvent, UserInformState> {
  UserInformBloc() : super(UserInformInitialState()) {
    on<UserInformInitialEvent>(userInformInitialEvent);
    on<ClickToUserNotificationDetailEvent>(clickToUserNotificationDetailEvent);
  }

  FutureOr<void> userInformInitialEvent(
      UserInformInitialEvent event, Emitter<UserInformState> emit) {
    emit(UserInformInitialState());
  }

  FutureOr<void> clickToUserNotificationDetailEvent(
      ClickToUserNotificationDetailEvent event, Emitter<UserInformState> emit) {
    emit(ClickToUserNotificationDetailState());
  }
}
