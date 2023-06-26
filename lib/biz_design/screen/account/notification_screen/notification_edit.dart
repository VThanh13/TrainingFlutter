import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../../controller/notification_controller.dart';
import '../../../core/blocs/notification_bloc/notification_bloc.dart';
import '../../../core/blocs/notification_bloc/notification_event.dart';
import '../../../core/blocs/notification_bloc/notification_state.dart';
// ignore: unused_import
import '../../../core/common/avatar_user.dart';
import '../../../models/notification_model/notification_model.dart';
import 'notification_screen.dart';

// ignore: must_be_immutable
class EditNotification extends StatefulWidget {
  EditNotification({required this.isEdit, this.detail, Key? key})
      : super(key: key);
  late NotificationModel? detail;
  final bool isEdit;

  @override
  State<EditNotification> createState() => _EditNotificationState();
}

class _EditNotificationState extends State<EditNotification> {
  NotificationBloc notificationBloc = NotificationBloc();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  bool validateTitle = false;
  bool validateContent = false;

  NotificationController notificationController =
      Get.put(NotificationController());
  @override
  void initState() {
    notificationBloc.add(ClickToEditNotificationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: BlocConsumer<NotificationBloc, NotificationState>(
          bloc: notificationBloc,
          listenWhen: (previous, current) => current is NotificationActionState,
          buildWhen: (previous, current) => current is! NotificationActionState,
          builder: (context, state) {
            if (state is ClickToEditNotificationState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            notificationBloc.add(NotificationInitialEvent());
                          },
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: Color(0xff0038FF),
                            size: 25,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _titleController.text.isEmpty
                                    ? validateTitle = true
                                    : validateTitle = false;
                                _contentController.text.isEmpty
                                    ? validateContent = true
                                    : validateContent = false;
                              });
                              if (validateTitle == false &&
                                  validateContent == false) {
                                final now = DateTime.now();
                                String formatter =
                                    DateFormat.yMMMMd('en_US').format(now);

                                final Map<String, dynamic> dataCreate = {
                                  "time": formatter,
                                  "userAvatar":
                                      "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1134.jpg",
                                  "userName": "Miss Jo Bartoletti",
                                  "title": _titleController.text,
                                  "image":
                                      "https://loremflickr.com/640/480/city",
                                  "content": _contentController.text,
                                };

                                if (widget.isEdit == true) {
                                  final Map<String, dynamic> dataUpdate = {
                                    "time": widget.detail!.time,
                                    "userAvatar": widget.detail!.userAvatar,
                                    "title": _titleController.text,
                                    "userName": widget.detail!.userName,
                                    "id": widget.detail!.id,
                                    "content": widget.detail!.content,
                                    "image": widget.detail!.image
                                  };
                                  notificationController.updateNotification(
                                      widget.detail!.id, dataUpdate);
                                }
                                if (widget.isEdit == false) {
                                  notificationController
                                      .createNotification(dataCreate);
                                }

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
                                              notificationBloc.add(
                                                  ClickToCreateNotificationEvent());
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
                              }
                            },
                            child: const Text(
                              '投稿する',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xff0038FF),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 35,
                          width: 35,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(50),
                            ),
                            child: Image(
                              image: widget.detail != null
                                  ? NetworkImage(widget.detail!.userAvatar)
                                  : const NetworkImage(
                                      'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/438.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                            width: 1,
                            height: 30,
                            color: Colors.lightBlueAccent,
                            margin: const EdgeInsets.only(left: 5, right: 10),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 80,
                          child: TextField(
                            controller: _titleController
                              ..text = widget.detail != null
                                  ? widget.detail!.title
                                  : '',
                            decoration: InputDecoration(
                              hintText: 'タイトルを入力してください',
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                              errorText:
                                  validateTitle ? 'Title can\'t be null' : null,
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 30,
                        height: 200,
                        child: TextField(
                          maxLines: 10,
                          minLines: 1,
                          controller: _contentController
                            ..text = widget.detail != null
                                ? widget.detail!.content
                                : '',
                          decoration: InputDecoration(
                            hintText: '本文を入力してください',
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                            errorText: validateContent
                                ? 'Content can\'t be null'
                                : null,
                            border: const UnderlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        '画像を登録',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 86,
                      margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      decoration: const BoxDecoration(
                        color: Color(0xffC4C4C4),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return CupertinoAlertDialog(
                                    title: const Text(
                                      'アラートテキストが入ります',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          '移動しない',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff0500FF),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          '移動する',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff0500FF),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                          icon: Icon(
                            Icons.add_circle,
                            size: 40,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is NotificationLoadedState) {
              return const NotificationScreen();
            } else if (state is ClickToCreateNotificationState) {
              return const NotificationScreen();
            }
            return const SizedBox();
          },
          listener: (context, state) {}),
    );
  }
}
