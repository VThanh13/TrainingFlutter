import 'dart:async';

import 'package:bloc/bloc.dart';
import 'video_manage_event.dart';
import 'video_manage_state.dart';

class VideoManageBloc extends Bloc<VideoManageEvent, VideoManageState> {
  VideoManageBloc() : super(VideoManageInitialState()) {
    on<VideoManageInitialEvent>(videoManageInitialEvent);
    on<ClickToCreateVideoEvent>(clickToCreateVideoEvent);
  }

  FutureOr<void> videoManageInitialEvent(
      VideoManageInitialEvent event, Emitter<VideoManageState> emit) {
    emit(VideoManageInitialState());
  }

  FutureOr<void> clickToCreateVideoEvent(
      ClickToCreateVideoEvent event, Emitter<VideoManageState> emit) {
    emit(ClickToCreateVideoState());
  }
}
