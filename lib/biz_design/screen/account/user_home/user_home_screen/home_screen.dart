import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'home_screen_body.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
    const HomeScreenContent(),
    const Text('Info Page'),
    const Text('Sound Page'),
    const Text('Home Page'),
    const Text('Info Page'),
    const Text('Sound Page'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child:  Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          ...List.generate(_listBottomIconItems.length, (index){
            return BottomNavigationBarItem(
              icon: Icon(_listBottomIconItems[index]),
              label: _listBottomLabelItems[index],
              activeIcon: Icon(_listBottomIconSelected[index]),
              backgroundColor: const Color(0xffF1F1F1),
            );
          }),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff212862),
        unselectedItemColor: const Color(0xff212862),
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontSize: 6, fontWeight: FontWeight.w700,
          color: Color(0xff212862),
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 6, fontWeight: FontWeight.w700,
          color: Color(0xff212862),
        ),
        iconSize: 28,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
