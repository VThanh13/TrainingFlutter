import 'package:flutter/cupertino.dart';

@immutable
abstract class UserInformState{}

abstract class UserInformActionState extends UserInformState{}

class UserInformInitialState extends UserInformState{}

class ClickToUserNotificationDetailState extends UserInformState{}