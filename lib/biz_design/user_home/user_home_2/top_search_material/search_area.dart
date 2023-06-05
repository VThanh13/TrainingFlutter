import 'package:code/biz_design/user_home/user_home_2/top_search_material/row_add.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_material/text_field_search.dart';
import 'package:flutter/cupertino.dart';

import 'blue_button.dart';

class SearchArea extends StatefulWidget {
  const SearchArea({Key? key}) : super(key: key);

  @override
  State<SearchArea> createState() => _SearchAreaState();
}

class _SearchAreaState extends State<SearchArea> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlueButton(height: 17, width: 51, textValue: 'エリア'),
        SizedBox(
          height: 10,
        ),
        TextFieldSearch(labelText: '東京都 杉並区'),
        SizedBox(
          height: 10,
        ),
        TextFieldSearch(labelText: '東京都'),
        SizedBox(
          height: 10,
        ),
        RowAdd(dataText: 'マッチングしたいエリアを追加'),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
