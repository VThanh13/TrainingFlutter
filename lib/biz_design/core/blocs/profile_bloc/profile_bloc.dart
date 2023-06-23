import 'dart:async';

import 'package:bloc/bloc.dart';

import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState()) {
    on<ProfileInitialEvent>(profileInitialEvent);
  }

  FutureOr<void> profileInitialEvent(
      ProfileInitialEvent event, Emitter<ProfileState> emit) {
    emit(ProfileInitialState());
  }
}
