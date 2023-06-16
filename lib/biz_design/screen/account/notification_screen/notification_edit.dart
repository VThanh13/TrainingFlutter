import 'package:code/biz_design/core/blocs/notification_bloc/notification_bloc.dart';
import 'package:code/biz_design/core/blocs/notification_bloc/notification_event.dart';
import 'package:code/biz_design/core/blocs/notification_bloc/notification_state.dart';
import 'package:code/biz_design/core/common/avatar_user.dart';
import 'package:code/biz_design/screen/account/notification_screen/notification_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditNotification extends StatefulWidget {
  const EditNotification({Key? key}) : super(key: key);

  @override
  State<EditNotification> createState() => _EditNotificationState();
}

class _EditNotificationState extends State<EditNotification> {
  NotificationBloc notificationBloc = NotificationBloc();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  bool validateTitle = false;
  bool validateContent = false;
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
            switch (state.runtimeType) {
              case ClickToEditNotificationState:
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              notificationBloc
                                  .add(ClickToDetailNotificationEvent());
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
                                                    ClickToDetailNotificationEvent());
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
                          const AvatarUser(
                            width: 30,
                            height: 30,
                            urlImage: 'assets/images/biz_design/image_1.png',
                          ),
                          Container(
                            width: 1,
                            height: 30,
                            color: Colors.lightBlueAccent,
                            margin: const EdgeInsets.only(left: 5, right: 10),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 80,
                            child: TextField(
                              controller: _titleController,
                              decoration: InputDecoration(
                                hintText: 'タイトルを入力してください',
                                hintStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                                errorText: validateTitle
                                    ? 'Title can\'t be null'
                                    : null,
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
                            controller: _contentController,
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
              case ClickToDetailNotificationState:
                return const NotificationDetail();
              default:
            }
            return const SizedBox();
          },
          listener: (context, state) {}),
    );
  }
}
