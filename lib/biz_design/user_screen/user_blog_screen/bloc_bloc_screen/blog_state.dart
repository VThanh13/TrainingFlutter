import 'package:flutter/cupertino.dart';

@immutable
abstract class BlogState{}

abstract class BlogActionState extends BlogState{}

class BlogInitialState extends BlogState{}

class BlogClickImageToBlogDetailState extends BlogState{}

class BlogClickCommentToBlogDetailCommentState extends BlogState{}
