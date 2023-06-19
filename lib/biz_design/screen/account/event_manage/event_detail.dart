import 'package:code/biz_design/core/blocs/event_manage_bloc/event_manage_bloc.dart';
import 'package:code/biz_design/core/blocs/event_manage_bloc/event_manage_event.dart';
import 'package:code/biz_design/core/blocs/event_manage_bloc/event_manage_state.dart';
import 'package:code/biz_design/screen/account/event_manage/event_manage.dart';
import 'package:code/biz_design/screen/account/event_manage/people_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/avatar_user.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({Key? key}) : super(key: key);

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  EventManageBloc eventManageBloc = EventManageBloc();
  final List _listAvatar = [
    'assets/images/biz_design/image_1.png',
    'assets/images/biz_design/image_14.png',
    'assets/images/biz_design/image_14.png',
    'assets/images/biz_design/image_15.png',
    'assets/images/biz_design/image_1.png',
    'assets/images/biz_design/image_15.png',
    'assets/images/biz_design/image_1.png',
  ];

  @override
  void initState() {
    super.initState();
    eventManageBloc.add(ClickToDetailEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventManageBloc, EventManageState>(
        bloc: eventManageBloc,
        listenWhen: (previous, current) => current is EventManageActionState,
        buildWhen: (previous, current) => current is! EventManageActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case ClickToDetailEventState:
              return SingleChildScrollView(
                child: Container(
                  color: const Color(0xffF9F9F9),
                  height: 500,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  padding: const EdgeInsets.only(left: 9, right: 9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '2020.00.00（月）',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xff333333),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoActionSheet(
                                      title: const Text(
                                        '削除する',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xff0500FF),
                                        ),
                                      ),
                                      actions: [
                                        CupertinoActionSheetAction(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return CupertinoAlertDialog(
                                                    title: const Text(
                                                      'コミュニティを削除します',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff000000),
                                                      ),
                                                    ),
                                                    content: const Text(
                                                      'このコミュニティを削除します。\n投稿した内容や参加者の情報が全て削除されます。',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                    actions: [
                                                      Column(
                                                        children: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                              eventManageBloc.add(
                                                                  EventManageInitialEvent());
                                                            },
                                                            child: const Text(
                                                              '削除する',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                    0xff001AFF),
                                                              ),
                                                            ),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                              '削除しない',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                    0xff001AFF),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                });
                                          },
                                          child: const Text(
                                            'コミュニティを非表示にする',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                      ],
                                      cancelButton: CupertinoActionSheetAction(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'キャンセル',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.more_horiz,
                              size: 30,
                              color: Color(0xff060606),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 16,
                        width: 58,
                        color: const Color(0xffE56565),
                        child: const Center(
                          child: Text(
                            '趣味/スポーツ',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        'プロジェクト名、プロジェクト名、プロジェクト名',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff060606),
                        ),
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AvatarUser(
                            width: 36,
                            height: 34,
                            urlImage: 'assets/images/biz_design/image_1.png',
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              '高橋 恵',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff060606),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Text(
                            '参加者',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff060606),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(
                              '532人',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff060606),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 13, right: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...List.generate(_listAvatar.length, (index) {
                              return AvatarUser(
                                width: 30,
                                height: 30,
                                urlImage: _listAvatar[index],
                              );
                            }),
                            InkWell(
                              onTap: () {
                                eventManageBloc.add(ClickToPeopleGroupEvent());
                              },
                              child: const CircleAvatar(
                                radius: 16,
                                backgroundColor: Color(0xff212862),
                                child: Center(
                                  child: Icon(
                                    Icons.keyboard_double_arrow_right,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: SizedBox(
                          height: 252,
                          width: 337,
                          child: Text(
                            'テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、テキストが入ります、',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Color(0xff060606),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoActionSheet(
                                      title: const Text(
                                        '通報する',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xff0500FF),
                                        ),
                                      ),
                                      actions: [
                                        CupertinoActionSheetAction(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return CupertinoAlertDialog(
                                                    title: const Text(
                                                      'アクション完了テキストが入ります',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          eventManageBloc.add(
                                                              EventManageInitialEvent());
                                                        },
                                                        child: const Text(
                                                          '戻る',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xff0500FF),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                });
                                          },
                                          child: const Text(
                                            '投稿のお知らせをオンにする',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                      ],
                                      cancelButton: CupertinoActionSheetAction(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'キャンセル',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.edit,
                            ),
                          ),
                          const Text(
                            '編集する',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff060606),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            case ClickToPeopleGroupState:
              return const PeopleGroup();
            case EventManageInitialState:
              return const EventManage();
            default:
          }
          return const SizedBox();
        },
        listener: (context, state) {});
  }
}
