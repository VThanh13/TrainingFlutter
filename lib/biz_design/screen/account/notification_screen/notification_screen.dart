import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../controller/notification_controller.dart';
import '../../../core/blocs/notification_bloc/notification_bloc.dart';
import '../../../core/blocs/notification_bloc/notification_event.dart';
import '../../../core/blocs/notification_bloc/notification_state.dart';
import '../../../models/notification_model/notification_model.dart';
import 'notification_detail.dart';
import 'notification_edit.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationBloc notificationBloc = NotificationBloc();
  late final ScrollController _scrollController;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    notificationBloc.add(NotificationInitialEvent());
    _scrollController = ScrollController();
    notificationController.getNotifications();
  }

  NotificationController notificationController =
      Get.put(NotificationController());

  late NotificationModel detail;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationBloc, NotificationState>(
        bloc: notificationBloc,
        listenWhen: (previous, current) => current is NotificationActionState,
        buildWhen: (previous, current) => current is! NotificationActionState,
        builder: (context, state) {
          // ignore: unrelated_type_equality_checks
          if (notificationController.isInternetConnect == true) {
            if (state is NotificationLoadingState) {
              return const Center(
                child: SizedBox(
                    height: 30, width: 30, child: CircularProgressIndicator()),
              );
            } else if (state is NotificationLoadedState) {
              return SingleChildScrollView(
                controller: _scrollController,
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
                              notificationBloc
                                  .add(ClickToEditNotificationEvent());
                            },
                            icon: const Icon(
                              Icons.add_circle,
                              size: 25,
                            ),
                          ),
                          const Padding(
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
                      child: Builder(
                        builder: (context) {
                          return Obx(
                            () => ListView.builder(
                              itemCount:
                                  notificationController.notifications.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: double.maxFinite,
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 10, 0, 10),
                                  color: index % 2 == 0
                                      ? const Color(0xffFAFAFA)
                                      : const Color(0xffE5E5E5),
                                  child: InkWell(
                                    onTap: () {
                                      notificationController
                                              .isInternetConnect.value
                                          ? {
                                              detail = notificationController
                                                  .notifications[index],
                                              notificationBloc.add(
                                                  ClickToDetailNotificationEvent()),
                                            }
                                          : {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return CupertinoAlertDialog(
                                                      title: const Text(
                                                          'No internet'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                              'Close'),
                                                        ),
                                                      ],
                                                    );
                                                  })
                                            };
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 80,
                                                  child: Text(
                                                    notificationController
                                                        .notifications[index]
                                                        .time,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                SizedBox(
                                                  height: 35,
                                                  width: 35,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(50),
                                                    ),
                                                    child: Image(
                                                      image: NetworkImage(
                                                          notificationController
                                                              .notifications[
                                                                  index]
                                                              .userAvatar),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Text(
                                                    notificationController
                                                        .notifications[index]
                                                        .userName,
                                                    style: const TextStyle(
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                                                  context:
                                                                      context,
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
                                                                              FontWeight.w400,
                                                                          color:
                                                                              Color(0xff000000),
                                                                        ),
                                                                      ),
                                                                      content:
                                                                          const Text(
                                                                        'この投稿を削除します。\n投稿した内容が全て削除されます。',
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Color(0xff000000),
                                                                        ),
                                                                      ),
                                                                      actions: [
                                                                        Column(
                                                                          children: [
                                                                            TextButton(
                                                                              onPressed: () {
                                                                                notificationController.deleteNotification(notificationController.notifications[index].id);
                                                                                Navigator.pop(context);
                                                                                showDialog(
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return CupertinoAlertDialog(
                                                                                        title: const Text(
                                                                                          'アクション完了テキストが入ります',
                                                                                          style: TextStyle(
                                                                                            fontWeight: FontWeight.w400,
                                                                                            fontSize: 14,
                                                                                            color: Color(0xff000000),
                                                                                          ),
                                                                                        ),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () {
                                                                                              Navigator.pop(context);
                                                                                              notificationBloc.add(ClickToDeleteNotificationEvent());
                                                                                            },
                                                                                            child: const Text(
                                                                                              '完了',
                                                                                              style: TextStyle(
                                                                                                fontWeight: FontWeight.w400,
                                                                                                fontSize: 14,
                                                                                                color: Color(0xff0500FF),
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
                                                            child: const Text(
                                                              '削除する',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                    0xff0500FF),
                                                              ),
                                                            ),
                                                          ),
                                                          CupertinoActionSheetAction(
                                                            onPressed: () {
                                                              detail =
                                                                  notificationController
                                                                          .notifications[
                                                                      index];
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
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                    0xff000000),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                        cancelButton:
                                                            CupertinoActionSheetAction(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                            'キャンセル',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                  0xff000000),
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
                                        Text(
                                          notificationController
                                              .notifications[index].title,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Color(0xff060606),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is ClickToDetailNotificationState) {
              return NotificationDetail(detail: detail);
            } else if (state is NotificationErrorState) {
              return const Text('Error!');
            } else if (state is ClickToEditNotificationState) {
              return EditNotification(isEdit: false);
            } else if (state is ClickToDeleteNotificationState) {
              return const NotificationScreen();
            }
            return const SizedBox();
          } else {
            return const Center(
              child: Text('No internet'),
            );
          }
        },
        listener: (context, state) {});
  }
}
