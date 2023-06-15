import 'dart:async';

import 'package:bloc/bloc.dart';

import 'blog_event.dart';
import 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState>{
  BlogBloc() :super(BlogInitialState()){
    on<BlogInitialEvent>(blogInitialEvent);
    on<BlogClickImageToBlogDetailEvent>(blogClickImageToBlogDetailEvent);
    on<BlogClickCommentToBlogDetailCommentEvent>(blogClickCommentToBlogDetailCommentEvent);
  }

  FutureOr<void> blogInitialEvent(BlogInitialEvent event, Emitter<BlogState> emit) {
    emit(BlogInitialState());
  }

  FutureOr<void> blogClickImageToBlogDetailEvent(BlogClickImageToBlogDetailEvent event, Emitter<BlogState> emit) {
    emit(BlogClickImageToBlogDetailState());
  }

  FutureOr<void> blogClickCommentToBlogDetailCommentEvent(BlogClickCommentToBlogDetailCommentEvent event, Emitter<BlogState> emit) {
    emit(BlogClickCommentToBlogDetailCommentState());
  }
}