import 'package:flutter/cupertino.dart';

@immutable
abstract class UserInformEvent {}

class UserInformInitialEvent extends UserInformEvent{}

class ClickToUserNotificationDetailEvent extends UserInformEvent{}
