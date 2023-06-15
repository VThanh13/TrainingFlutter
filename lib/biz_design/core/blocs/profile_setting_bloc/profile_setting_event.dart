import 'package:flutter/cupertino.dart';

@immutable
abstract class ProfileSettingEvent{}

class ProfileSettingInitialEvent extends ProfileSettingEvent{}

class ClickToActiveProfileEvent extends ProfileSettingEvent{}
