import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:code/biz_design/user_screen/profile_setting/profile_setting_bloc/profile_setting_event.dart';
import 'package:code/biz_design/user_screen/profile_setting/profile_setting_bloc/profile_setting_state.dart';

class ProfileSettingBloc extends Bloc<ProfileSettingEvent, ProfileSettingState>{
  ProfileSettingBloc():super(ProfileSettingInitialState()){
    on<ProfileSettingInitialEvent>(profileSettingInitialEvent);
    on<ClickToActiveProfileEvent>(clickToActiveProfileEvent);
  }

  FutureOr<void> profileSettingInitialEvent(ProfileSettingInitialEvent event, Emitter<ProfileSettingState> emit) {
  emit(ProfileSettingInitialState());
  }

  FutureOr<void> clickToActiveProfileEvent(ClickToActiveProfileEvent event, Emitter<ProfileSettingState> emit) {
  emit(ClickToActiveProfileState());
  }
}