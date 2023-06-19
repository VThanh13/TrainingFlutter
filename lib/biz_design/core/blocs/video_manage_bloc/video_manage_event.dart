import 'package:flutter/cupertino.dart';

@immutable
abstract class VideoManageEvent{}

class VideoManageInitialEvent extends VideoManageEvent{}

class ClickToCreateVideoEvent extends VideoManageEvent{}