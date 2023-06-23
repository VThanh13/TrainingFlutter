import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'blog_manage_event.dart';
import 'blog_manage_state.dart';

class BlogManageBloc extends Bloc<BlogManageEvent, BlogManageState> {
  BlogManageBloc() : super(BlogManageInitialState()) {
    on<BlogManageInitialEvent>(blogManageInitialEvent);
    on<ClickToCommentBlogEvent>(clickToCommentBlogEvent);
    on<ClickToCreateBlogEvent>(clickToCreateBlogEvent);
  }

  FutureOr<void> blogManageInitialEvent(
      BlogManageInitialEvent event, Emitter<BlogManageState> emit) {
    emit(BlogManageInitialState());
  }

  FutureOr<void> clickToCommentBlogEvent(
      ClickToCommentBlogEvent event, Emitter<BlogManageState> emit) {
    emit(ClickToCommentBlogState());
  }

  FutureOr<void> clickToCreateBlogEvent(
      ClickToCreateBlogEvent event, Emitter<BlogManageState> emit) {
    emit(ClickToCreateBlogState());
  }
}
