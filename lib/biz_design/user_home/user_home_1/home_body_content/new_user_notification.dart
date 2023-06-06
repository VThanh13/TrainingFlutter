import 'package:code/biz_design/common/custom_button.dart';
import 'package:code/biz_design/user_home/user_home_1/material_top/content_value.dart';
import 'package:flutter/material.dart';

import '../material_top/new_notification.dart';
import '../material_top/item_content.dart';
import '../material_top/home_divider.dart';

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
            children: [
              const ItemContent(
                  textValue: '新着ユーザー告知',
                  iconValue: Icons.volume_up_outlined,
                  size: 20,),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CustomButton(
                  height: 25,
                  width: 114,
                  text: '一覧をみる',
                  size: 10,
                  tab: () {},
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 175,
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoxNew(),
              TextInfo(
                  textValue: 'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...'),
              Padding(
                padding: EdgeInsets.only(top: 6),
                child: BoxNew(),
              ),
              TextInfo(
                  textValue: 'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...'),
              Padding(
                padding: EdgeInsets.only(top: 6),
                child: BoxNew(),
              ),
              TextInfo(
                  textValue: 'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...'),
            ],
          ),
        ),
        const TopDivider(),
      ],
    );
  }
}
