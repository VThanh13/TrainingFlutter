import 'package:code/biz_design/user_home/user_home_2/top_search_material/row_add.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_material/text_field_search.dart';
import 'package:flutter/cupertino.dart';

import 'blue_button.dart';

class SearchIndustryOther extends StatefulWidget {
  const SearchIndustryOther({Key? key}) : super(key: key);

  @override
  State<SearchIndustryOther> createState() => _SearchIndustryOtherState();
}

class _SearchIndustryOtherState extends State<SearchIndustryOther> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        BlueButton(
          height: 17,
          width: 173,
          textValue: '相手が探している業種・職種',
        ),
        SizedBox(
          height: 10,
        ),
        TextFieldSearch(
          labelText: '建設業 > 営業',
        ),
        SizedBox(
          height: 10,
        ),
        TextFieldSearch(
          labelText: 'IT > コンサル',
        ),
        SizedBox(
          height: 10,
        ),
        RowAdd(
          dataText: '相手の探している業種・職種を追加',
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
