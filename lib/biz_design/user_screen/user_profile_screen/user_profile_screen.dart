import 'package:code/biz_design/common/tag_search_custom.dart';
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

  late final ScrollController _scrollController;
  late final PageStorageKey _storageKey;
  double? _savedPosition;

  @override
  void initState() {
    super.initState();
    _storageKey = const PageStorageKey('user_profile_scroll_position');
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration.zero),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (_savedPosition != null) {
            _scrollController.animateTo(
              _savedPosition!,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
          return SingleChildScrollView(
            controller: _scrollController,
            key: _storageKey,
            child: Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: SingleChildScrollView(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TagSearchCustom(
                          textValue: 'ビジネスコメント',
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
                        const TagSearchCustom(
                          textValue: '繋がりたい業種・職種',
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              RedBorderTag(
                                textValue: 'IT',
                              ),
                              RedBorderTag(
                                textValue: 'IT > WEB制作',
                              ),
                              RedBorderTag(
                                textValue: 'IT > コンサル',
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: UserTopDivider(),
                        ),
                        const TagSearchCustom(
                          textValue: 'エリア',
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              RedBorderTag(
                                textValue: '東京都',
                              ),
                              RedBorderTag(
                                textValue: '千葉県',
                              ),
                              RedBorderTag(
                                textValue: '大阪府',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const UserTopDivider(),
                        const TagSearchCustom(
                          textValue: '実績、経歴',
                        ),
                        const FormatText(
                            textValue: '2000年 新卒でゼネコン大手〇〇に入社'
                                '\n2003年 中国重慶にて駐在、中国語を取取得2006年 日本へ帰任後、現職へ転転職\n'
                                '\n主に大手企業への法人営業を担当'),
                        const SizedBox(
                          height: 6,
                        ),
                        const UserTopDivider(),
                        const TagSearchCustom(
                          textValue: '保有スキル',
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Row(
                          children: [
                            RedBorderTag2(
                              textValue: '営業',
                            ),
                            RedBorderTag2(
                              textValue: 'CAD',
                            ),
                            RedBorderTag2(
                              textValue: '英語',
                            ),
                            RedBorderTag2(
                              textValue: '中国語',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const UserTopDivider(),
                        const TagSearchCustom(
                          textValue: '保有資格',
                        ),
                        const FormatText(textValue: '英検一級'),
                        const SizedBox(
                          height: 6,
                        ),
                        const UserTopDivider(),
                        const TagSearchCustom(
                          textValue: '役職',
                        ),
                        const FormatText(textValue: '常務取締役'),
                        const SizedBox(
                          height: 5,
                        ),
                        const UserTopDivider(),
                        const TagSearchCustom(
                          textValue: '年収',
                        ),
                        const FormatText(textValue: '800万 ~ 1000万'),
                        const SizedBox(
                          height: 10,
                        ),
                        const TagSearchCustom(
                          textValue: '資産',
                        ),
                        const FormatText(textValue: '不動産、株、米国債'),
                        const SizedBox(
                          height: 10,
                        ),
                        const UserTopDivider(),
                        const TagSearchCustom(
                          textValue: '出身地',
                        ),
                        const FormatText(textValue: '茨城県'),
                        const SizedBox(
                          height: 10,
                        ),
                        const UserTopDivider(),
                        const TagSearchCustom(
                          textValue: '趣味',
                        ),
                        const FormatText(textValue: '野球（草野球チームメンバー募集中です）'),
                        const SizedBox(
                          height: 10,
                        ),
                        const UserTopDivider(),
                        const TagSearchCustom(
                          textValue: 'SNS',
                        ),
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
            ),
          );
        });
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
