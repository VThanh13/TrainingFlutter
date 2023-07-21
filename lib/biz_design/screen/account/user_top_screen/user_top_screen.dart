import 'package:flutter/material.dart';

import '../../../core/common/tab_bar_custom.dart';
import '../app_information/app_information.dart';
import '../blog_manage/blog_manage.dart';
import '../blog_screen/user_blog_screen.dart';
import '../card_exchange/card_exchange_screen.dart';
import '../event_community/user_event_community_screen.dart';
import '../event_manage/event_manage.dart';
import '../inform_screen/inform_screen.dart';
import '../message_screen/message_screen.dart';
import '../movie_screen/movie_screen.dart';
import '../name_card/name_card_screen.dart';
import '../notification_screen/notification_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../profile_setting/disable_profile_setting.dart';
import '../video_manage/video_manage.dart';
import 'widgets/user_info.dart';
import 'widgets/user_top_divider.dart';

class UserTopScreen extends StatefulWidget {
  const UserTopScreen({Key? key}) : super(key: key);

  @override
  State<UserTopScreen> createState() => _UserTopScreenState();
}

class _UserTopScreenState extends State<UserTopScreen>
    with SingleTickerProviderStateMixin {
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

  List listScreenItem = <Widget>[
    const UserProfileScreen(),
    const UserNameCardScreen(),
    const UserMessageScreen(),
    const UserMovieScreen(),
    const UserBlogScreen(),
    const UserInformScreen(),
    const UserEventCommunityScreen(),
    const SizedBox(),
    const DisableProfileSetting(),
    const CardExchangeScreen(),
    const NotificationScreen(),
    const EventManage(),
    const BlogManageScreen(),
    const VideoManageScreen(),
    const SizedBox(),
    const AppInformationScreen(),
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
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          const TabBarCustom(
            isSettingButton: true,
            isBackButton: true,
          ),
          const UserInfo(),
          const UserTopDivider(),
          Container(
            height: 48,
            width: double.maxFinite,
            color: Theme.of(context).scaffoldBackgroundColor,
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
              children: [
                ...List.generate(listScreenItem.length, (index) {
                  return listScreenItem[index];
                }),
              ],
            ),
          ),
        ],
      ),
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
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: Theme.of(context).textTheme.titleSmall!.color,
          ),
        ),
      ),
    );
  }
}
