import 'package:auto_route/annotations.dart';
import 'package:code/biz_design/user_screen/user_top_screen/user_top_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserTop extends StatefulWidget {
  const UserTop({Key? key}) : super(key: key);

  @override
  State<UserTop> createState() => _UserTopState();
}

class _UserTopState extends State<UserTop> with SingleTickerProviderStateMixin {
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

  final List<IconData> _listBottomIconItems = <IconData>[
    Icons.home,
    Icons.account_circle_outlined,
    Icons.volume_up_outlined,
    Icons.calendar_today_outlined,
    Icons.groups_outlined,
    Icons.message_outlined,
  ];

  final List<IconData> _listBottomIconSelected = <IconData>[
    Icons.home_filled,
    Icons.account_circle_rounded,
    Icons.volume_up_sharp,
    Icons.calendar_today_rounded,
    Icons.groups_rounded,
    Icons.message_rounded,
  ];

  final List _listBottomLabelItems = [
    'ホーム',
    'マイページ',
    'ユーザー告知',
    'イベントコミュニティ',
    '会員一覧',
    'メッセージ',
  ];

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const UserTopScreen(),
    const Text('Info Page'),
    const Text('Sound Page'),
    const Text('Home Page'),
    const Text('Info Page'),
    const Text('Sound Page'),
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          ...List.generate(
            _listBottomIconItems.length,
            (index) {
              return BottomNavigationBarItem(
                icon: Icon(_listBottomIconItems[index]),
                activeIcon: Icon(_listBottomIconSelected[index]),
                label: _listBottomLabelItems[index],
                backgroundColor: const Color(0xffF1F1F1),
              );
            },
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff212862),
        unselectedItemColor: const Color(0xff212862),
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontSize: 6,
          fontWeight: FontWeight.w700,
          color: Color(0xff212862),
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 6,
          fontWeight: FontWeight.w700,
          color: Color(0xff212862),
        ),
        iconSize: 28,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
