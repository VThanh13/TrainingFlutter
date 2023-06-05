import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {

  final List<IconData> _listBottomIconItems = <IconData>[
    Icons.home,
    Icons.account_circle_outlined,
    Icons.volume_up_outlined,
    Icons.calendar_today_outlined,
    Icons.groups_outlined,
    Icons.message_outlined,
  ];

  final List _listBottomLabelItems = [
    'ホーム',
    'マイページ',
    'ユーザー告知',
    'イベントコミュニティ',
    '会員一覧',
    'メッセージ',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        ...List.generate(_listBottomIconItems.length, (index){
          return BottomNavigationBarItem(
            icon: Icon(_listBottomIconItems[index]),
            label: _listBottomLabelItems[index],
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
    );
  }
}
