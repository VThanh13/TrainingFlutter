import 'package:flutter/material.dart';

class AppInformationScreen extends StatefulWidget {
  const AppInformationScreen({Key? key}) : super(key: key);

  @override
  State<AppInformationScreen> createState() => _AppInformationScreenState();
}

class _AppInformationScreenState extends State<AppInformationScreen> {
  final List _listContent = [
    'myQRコード・URL表示',
    '運営からのお知らせ',
    '運営会社情報',
    'サービス利用規約',
    'アプリ利用規約',
    'アプリ対応OS、バージョンについて',
    'お問い合わせ・退会申請',
    'ログアウト',
  ];

  final List<IconData> _listIcons = <IconData>[
    Icons.account_circle_outlined,
    Icons.volume_up_outlined,
    Icons.edit_location_alt_outlined,
    Icons.wallet_membership,
    Icons.grading_outlined,
    Icons.access_time_outlined,
    Icons.send_rounded,
    Icons.share
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ...List.generate(_listIcons.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Icon(
                      _listIcons[index],
                      size: 25,
                      color: const Color(0xffDD4A30),
                    ),
                    const SizedBox(
                      width: 15,
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
          }),
        ],
      ),
    );
  }
}
