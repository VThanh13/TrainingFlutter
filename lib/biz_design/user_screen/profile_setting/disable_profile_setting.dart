import 'package:code/biz_design/common/avatar_user.dart';
import 'package:code/biz_design/common/tag_search_custom.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_material/top_text_field_custom.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_screen.dart';
import 'package:code/biz_design/user_home/user_home_screen/material_home_screen/home_divider.dart';
import 'package:code/biz_design/user_screen/profile_setting/profile_setting_material/blue_border_tag.dart';
import 'package:flutter/material.dart';

class DisableProfileSetting extends StatefulWidget {
  const DisableProfileSetting({Key? key}) : super(key: key);

  @override
  State<DisableProfileSetting> createState() => _DisableProfileSettingState();
}

class _DisableProfileSettingState extends State<DisableProfileSetting> {
  final List _listJobUserWant = [];
  final List _listAreaToMatch = [];
  final List _listSkillPerson = [];
  final List _listQualification = [];

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
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: FutureBuilder(
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
            padding: const EdgeInsets.fromLTRB(10, 23, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlueBorderTag(textValue: '公開中'),
                    BlueBorderTag(textValue: '本人書類確認済み'),
                    BlueBorderTag(textValue: 'プレミアム会員'),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 180,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              const SizedBox(
                                width: 95,
                              ),
                              const AvatarUser(
                                width: 92,
                                height: 92,
                                urlImage:
                                    'assets/images/biz_design/image_1.png',
                              ),
                              Positioned(
                                left: 55,
                                top: 55,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add_circle_sharp,
                                    color: Color(0xff212862),
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 76,
                            height: 33,
                            margin: const EdgeInsets.only(top: 14),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xff000000),
                                width: 1,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'My QRコード\nを表示',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 140,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TagSearchCustom(textValue: 'お名前'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TopTextField(
                                  hintText: '田中',
                                  width: 106,
                                ),
                                TopTextField(
                                  hintText: '武彦',
                                  width: 106,
                                ),
                              ],
                            ),
                            TagSearchCustom(textValue: '年齢'),
                            TopTextField(
                              hintText: '36',
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const TagSearchCustom(textValue: '一言コメント（公開されます）'),
                const TopTextField(hintText: 'はじめまして\nよろしくお願いいたします。'),
                const TagSearchCustom(textValue: '職業'),
                const TopTextField(hintText: '会社員'),
                const TagSearchCustom(textValue: '業種・職種'),
                const TopTextField(hintText: '建設業 > 営業'),
                const TagSearchCustom(textValue: '会社名'),
                const TopTextField(hintText: '五洋建設株式会社'),
                const TagSearchCustom(textValue: 'エリア設定'),
                const TopTextField(hintText: '東京都 杉並区'),
                const TagSearchCustom(textValue: '名刺設定'),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 134,
                      width: 240,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Image(
                          image: AssetImage(
                              'assets/images/biz_design/image_13.png'),
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xffF2F2F2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_circle_sharp,
                            color: Color(0xff212862),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: TagSearchCustom(textValue: 'ビジネスコメント'),
                ),
                const TopTextField(
                    hintText: '初めまして、既存のお客様からDX関連の相談をいただくことが多いです。\n'
                        'ITコンサルやWebシステム制作のノウハウをお持ちの方と繋がりたいと思っています。\n'
                        'よろしくお願いします。'),
                const TagSearchCustom(textValue: 'マッチングしたい職種'),
                SearchItem(listItem: _listJobUserWant),
                const TagSearchCustom(textValue: 'マッチングしたいエリア'),
                SearchItem(listItem: _listAreaToMatch),
                const TagSearchCustom(textValue: '実績、経歴'),
                const TopTextField(hintText: '\n \n'),
                const TagSearchCustom(textValue: '保有スキル'),
                SearchItem(listItem: _listSkillPerson),
                const TagSearchCustom(textValue: '保有資格'),
                SearchItem(listItem: _listQualification),
                const TagSearchCustom(textValue: '役職'),
                const TopTextField(hintText: '\n'),
                const TagSearchCustom(textValue: '年収'),
                const TopTextField(hintText: '\n'),
                const TagSearchCustom(textValue: '資産'),
                const TopTextField(hintText: '\n'),
                const TagSearchCustom(textValue: '出身地'),
                const TopTextField(hintText: '\n'),
                const TagSearchCustom(textValue: '趣味'),
                const TopTextField(hintText: '\n'),
                const TagSearchCustom(textValue: 'SNS'),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'facebook ID',
                    hintStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Twitter ID',
                    hintStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Instagram ID',
                    hintStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'TikTok ID',
                    hintStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const TopDivider(),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 35,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff060606),
                    ),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        child: SizedBox(
                          width: (MediaQuery.of(context).size.width - 28) / 3,
                          child: const Center(
                            child: Text(
                              '非公開にする',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff4C3CFF),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: const Color(0xff060606),
                        width: 1,
                      ),
                      InkWell(
                        child: SizedBox(
                          width: (MediaQuery.of(context).size.width - 28) / 3,
                          child: const Center(
                            child: Text(
                              '下書き保存する\n（公開されません）',
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff494949),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: const Color(0xff060606),
                        width: 1,
                      ),
                      InkWell(
                        child: SizedBox(
                          width: (MediaQuery.of(context).size.width - 28) / 3,
                          child: const Center(
                            child: Text(
                              '公開する',
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffDD4A30),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
