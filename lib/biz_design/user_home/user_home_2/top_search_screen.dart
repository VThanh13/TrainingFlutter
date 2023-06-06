import 'package:code/biz_design/common/custom_button.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_material/top_text_field_custom.dart';
import 'package:flutter/material.dart';

import '../../common/more_search_option.dart';
import '../../common/tag_search_content.dart';
import '../../common/text_field_search_custom.dart';
import '../../user_search/user_search_1/search_result.dart';

class TopSearch extends StatefulWidget {
  const TopSearch({Key? key}) : super(key: key);

  @override
  State<TopSearch> createState() => _TopSearchState();
}

class _TopSearchState extends State<TopSearch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                  width: double.maxFinite,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Image(
                            image: AssetImage(
                                'assets/images/biz_design/Vector_1.png'),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(108, 8, 0, 0),
                        child: Text(
                          '絞り込み検索',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(68, 12, 0, 0),
                        child: Text(
                          '全てクリア',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff001AFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SearchJob(),
                const SearchIndustry(),
                const SearchArea(),
                const SearchQualification(),
                const SearchAnnualIncome(),
                const SearchAge(),
                const SearchIndustryOther(),
                const SearchAreaPerson(),
                const SearchFreeWord(),
                Center(
                  child: CustomButton(
                    height: 38,
                    width: 272,
                    text: '検索する',
                    size: 14,
                    tab: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchResult(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchJob extends StatelessWidget {
  const SearchJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TagSearchContent(
          width: 40,
          textValue: '職業',
        ),
        TextFieldSearch(
          labelText: 'CEO',
        ),
        TextFieldSearch(
          labelText: '自営業',
        ),
        MoreSearchOption(dataText: 'マッチングしたい職業を追加'),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class SearchIndustry extends StatelessWidget {
  const SearchIndustry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TagSearchContent(
          width: 76,
          textValue: '業種・職種',
        ),
        TextFieldSearch(labelText: '建設業 > 営業'),
        TextFieldSearch(labelText: 'IT > コンサル'),
        MoreSearchOption(dataText: 'マッチングしたい業種・職種を追加'),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class SearchArea extends StatelessWidget {
  const SearchArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TagSearchContent(
          width: 51,
          textValue: 'エリア',
        ),
        SizedBox(
          height: 10,
        ),
        TextFieldSearch(labelText: '東京都 杉並区'),
        TextFieldSearch(labelText: '東京都'),
        MoreSearchOption(dataText: 'マッチングしたいエリアを追加'),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class SearchQualification extends StatelessWidget {
  const SearchQualification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TagSearchContent(
          width: 65,
          textValue: '保有資格',
        ),
        TextFieldSearch(labelText: 'IT > 情報管理者検定'),
        TextFieldSearch(labelText: 'IT > 情報管理者検定'),
        MoreSearchOption(dataText: 'マッチングしたい資格を追加'),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class SearchAnnualIncome extends StatelessWidget {
  const SearchAnnualIncome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TagSearchContent(
          width: 41,
          textValue: '年収',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: TopTextField(
                width: 137,
                hintText: '201 万円',
              ),
            ),
            Text(
              '~',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xff060606),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: TopTextField(
                width: 137,
                hintText: '500 万円',
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class SearchAge extends StatelessWidget {
  const SearchAge({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TagSearchContent(
          width: 41,
          textValue: '年齢',
        ),
        Padding(
          padding: EdgeInsets.only(right: 8, left: 8),
          child: TopTextField(
            width: double.maxFinite,
            hintText: '35',
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class SearchIndustryOther extends StatelessWidget {
  const SearchIndustryOther({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TagSearchContent(
          width: 173,
          textValue: '相手が探している業種・職種',
        ),
        TextFieldSearch(
          labelText: '建設業 > 営業',
        ),
        TextFieldSearch(
          labelText: 'IT > コンサル',
        ),
        MoreSearchOption(
          dataText: '相手の探している業種・職種を追加',
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class SearchAreaPerson extends StatelessWidget {
  const SearchAreaPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TagSearchContent(
          width: 147,
          textValue: '相手が探しているエリア',
        ),
        TextFieldSearch(
          labelText: '東京都 杉並区',
        ),
        TextFieldSearch(
          labelText: '東京都',
        ),
        MoreSearchOption(
          dataText: '相手の探しているエリアを追加',
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class SearchFreeWord extends StatelessWidget {
  const SearchFreeWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TagSearchContent(
          width: 89,
          textValue: 'フリーワード',
        ),
        Padding(
          padding: EdgeInsets.only(right: 8, left: 8),
          child: SizedBox(
            width: double.maxFinite,
            child: TextField(
              cursorColor: Color(0xffDD4A30),
              decoration: InputDecoration(
                hintText: '特定の固有名詞など一般的なワードで検索してください',
                hintStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff9A9A9A),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffDD4A30),
                    width: 1,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffDD4A30),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 49,
        ),
      ],
    );
  }
}
