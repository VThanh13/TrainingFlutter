import 'package:code/biz_design/user_screen/user_screen_1/user_top_material/blue_tag.dart';
import 'package:code/biz_design/user_screen/user_screen_1/user_top_material/red_border_tag.dart';
import 'package:code/biz_design/user_screen/user_screen_1/user_top_material/red_border_tag_2.dart';
import 'package:code/biz_design/user_screen/user_screen_1/user_top_material/text_1_row.dart';
import 'package:code/biz_design/user_screen/user_screen_1/user_top_material/text_info.dart';
import 'package:code/biz_design/user_screen/user_screen_1/user_top_material/user_top_divider.dart';
import 'package:flutter/material.dart';

import '../../user_login/user_login_1/footer.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          height: 449,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const BlueTag(
                  value: 'ビジネスコメント',
                  width: 96,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: TextInfoD1(
                    textValue:
                        '初めまして、既存のお客様からDX関連の相談をいただくことが多いです。\nITコンサルやWebシステム制作のノウハウをお持ちの方と繋がりたいと思っています。\nよろしくお願いします。',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: UserTopDivider(),
                ),
                const BlueTag(value: '繋がりたい業種・職種', width: 133),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: const [
                      RedBorderTag(textValue: 'IT', width: 31),
                      RedBorderTag(
                        textValue: 'IT > WEB制作',
                        width: 99,
                      ),
                      RedBorderTag(
                        textValue: 'IT > コンサル',
                        width: 97,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: UserTopDivider(),
                ),
                const BlueTag(
                  value: 'エリア',
                  width: 51,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: const [
                      RedBorderTag(textValue: '東京都', width: 55),
                      RedBorderTag(textValue: '千葉県', width: 55),
                      RedBorderTag(textValue: '大阪府', width: 55),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const UserTopDivider(),
                const BlueTag(value: '実績、経歴', width: 78),
                const TextInfoD1(
                    textValue: '2000年 新卒でゼネコン大手〇〇に入社'
                        '\n2003年 中国重慶にて駐在、中国語を取取得2006年 日本へ帰任後、現職へ転転職\n'
                        '\n主に大手企業への法人営業を担当'),
                const SizedBox(
                  height: 6,
                ),
                const UserTopDivider(),
                const BlueTag(value: '保有スキル', width: 80),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: const [
                    RedBorderTag2(textValue: '営業', width: 45),
                    RedBorderTag2(textValue: 'CAD', width: 41),
                    RedBorderTag2(textValue: '英語', width: 41),
                    RedBorderTag2(textValue: '中国語', width: 56),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const UserTopDivider(),
                const BlueTag(value: '保有資格', width: 68),
                const Text1Row(text: '英検一級'),
                const SizedBox(
                  height: 6,
                ),
                const UserTopDivider(),
                const BlueTag(value: '役職', width: 41),
                const Text1Row(text: '常務取締役'),
                const SizedBox(
                  height: 5,
                ),
                const UserTopDivider(),
                const BlueTag(value: '年収', width: 40),
                const Text1Row(text: '800万 ~ 1000万'),
                const SizedBox(
                  height: 10,
                ),
                const BlueTag(value: '資産', width: 40),
                const Text1Row(text: '不動産、株、米国債'),
                const SizedBox(
                  height: 10,
                ),
                const UserTopDivider(),
                const BlueTag(value: '出身地', width: 52),
                const Text1Row(text: '茨城県'),
                const SizedBox(
                  height: 10,
                ),
                const UserTopDivider(),
                const BlueTag(value: '趣味', width: 40),
                const Text1Row(text: '野球（草野球チームメンバー募集中です）'),
                const SizedBox(
                  height: 10,
                ),
                const UserTopDivider(),
                const BlueTag(value: 'SNS', width: 38),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.facebook,
                        color: Color(0xff212862),
                        size: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.eco_rounded,
                        color: Colors.lightBlue,
                        size: 20,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.insert_comment_outlined,
                          color: Colors.brown,
                          size: 20,
                        )),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.tiktok,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
        const Footer(),
      ],
    );
  }
}
