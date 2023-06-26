import '../../../models/user_model/user_model.dart';

abstract class ProfileState {}

abstract class ProfileActionState extends ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final UserModel user;
  ProfileLoadedState({
    required this.user,
  });
}

class ProfileErrorState extends ProfileState {}
