import 'package:code/biz_design/user_home/user_home_1/event_community.dart';
import 'package:code/biz_design/user_home/user_home_1/member_list_search.dart';
import 'package:code/biz_design/user_home/user_home_1/n_biz_channel.dart';
import 'package:code/biz_design/user_home/user_home_1/new_user_notification.dart';
import 'package:code/biz_design/user_home/user_home_1/notice_from_management.dart';
import 'package:code/biz_design/user_home/user_home_1/pick_up_person.dart';
import 'package:flutter/material.dart';

import '../../user_login/user_login_1/footer.dart';
import 'material_top/top_divider.dart';

class TopScreen extends StatefulWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  State<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
            SizedBox(
              width: double.maxFinite,
              height: 600,
              child: SingleChildScrollView(
                child: Column(
                  children: const [
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
            const Footer(),
          ],
        ),
      ),
    );
  }
}
