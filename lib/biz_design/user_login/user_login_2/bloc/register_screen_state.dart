import 'package:flutter/cupertino.dart';

@immutable
abstract class ExpScreenState {}

abstract class ExpScreenActionState extends ExpScreenState{}

class ExpScreenInitial extends ExpScreenState {}

class ExpScreenNavigateLogin2State extends ExpScreenActionState{}

