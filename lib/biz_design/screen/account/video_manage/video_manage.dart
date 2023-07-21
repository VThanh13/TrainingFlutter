import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/video_manage_bloc/video_manage_bloc.dart';
import '../../../core/blocs/video_manage_bloc/video_manage_event.dart';
import '../../../core/blocs/video_manage_bloc/video_manage_state.dart';
import 'create_video.dart';

class VideoManageScreen extends StatefulWidget {
  const VideoManageScreen({Key? key}) : super(key: key);

  @override
  State<VideoManageScreen> createState() => _VideoManageScreenState();
}

class _VideoManageScreenState extends State<VideoManageScreen> {
  VideoManageBloc videoManageBloc = VideoManageBloc();

  @override
  void initState() {
    videoManageBloc.add(VideoManageInitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideoManageBloc, VideoManageState>(
        bloc: videoManageBloc,
        listenWhen: (previous, current) => current is VideoManageActionState,
        buildWhen: (previous, current) => current is! VideoManageActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case VideoManageInitialState:
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 47,
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              videoManageBloc.add(ClickToCreateVideoEvent());
                            },
                            icon: const Icon(Icons.add_circle),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              'ブログを作成',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .color,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: Color(0xff000000),
                      indent: 0,
                      thickness: 1,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height - 380,
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, snapshot) {
                            return Container(
                              margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '私の自己紹介動画です',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .color,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showCupertinoModalPopup(
                                              context: context,
                                              builder: (context) {
                                                return CupertinoActionSheet(
                                                  actions: [
                                                    CupertinoActionSheetAction(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return CupertinoAlertDialog(
                                                                title:
                                                                    const Text(
                                                                  '投稿を削除します',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Color(
                                                                        0xff000000),
                                                                  ),
                                                                ),
                                                                content:
                                                                    const Text(
                                                                  'この投稿を削除します。\n投稿した内容が全て削除されます。',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Color(
                                                                        0xff000000),
                                                                  ),
                                                                ),
                                                                actions: [
                                                                  Column(
                                                                    children: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          '削除する',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w400,
                                                                              fontSize: 12,
                                                                              color: Color(0xff001AFF)),
                                                                        ),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          '削除しない',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w400,
                                                                              fontSize: 12,
                                                                              color: Color(0xff001AFF)),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              );
                                                            });
                                                      },
                                                      child: const Text(
                                                        '削除する',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff0500FF),
                                                        ),
                                                      ),
                                                    ),
                                                    CupertinoActionSheetAction(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        videoManageBloc.add(
                                                            ClickToCreateVideoEvent());
                                                      },
                                                      child: const Text(
                                                        '編集する',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  cancelButton:
                                                      CupertinoActionSheetAction(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'キャンセル',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xff000000),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        icon: const Icon(
                                          Icons.more_horiz,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: double.maxFinite,
                                    height: 200,
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/biz_design/image_12.png'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              );
            case ClickToCreateVideoState:
              return const CreateVideoScreen();
            default:
          }
          return const SizedBox();
        },
        listener: (context, state) {});
  }
}
