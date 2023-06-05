import 'package:code/biz_design/user_home/user_home_2/top_search_material/row_add.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_material/text_field_search.dart';
import 'package:flutter/cupertino.dart';

import 'blue_button.dart';

class SearchAreaPerson extends StatefulWidget {
  const SearchAreaPerson({Key? key}) : super(key: key);

  @override
  State<SearchAreaPerson> createState() => _SearchAreaPersonState();
}

class _SearchAreaPersonState extends State<SearchAreaPerson> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        BlueButton(
          height: 17,
          width: 147,
          textValue: '相手が探しているエリア',
        ),
        SizedBox(
          height: 10,
        ),
        TextFieldSearch(
          labelText: '東京都 杉並区',
        ),
        SizedBox(
          height: 10,
        ),
        TextFieldSearch(
          labelText: '東京都',
        ),
        SizedBox(
          height: 10,
        ),
        RowAdd(
          dataText: '相手の探しているエリアを追加',
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
