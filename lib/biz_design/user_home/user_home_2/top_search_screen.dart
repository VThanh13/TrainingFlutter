import 'package:auto_route/auto_route.dart';
import 'package:code/biz_design/common/custom_button.dart';
import 'package:code/biz_design/router/app_router.gr.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_material/top_text_field_custom.dart';
import 'package:flutter/material.dart';

import '../../common/tag_search_content.dart';


@RoutePage()
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
                  height: 50,
                  width: double.maxFinite,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.cancel_presentation_sharp,
                          size: 25,
                        ),
                      ),
                      const Text(
                        '絞り込み検索',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xff000000),
                        ),
                      ),
                      const Text(
                        '全てクリア',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff001AFF),
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
                      AutoRouter.of(context).push(const SearchResult());
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

class SearchItem extends StatefulWidget {
  const SearchItem({required this.listItem,
    required this.textController,Key? key}) : super(key: key);
  final List listItem;
  final TextEditingController textController;

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.listItem.asMap().entries.map((entry){
          int index = entry.key;
          String item = entry.value;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item, style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff060606),
                  ),),
                  IconButton(onPressed: (){
                    setState(() {
                      widget.listItem.removeAt(index);
                    });
                  },
                    icon: const Icon(Icons.cancel_outlined,
                      size: 30,color: Color(0xff060606),),),
                ],
              ),
              const Divider(
                height: 0,
                color: Color(0xffDD4A30),
                indent: 0,
                thickness: 1,
              ),
            ],
          );
        }),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  widget.listItem.add(
                      widget.textController.text
                  );
                  widget.textController.text = '';
                });
              },
              icon: const Icon(
                Icons.add_circle_sharp,
                size: 30,
                color: Color(0xff212862),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: widget.textController,
                decoration: const InputDecoration(
                    hintText: 'マッチングしたい職業を追加',
                    hintStyle: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}



class SearchJob extends StatefulWidget {
  const SearchJob({Key? key}) : super(key: key);

  @override
  State<SearchJob> createState() => _SearchJobState();
}

class _SearchJobState extends State<SearchJob> {
  final List listJobItem = [];
  final TextEditingController jobItem = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TagSearchContent(
          width: 40,
          textValue: '職業',
        ),
        SearchItem(listItem: listJobItem, textController: jobItem),
      ],
    );
  }
}

class SearchIndustry extends StatefulWidget {
  const SearchIndustry({Key? key}) : super(key: key);

  @override
  State<SearchIndustry> createState() => _SearchIndustryState();
}

class _SearchIndustryState extends State<SearchIndustry> {
  final List listIndustry = [];
  final TextEditingController industryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TagSearchContent(
          width: 76,
          textValue: '業種・職種',
        ),
        SearchItem(listItem: listIndustry, textController: industryController),
      ],
    );
  }
}

class SearchArea extends StatefulWidget {
  const SearchArea({Key? key}) : super(key: key);

  @override
  State<SearchArea> createState() => _SearchAreaState();
}

class _SearchAreaState extends State<SearchArea> {
  final List listArea = [];
  final TextEditingController areaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TagSearchContent(
          width: 51,
          textValue: 'エリア',
        ),
        SearchItem(listItem: listArea, textController: areaController),
      ],
    );
  }
}

class SearchQualification extends StatefulWidget {
  const SearchQualification({Key? key}) : super(key: key);

  @override
  State<SearchQualification> createState() => _SearchQualificationState();
}

class _SearchQualificationState extends State<SearchQualification> {
  final List listQualification = [];
  final TextEditingController qualificationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TagSearchContent(
          width: 65,
          textValue: '保有資格',
        ),
        SearchItem(listItem: listQualification, textController: qualificationController),
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

class SearchIndustryOther extends StatefulWidget {
  const SearchIndustryOther({Key? key}) : super(key: key);

  @override
  State<SearchIndustryOther> createState() => _SearchIndustryOtherState();
}

class _SearchIndustryOtherState extends State<SearchIndustryOther> {
  final List listIndustryOther = [];
  final TextEditingController industryOtherController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TagSearchContent(
          width: 173,
          textValue: '相手が探している業種・職種',
        ),
        SearchItem(listItem: listIndustryOther, textController: industryOtherController),
      ],
    );
  }
}

class SearchAreaPerson extends StatefulWidget {
  const SearchAreaPerson({Key? key}) : super(key: key);

  @override
  State<SearchAreaPerson> createState() => _SearchAreaPersonState();
}

class _SearchAreaPersonState extends State<SearchAreaPerson> {
  final List listAreaPerson = [];
  final TextEditingController areaPersonController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TagSearchContent(
          width: 147,
          textValue: '相手が探しているエリア',
        ),
        SearchItem(listItem: listAreaPerson, textController: areaPersonController),
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
