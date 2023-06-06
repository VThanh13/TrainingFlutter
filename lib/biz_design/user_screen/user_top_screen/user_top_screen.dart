import 'package:code/biz_design/user_screen/user_blog_screen/user_blog_screen.dart';
import 'package:code/biz_design/user_screen/user_event_community_screen/user_event_community_screen.dart';
import 'package:code/biz_design/user_screen/user_inform_screen/user_inform_screen.dart';
import 'package:code/biz_design/user_screen/user_profile_screen/user_profile_screen.dart';
import 'package:code/biz_design/user_screen/user_top_screen/user_top_material/user_info.dart';
import 'package:code/biz_design/user_screen/user_top_screen/user_top_material/user_top_divider.dart';
import 'package:flutter/material.dart';

import '../../common/header_02.dart';
import '../user_message_screen/user_message_screen.dart';
import '../user_movie_screen/user_movie_screen.dart';
import '../user_name_card_screen/user_name_card_screen.dart';

class UserTopScreen extends StatefulWidget {
  const UserTopScreen({Key? key}) : super(key: key);

  @override
  State<UserTopScreen> createState() => _UserTopScreenState();
}

class _UserTopScreenState extends State<UserTopScreen> with SingleTickerProviderStateMixin{

  late TabController _tabController;
  List listTabItem = [
    'プロフィール',
    '名刺交換',
    'メッセージ',
    '動画',
    'ブログ',
    '告知',
    'イベント・コミュニティ',
    '基本設定',
    'プロフィール設定',
    '名刺交換管理',
    '告知管理',
    'イベント・コミュニティ管理',
    'ブログ管理',
    '動画管理',
    'メッセージ',
    'アプリ情報',
  ];

  @override
  void initState() {
    _tabController = TabController(length: listTabItem.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            const Header02(),
            const UserInfo(),
            const UserTopDivider(),
            SizedBox(
              height: 48,
              width: double.maxFinite,
              child: TabBar(
                isScrollable: true,
                controller: _tabController,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: Color(0xffDD4A30),
                    width: 3,
                  ),
                ),
                tabs: [
                  ...List.generate(
                    listTabItem.length,
                    (index) {
                      return Tab(
                        child: ItemMenu(
                          itemName: listTabItem[index],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const UserTopDivider(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children:  const [
                  UserProfileScreen(),
                  UserNameCardScreen(),
                  UserMessageScreen(),
                  UserMovieScreen(),
                  UserBlogScreen(),
                  UserInformScreen(),
                  UserEventCommunityScreen(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                ],
              ),
            ),
          ],
        );
  }
}

class ItemMenu extends StatelessWidget {
  const ItemMenu({required this.itemName, Key? key}) : super(key: key);
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Text(
          itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: Color(0xff060606),
          ),
        ),
      ),
    );
  }
}
