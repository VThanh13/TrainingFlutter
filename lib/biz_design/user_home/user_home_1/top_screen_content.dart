import 'package:code/biz_design/user_home/user_home_1/pick_up_person.dart';
import 'package:flutter/material.dart';
import 'event_community.dart';
import 'material_top/top_divider.dart';
import 'member_list_search.dart';
import 'n_biz_channel.dart';
import 'new_user_notification.dart';
import 'notice_from_management.dart';

class TopScreenContent extends StatefulWidget {
  const TopScreenContent({Key? key}) : super(key: key);

  @override
  State<TopScreenContent> createState() => _TopScreenContentState();
}

class _TopScreenContentState extends State<TopScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 82,
              width: double.maxFinite,
              color: const Color(0xffF2F2F2),
            ),
            Positioned(
              top: 37,
              left: 150,
              child: Container(
                height: 34,
                width: 81,
                padding: const EdgeInsets.only(bottom: 13),
                child: const FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Image(
                    image: AssetImage('assets/images/biz_design/n-Biz.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: double.maxFinite,
          height: 615,
          child: SingleChildScrollView(
            child: Column(
              children: [
                MemberListSearch(),
                Divider(
                  height: 0,
                  color: Color(0xff060606),
                  indent: 0,
                  thickness: 1,
                ),
                PickUpPerson(),
                TopDivider(),
                NBizChannel(),
                TopDivider(),
                NewUserNotification(),
                TopDivider(),
                EventCommunity(),
                TopDivider(),
                NoticeFromManagement(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
