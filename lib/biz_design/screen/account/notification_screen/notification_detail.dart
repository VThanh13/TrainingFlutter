import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/notification_bloc/notification_bloc.dart';
import '../../../core/blocs/notification_bloc/notification_event.dart';
import '../../../core/blocs/notification_bloc/notification_state.dart';
import '../../../models/notification_model/notification_model.dart';
import 'notification_edit.dart';

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
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      widget.detail.time,
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
                                onPressed: () {},
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
            case ClickToEditNotificationState:
              return EditNotification(
                detail: widget.detail,
              );
            default:
          }
          return const SizedBox();
        },
        listener: (context, state) {});
  }
}
