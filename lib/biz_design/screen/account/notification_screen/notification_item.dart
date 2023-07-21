import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/notification_controller.dart';
import '../../../core/blocs/notification_bloc/notification_bloc.dart';
import '../../../core/blocs/notification_bloc/notification_event.dart';
import '../../../core/blocs/notification_bloc/notification_state.dart';
import '../../../core/setting/custom_extension.dart';
import '../../../models/notification_model/notification_model.dart';
import 'notification_detail.dart';
import 'notification_edit.dart';

class Demo {
  String title;
  String name;
  Demo({
    required this.name,
    required this.title,
  });

  @override
  int get hashCode => Object.hash(title, name);

  @override
  bool operator ==(Object other) {
    return other.hashCode == hashCode;
  }
}

class NotificationItem extends StatefulWidget {
  const NotificationItem({super.key});

  @override
  State<NotificationItem> createState() => NotificationItemState();

  static of(BuildContext context) {
    Scaffold.of(context).showBottomSheet(
      (context) => const Text('Flutter From Zero to Hero'),
    );
  }
}

class NotificationItemState extends State<NotificationItem> {
  NotificationController notificationController = NotificationController();
  NotificationBloc notificationBloc = NotificationBloc();
  late NotificationModel detail;
  final ScrollController _scrollController = ScrollController();
  int page = 1;

  @override
  void initState() {
    super.initState();
    notificationController.getNotifications();
    notificationBloc.add(NotificationInitialEvent());
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (notificationController.isLoadMore == true) {
          page++;
          await notificationController.loadMoreNotification(page);
          setState(() {
            notificationController.notifications;
            notificationBloc.notifications =
                notificationController.notifications;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationBloc, NotificationState>(
        bloc: notificationBloc,
        builder: (context, state) {
          if (state is ClickToDetailNotificationState) {
            return NotificationDetail(detail: detail);
          } else if (state is ClickToDeleteNotificationState) {
            notificationController.getNotifications();
            return const NotificationItem();
          } else if (state is ClickToEditNotificationState) {
            return const EditNotification(isEdit: false);
          } else if (state is NotificationLoadedState) {
            return Column(
              children: [
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  height: 47,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          notificationBloc.add(ClickToEditNotificationEvent());
                        },
                        icon: Icon(
                          Icons.add_circle,
                          size: 25,
                          color: Theme.of(context).textTheme.titleSmall!.color,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 20),
                        child: Text(
                          '告知を作成',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.titleSmall!.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0,
                  color: Theme.of(context).dividerColor,
                  indent: 0,
                  thickness: 1,
                ),
                RefreshIndicator(
                  onRefresh: () async {
                    setState(() {
                      page = 1;
                      notificationController.isLoadMore = true;
                    });
                    notificationBloc.notifications.clear();
                    notificationBloc.add(NotificationInitialEvent());
                    await notificationController.getNotifications();
                    notificationController.notifications;
                    notificationBloc.notifications;
                  },
                  color: Colors.white,
                  backgroundColor: Colors.blue,
                  displacement: 20.0,
                  child: SizedBox(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height - 362,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: notificationBloc.notifications.length,
                      itemBuilder: (context, index) {
                        return Container(
                          key: ObjectKey(notificationBloc.notifications[index]),
                          width: double.maxFinite,
                          padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                          color: index % 2 == 0
                              ? const Color(0xffFAFAFA)
                              : const Color(0xffE5E5E5),
                          child: InkWell(
                            onTap: () {
                              notificationController.isInternetConnect
                                  ? {
                                      detail =
                                          notificationBloc.notifications[index],
                                      notificationBloc.add(
                                          ClickToDetailNotificationEvent()),
                                    }
                                  : {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return CupertinoAlertDialog(
                                              title: const Text('No internet'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Close'),
                                                ),
                                              ],
                                            );
                                          })
                                    };
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                            notificationBloc
                                                .notifications[index].time,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
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
                                                  notificationBloc
                                                      .notifications[index]
                                                      .userAvatar),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            notificationBloc
                                                .notifications[index].userName,
                                            style: const TextStyle(
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
                                                      Navigator.pop(context);
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return CupertinoAlertDialog(
                                                              title: const Text(
                                                                      '投稿を削除します')
                                                                  .toDetailDialog(),
                                                              content: const Text(
                                                                      'この投稿を削除します。\n投稿した内容が全て削除されます。')
                                                                  .toDetailDialog(),
                                                              actions: [
                                                                Column(
                                                                  children: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        notificationController.deleteNotification(notificationController
                                                                            .notifications[index]
                                                                            .id);
                                                                        Navigator.pop(
                                                                            context);
                                                                        showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return CupertinoAlertDialog(
                                                                                title: const Text(
                                                                                  'アクション完了テキストが入ります',
                                                                                ).toDetailDialog(),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context);
                                                                                      notificationBloc.add(ClickToDeleteNotificationEvent());
                                                                                    },
                                                                                    child: const Text('完了').toDetailDialog(),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            });
                                                                      },
                                                                      child: const Text(
                                                                              '削除する')
                                                                          .toConfirmDialog(),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: const Text(
                                                                              '削除しない')
                                                                          .toConfirmDialog(),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            );
                                                          });
                                                    },
                                                    child: const Text('削除する')
                                                        .toConfirmDialog(),
                                                  ),
                                                  CupertinoActionSheetAction(
                                                    onPressed: () {
                                                      detail = notificationBloc
                                                          .notifications[index];
                                                      notificationBloc.add(
                                                          ClickToDetailNotificationEvent());
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('編集する')
                                                        .toDetailDialog(),
                                                  ),
                                                ],
                                                cancelButton:
                                                    CupertinoActionSheetAction(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('キャンセル')
                                                      .toDetailDialog(),
                                                ),
                                              );
                                            });
                                      },
                                      icon: const Icon(
                                        Icons.more_horiz,
                                        size: 25,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                    notificationBloc.notifications[index].title
                                        .capitalizeFirstLetter(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
        listener: (context, state) {});
  }
}
