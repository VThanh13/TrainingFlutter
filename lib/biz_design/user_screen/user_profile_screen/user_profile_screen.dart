import 'package:code/biz_design/common/tag_search_content.dart';
import 'package:code/biz_design/user_screen/user_top_screen/user_top_material/red_border_tag.dart';
import 'package:code/biz_design/user_screen/user_top_screen/user_top_material/red_border_tag_2.dart';
import 'package:code/biz_design/user_screen/user_top_screen/user_top_material/user_top_divider.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final List<IconData> _listIcon = <IconData>[
    Icons.facebook,
    Icons.eco_rounded,
    Icons.insert_comment_outlined,
    Icons.tiktok,
  ];

  final List<Color> _listColorIcon = <Color>[
    const Color(0xff212862),
    Colors.lightBlue,
    Colors.brown,
    Colors.black,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          height: 460,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TagSearchContent(
                  textValue: 'ビジネスコメント',
                  width: 96,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: FormatText(
                    textValue:
                        '初めまして、既存のお客様からDX関連の相談をいただくことが多いです。\nITコンサルやWebシステム制作のノウハウをお持ちの方と繋がりたいと思っています。\nよろしくお願いします。',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: UserTopDivider(),
                ),
                const TagSearchContent(
                  textValue: '繋がりたい業種・職種',
                  width: 133,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      RedBorderTag(
                        textValue: 'IT',
                        width: 31,
                      ),
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
                const TagSearchContent(
                  textValue: 'エリア',
                  width: 51,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
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
                const TagSearchContent(textValue: '実績、経歴', width: 78),
                const FormatText(
                    textValue: '2000年 新卒でゼネコン大手〇〇に入社'
                        '\n2003年 中国重慶にて駐在、中国語を取取得2006年 日本へ帰任後、現職へ転転職\n'
                        '\n主に大手企業への法人営業を担当'),
                const SizedBox(
                  height: 6,
                ),
                const UserTopDivider(),
                const TagSearchContent(textValue: '保有スキル', width: 80),
                const SizedBox(
                  height: 6,
                ),
                const Row(
                  children: [
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
                const TagSearchContent(textValue: '保有資格', width: 68),
                const FormatText(textValue: '英検一級'),
                const SizedBox(
                  height: 6,
                ),
                const UserTopDivider(),
                const TagSearchContent(textValue: '役職', width: 41),
                const FormatText(textValue: '常務取締役'),
                const SizedBox(
                  height: 5,
                ),
                const UserTopDivider(),
                const TagSearchContent(textValue: '年収', width: 40),
                const FormatText(textValue: '800万 ~ 1000万'),
                const SizedBox(
                  height: 10,
                ),
                const TagSearchContent(textValue: '資産', width: 40),
                const FormatText(textValue: '不動産、株、米国債'),
                const SizedBox(
                  height: 10,
                ),
                const UserTopDivider(),
                const TagSearchContent(textValue: '出身地', width: 52),
                const FormatText(textValue: '茨城県'),
                const SizedBox(
                  height: 10,
                ),
                const UserTopDivider(),
                const TagSearchContent(textValue: '趣味', width: 40),
                const FormatText(textValue: '野球（草野球チームメンバー募集中です）'),
                const SizedBox(
                  height: 10,
                ),
                const UserTopDivider(),
                const TagSearchContent(textValue: 'SNS', width: 38),
                Row(
                  children: [
                    ...List.generate(_listIcon.length, (index) {
                      return IconButton(
                        onPressed: () {},
                        icon: Icon(
                          _listIcon[index],
                          color: _listColorIcon[index],
                          size: 20,
                        ),
                      );
                    })
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FormatText extends StatelessWidget {
  const FormatText({required this.textValue, Key? key}) : super(key: key);
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color(0xff060606),
        overflow: TextOverflow.visible,
      ),
      maxLines: 5,
    );
  }
}
