import 'package:code/biz_design/core/blocs/notification_bloc/notification_bloc.dart';
import 'package:code/biz_design/core/blocs/notification_bloc/notification_event.dart';
import 'package:code/biz_design/core/blocs/notification_bloc/notification_state.dart';
import 'package:code/biz_design/screen/account/notification_screen/notification_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/avatar_user.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationBloc notificationBloc = NotificationBloc();
  late final ScrollController _scrollController;
  late final PageStorageKey _storageKey;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    notificationBloc.add(NotificationInitialEvent());
    _storageKey = const PageStorageKey('notification_scroll_position');
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationBloc, NotificationState>(
        bloc: notificationBloc,
        listenWhen: (previous, current) => current is NotificationActionState,
        buildWhen: (previous, current) => current is! NotificationActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case NotificationInitialState:
              return SingleChildScrollView(
                controller: _scrollController,
                key: _storageKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 47,
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.add_circle,
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 20),
                            child: Text(
                              '告知を作成',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff000000),
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
                      height: MediaQuery.of(context).size.height - 390,
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.maxFinite,
                              padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                              color: index % 2 == 0
                                  ? const Color(0xffFAFAFA)
                                  : const Color(0xffE5E5E5),
                              child: InkWell(
                                onTap: () {
                                  notificationBloc
                                      .add(ClickToDetailNotificationEvent());
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Row(
                                          children: [
                                            Text(
                                              '2020.00.00（月）',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            AvatarUser(
                                              width: 36,
                                              height: 34,
                                              urlImage:
                                                  'assets/images/biz_design/image_1.png',
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text(
                                                '田中  武彦',
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff060606),
                                                ),
                                              ),
                                            ),
                                          ],
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
                                                          Navigator.pop(
                                                              context);
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return CupertinoAlertDialog(
                                                                  title:
                                                                      const Text(
                                                                    '投稿を削除します',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
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
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          12,
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
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            '削除する',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w400,
                                                                              color: Color(0xff001AFF),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            '削除しない',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w400,
                                                                              color: Color(0xff001AFF),
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
                                                          '削除する',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xff0500FF),
                                                          ),
                                                        ),
                                                      ),
                                                      CupertinoActionSheetAction(
                                                        onPressed: () {
                                                          notificationBloc.add(
                                                              ClickToDetailNotificationEvent());
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                          '編集する',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xff000000),
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
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
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
                                            size: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      '告知タイトルが入ります、告知タイトルが入ります',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Color(0xff060606),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              );
            case ClickToDetailNotificationState:
              return const NotificationDetail();
            default:
          }
          return const SizedBox();
        },
        listener: (context, state) {});
  }
}
