import 'package:flutter/material.dart';

import 'blue_button.dart';

class SearchFreeWord extends StatefulWidget {
  const SearchFreeWord({Key? key}) : super(key: key);

  @override
  State<SearchFreeWord> createState() => _SearchFreeWordState();
}

class _SearchFreeWordState extends State<SearchFreeWord> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlueButton(
          height: 17,
          width: 89,
          textValue: 'フリーワード',
        ),
        SizedBox(
          height: 10,
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
