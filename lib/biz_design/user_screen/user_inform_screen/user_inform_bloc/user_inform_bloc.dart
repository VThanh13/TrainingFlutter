import 'dart:async';

import 'package:code/biz_design/user_screen/user_inform_screen/user_inform_bloc/user_inform_event.dart';
import 'package:code/biz_design/user_screen/user_inform_screen/user_inform_bloc/user_inform_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInformBloc extends Bloc<UserInformEvent, UserInformState>{
  UserInformBloc() :super(UserInformInitialState()){
    on<UserInformInitialEvent>(userInformInitialEvent);
    on<ClickToUserNotificationDetailEvent>(clickToUserNotificationDetailEvent);
  }

  FutureOr<void> userInformInitialEvent(UserInformInitialEvent event, Emitter<UserInformState> emit) {
    emit(UserInformInitialState());
  }

  FutureOr<void> clickToUserNotificationDetailEvent(ClickToUserNotificationDetailEvent event, Emitter<UserInformState> emit) {
  emit(ClickToUserNotificationDetailState());
  }
}