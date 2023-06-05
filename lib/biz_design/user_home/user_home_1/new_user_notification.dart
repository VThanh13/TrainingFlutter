import 'package:code/biz_design/user_home/user_home_1/material_top/text_info.dart';
import 'package:flutter/material.dart';

import 'material_top/box_new.dart';
import 'material_top/button3.dart';
import 'material_top/icon_and_text.dart';

class NewUserNotification extends StatefulWidget {
  const NewUserNotification({Key? key}) : super(key: key);

  @override
  State<NewUserNotification> createState() => _NewUserNotificationState();
}

class _NewUserNotificationState extends State<NewUserNotification> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 38,
          width: double.maxFinite,
          color: const Color(0xffFFF8F3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              IconAndText(
                  textValue: '新着ユーザー告知',
                  iconValue: Icons.volume_up_outlined,
                  size: 20),
              Button3(),
            ],
          ),
        ),
        SizedBox(
          height: 175,
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: BoxNew(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: TextInfo(
                    textValue:
                    'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: BoxNew(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: TextInfo(
                    textValue:
                    'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: BoxNew(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: TextInfo(
                    textValue:
                    'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
