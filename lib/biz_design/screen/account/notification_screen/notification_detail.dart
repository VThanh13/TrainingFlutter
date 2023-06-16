import 'package:code/biz_design/core/blocs/notification_bloc/notification_event.dart';
import 'package:code/biz_design/core/blocs/notification_bloc/notification_state.dart';
import 'package:code/biz_design/screen/account/notification_screen/notification_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/notification_bloc/notification_bloc.dart';
import '../../../core/common/avatar_user.dart';

class NotificationDetail extends StatefulWidget {
  const NotificationDetail({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationBloc, NotificationState>(
        bloc: notificationBloc,
        listenWhen: (previous, current) => current is NotificationActionState,
        buildWhen: (previous, current) => current is! NotificationActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case ClickToDetailNotificationState:
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
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.more_horiz,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              '告知タイトルが入ります、告知タイトルが入ります',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff060606),
                              ),
                            ),
                          ),
                          const Center(
                            child: SizedBox(
                              height: 134,
                              width: 334,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/biz_design/Rectangle_28.png'),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 12,
                            ),
                            child: Text(
                              '告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、告知テキストがはいります、',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
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
            case ClickToEditNotificationState:
              return const EditNotification();
            default:
          }
          return const SizedBox();
        },
        listener: (context, state) {});
  }
}
