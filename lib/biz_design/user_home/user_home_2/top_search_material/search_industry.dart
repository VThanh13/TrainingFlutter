import 'package:code/biz_design/user_home/user_home_2/top_search_material/row_add.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_material/text_field_search.dart';
import 'package:flutter/cupertino.dart';

import 'blue_button.dart';

class SearchIndustry extends StatefulWidget {
  const SearchIndustry({Key? key}) : super(key: key);

  @override
  State<SearchIndustry> createState() => _SearchIndustryState();
}

class _SearchIndustryState extends State<SearchIndustry> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        BlueButton(height: 17, width: 76, textValue: '業種・職種'),
        SizedBox(
          height: 10,
        ),
        TextFieldSearch(labelText: '建設業 > 営業'),
        SizedBox(
          height: 10,
        ),
        TextFieldSearch(labelText: 'IT > コンサル'),
        SizedBox(
          height: 10,
        ),
        RowAdd(dataText: 'マッチングしたい業種・職種を追加'),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
