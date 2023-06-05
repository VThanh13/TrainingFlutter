import 'package:flutter/cupertino.dart';

@immutable
abstract class Login1State {}

abstract class Login1ActionState extends Login1State{}

class Login1Initial extends Login1State {}

class Login1NavigateLogin2State extends Login1ActionState{}

class Login1NavigateExpScreenState extends Login1ActionState{}