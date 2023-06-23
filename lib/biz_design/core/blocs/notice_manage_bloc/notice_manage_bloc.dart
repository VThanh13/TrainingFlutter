import 'dart:async';

import 'package:bloc/bloc.dart';
import 'notice_manage_event.dart';
import 'notice_manage_state.dart';

class NoticeManageBloc extends Bloc<NoticeManageEvent, NoticeManageState> {
  NoticeManageBloc() : super(NoticeManageInitialState()) {
    on<NoticeManageInitialEvent>(noticeManageInitialEvent);
    on<ClickToNewsDeTailEvent>(clickToNewsDeTailEvent);
    on<ClickToMovieDetailEvent>(clickToMovieDetailEvent);
  }

  FutureOr<void> noticeManageInitialEvent(
      NoticeManageInitialEvent event, Emitter<NoticeManageState> emit) {
    emit(NoticeManageInitialState());
  }

  FutureOr<void> clickToNewsDeTailEvent(
      ClickToNewsDeTailEvent event, Emitter<NoticeManageState> emit) {
    emit(ClickToNewsDetailState());
  }

  FutureOr<void> clickToMovieDetailEvent(
      ClickToMovieDetailEvent event, Emitter<NoticeManageState> emit) {
    emit(ClickToVideoDetailState());
  }
}
