import 'package:flutter/cupertino.dart';

@immutable
abstract class Login1Event{}

class Login1InitialEvent extends Login1Event{}

class Login1NavigateLogin2Event extends Login1Event{}

class Login1NavigateExpScreenEvent extends Login1Event{}