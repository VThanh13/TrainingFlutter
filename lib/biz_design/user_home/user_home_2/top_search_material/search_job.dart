import 'package:code/biz_design/user_home/user_home_2/top_search_material/row_add.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_material/text_field_search.dart';
import 'package:flutter/cupertino.dart';

import 'blue_button.dart';

class SearchJob extends StatefulWidget {
  const SearchJob({Key? key}) : super(key: key);

  @override
  State<SearchJob> createState() => _SearchJobState();
}

class _SearchJobState extends State<SearchJob> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        BlueButton(
          height: 17,
          width: 40,
          textValue: '職業',
        ),
        TextFieldSearch(
          labelText: 'CEO',
        ),
        SizedBox(
          height: 10,
        ),
        TextFieldSearch(
          labelText: '自営業',
        ),
        SizedBox(
          height: 10,
        ),
        RowAdd(dataText: 'マッチングしたい職業を追加'),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
