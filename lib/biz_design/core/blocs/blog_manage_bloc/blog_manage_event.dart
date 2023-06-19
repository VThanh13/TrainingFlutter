import 'package:flutter/cupertino.dart';

@immutable
abstract class BlogManageEvent{}

class BlogManageInitialEvent extends BlogManageEvent{}

class ClickToCommentBlogEvent extends BlogManageEvent{}

class ClickToCreateBlogEvent extends BlogManageEvent{}