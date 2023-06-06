import 'package:flutter/cupertino.dart';

@immutable
abstract class BlogEvent{}

class BlogInitialEvent extends BlogEvent{}

class BlogClickImageToBlogDetailEvent extends BlogEvent{}

class BlogClickCommentToBlogDetailCommentEvent extends BlogEvent{}