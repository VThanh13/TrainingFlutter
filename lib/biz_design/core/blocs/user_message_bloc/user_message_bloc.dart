import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:code/biz_design/core/blocs/user_message_bloc/user_message_event.dart';
import 'package:code/biz_design/core/blocs/user_message_bloc/user_message_state.dart';

class UserMessageBloc extends Bloc<UserMessageEvent, UserMessageState>{
  UserMessageBloc() :super(UserMessageInitialState()){
    on<UserMessageInitialEvent>(userMessageInitialEvent);
    on<CheckNameCardIsAcceptEvent>(checkNameCardIsAcceptEvent);
  }

  FutureOr<void> userMessageInitialEvent(UserMessageInitialEvent event, Emitter<UserMessageState> emit) {
  emit(UserMessageInitialState());
  }

  FutureOr<void> checkNameCardIsAcceptEvent(CheckNameCardIsAcceptEvent event, Emitter<UserMessageState> emit) {
  emit(CheckNameCardIsAcceptState());
  }
}