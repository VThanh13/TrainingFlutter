import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../controller/user_controller.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState()) {
    on<ProfileInitialEvent>(profileInitialEvent);
  }

  FutureOr<void> profileInitialEvent(
      ProfileInitialEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    UserController userController = UserController();
    await userController
        .getUserInfo()
        .then((value) => userController.userModel);
    emit(ProfileLoadedState(user: userController.userModel));
  }
}
