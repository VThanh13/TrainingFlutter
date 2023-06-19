import 'dart:async';

import 'package:code/biz_design/core/blocs/blog_manage_bloc/blog_manage_state.dart';
import 'package:code/biz_design/core/blocs/blog_manage_bloc/blog_manage_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogManageBloc extends Bloc<BlogManageEvent, BlogManageState>{
  BlogManageBloc():super(BlogManageInitialState()){
    on<BlogManageInitialEvent>(blogManageInitialEvent);
    on<ClickToCommentBlogEvent>(clickToCommentBlogEvent);
    on<ClickToCreateBlogEvent>(clickToCreateBlogEvent);
  }

  FutureOr<void> blogManageInitialEvent(BlogManageInitialEvent event, Emitter<BlogManageState> emit) {
  emit(BlogManageInitialState());
  }

  FutureOr<void> clickToCommentBlogEvent(ClickToCommentBlogEvent event, Emitter<BlogManageState> emit) {
  emit(ClickToCommentBlogState());
  }

  FutureOr<void> clickToCreateBlogEvent(ClickToCreateBlogEvent event, Emitter<BlogManageState> emit) {
  emit(ClickToCreateBlogState());
  }
}