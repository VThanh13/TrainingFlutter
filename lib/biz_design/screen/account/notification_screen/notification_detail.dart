import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../controller/notification_controller.dart';
import '../../../core/blocs/notification_bloc/notification_bloc.dart';
import '../../../core/blocs/notification_bloc/notification_event.dart';
import '../../../core/blocs/notification_bloc/notification_state.dart';
import '../../../models/notification_model/notification_model.dart';
import 'notification_edit.dart';
import 'notification_screen.dart';

class NotificationDetail extends StatefulWidget {
  const NotificationDetail({required this.detail, Key? key}) : super(key: key);
  final NotificationModel detail;

  @override
  State<NotificationDetail> createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  final NotificationBloc notificationBloc = NotificationBloc();

  @override
  void initState() {
    super.initState();
    notificationBloc.add(ClickToDetailNotificationEvent());
  }

  NotificationController notificationController =
      Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationBloc, NotificationState>(
        bloc: notificationBloc,
        listenWhen: (previous, current) => current is NotificationActionState,
        buildWhen: (previous, current) => current is! NotificationActionState,
        builder: (context, state) {
          if (state is ClickToDetailNotificationState) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    color: const Color(0xffF9F9F9),
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    margin: const EdgeInsets.only(
                      left: 6,
                      right: 6,
                      bottom: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    widget.detail.time.toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    child: Image(
                                      image: NetworkImage(
                                          widget.detail.userAvatar),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    widget.detail.userName,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff060606),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoAlertDialog(
                                        title: const Text(
                                          '投稿を削除します',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                        content: const Text(
                                          'この投稿を削除します。\n投稿した内容が全て削除されます。',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                        actions: [
                                          Column(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  notificationController
                                                      .deleteNotification(
                                                          widget.detail.id);
                                                  Navigator.pop(context);
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return CupertinoAlertDialog(
                                                          title: const Text(
                                                            'アクション完了テキストが入ります',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14,
                                                              color: Color(
                                                                  0xff000000),
                                                            ),
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                                notificationBloc
                                                                    .add(
                                                                        ClickToDeleteNotificationEvent());
                                                              },
                                                              child: const Text(
                                                                '完了',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 14,
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
                                                  '削除する',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff001AFF),
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  '削除しない',
                                                  style: TextStyle(
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
                              icon: const Icon(
                                Icons.more_horiz,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            widget.detail.title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff060606),
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            height: 134,
                            width: 334,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image(
                                image: NetworkImage(widget.detail.image),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 12,
                          ),
                          child: Text(
                            widget.detail.content,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xff333333),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                notificationBloc
                                    .add(ClickToEditNotificationEvent());
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
                ],
              ),
            );
          } else if (state is ClickToEditNotificationState) {
            return EditNotification(
              detail: widget.detail,
              isEdit: true,
            );
          } else if (state is ClickToDeleteNotificationState) {
            return const NotificationScreen();
          }
          return const SizedBox();
        },
        listener: (context, state) {});
  }
}
