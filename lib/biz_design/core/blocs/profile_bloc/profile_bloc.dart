// ignore_for_file: unnecessary_type_check

import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../controller/user_controller.dart';
import '../../../models/user_model/user_model.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState()) {
    on<ProfileInitialEvent>(profileInitialEvent);
  }
  UserModel user = UserModel(
    businessComment: [],
    industryConnect: [],
    area: [],
    career: {},
    personSkill: [],
    qualification: '',
    director: '',
    annualIncome: '',
    asset: '',
    placeOfBirth: '',
    hobby: '',
    id: '',
  );
  List<String> listCareer = [];

  FutureOr<void> profileInitialEvent(
      ProfileInitialEvent event, Emitter<ProfileState> emit) async {
    UserController userController = UserController();
    if (event is ProfileInitialEvent) {
      emit(ProfileLoadingState());
      try {
        await userController.getUserInfo();
        user = userController.userModel;
        listCareer = userController.list;
        if (user.id != '') {
          emit(ProfileLoadedState(user: user));
        } else {
          emit(ProfileErrorState());
        }
      } catch (e) {
        emit(ProfileErrorState());
      }
    }
  }
}
