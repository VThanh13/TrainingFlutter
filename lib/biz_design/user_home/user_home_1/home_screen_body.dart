import 'package:code/biz_design/user_home/user_home_1/home_body_content/pick_up_person.dart';
import 'package:flutter/material.dart';
import '../user_home_2/top_search_screen.dart';
import 'home_body_content/event_community.dart';
import 'home_body_content/n_biz_channel.dart';
import 'home_body_content/new_user_notification.dart';
import 'home_body_content/notice_from_management.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({Key? key}) : super(key: key);

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 82,
          width: double.maxFinite,
          color: const Color(0xffF2F2F2),
          child: const Center(
            child: SizedBox(
              height: 34,
              width: 81,
              child: FittedBox(
                child: Image(
                  image: AssetImage('assets/images/biz_design/n-Biz.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.maxFinite,
          height: 615,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 48,
                  width: double.maxFinite,
                  color: const Color(0xffEAE9E9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              modelBottomSheetTopMenu();
                            },
                            icon: const Icon(
                              Icons.groups_outlined,
                              color: Color(0xffDD4A30),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 7),
                            child: Text(
                              '会員メンバー  一覧',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff060606),
                              ),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          navigateToTopSearch();
                        },
                        icon: const Icon(
                          Icons.keyboard_double_arrow_right,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                  color: Color(0xff060606),
                  indent: 0,
                  thickness: 1,
                ),
                const PickUpPerson(),
                const NBizChannel(),
                const NewUserNotification(),
                const EventCommunity(),
                const NoticeFromManagement(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  modelBottomSheetTopMenu() {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return const BottomSheetMenu();
        });
  }

  void navigateToTopSearch() {
    final route = MaterialPageRoute(
      builder: (context) => const TopSearch(),
    );
    Navigator.push(context, route);
  }
}

class BottomSheetMenu extends StatefulWidget {
  const BottomSheetMenu({Key? key}) : super(key: key);

  @override
  State<BottomSheetMenu> createState() => _BottomSheetMenuState();
}

class _BottomSheetMenuState extends State<BottomSheetMenu> {
  final List _listContent = [
    'myQRコード・URL表示',
    'マイページ',
    'ユーザー告知',
    'イベント・コミィニティ',
    '会員一覧',
    'メッセージ',
    '運営からのお知らせ',
    '運営会社情報',
    'サービス利用規約',
    'アプリ利用規約',
    'アプリ対応OS、バージョンについて',
    'ログアウト',
  ];
  final List<IconData> _listIcon = <IconData>[
    Icons.qr_code_scanner_rounded,
    Icons.account_circle_outlined,
    Icons.volume_up_outlined,
    Icons.calendar_today_outlined,
    Icons.groups_outlined,
    Icons.message_outlined,
    Icons.newspaper_rounded,
    Icons.location_city,
    Icons.library_books_outlined,
    Icons.lightbulb_outline,
    Icons.phone_iphone,
    Icons.logout,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 150.0,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 1,
                width: 293,
                margin: const EdgeInsets.only(left: 20, right: 26),
                color: const Color(0xffDD4A30),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Image(
                    image: AssetImage('assets/images/biz_design/Vector_1.png'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ...List.generate(
            _listContent.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      Icon(
                        _listIcon[index],
                        size: 25,
                        color: const Color(0xffDD4A30),
                      ),
                      const SizedBox(
                        width: 17,
                      ),
                      Text(
                        _listContent[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff060606),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
