import 'package:flutter/cupertino.dart';

@immutable
abstract class NoticeManageEvent{}

class NoticeManageInitialEvent extends NoticeManageEvent{}

class ClickToNewsDeTailEvent extends NoticeManageEvent{}

class ClickToMovieDetailEvent extends NoticeManageEvent{}