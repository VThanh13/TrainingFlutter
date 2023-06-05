import 'package:code/biz_design/user_home/user_home_2/top_search_material/row_add.dart';
import 'package:code/biz_design/user_home/user_home_2/top_search_material/text_field_search.dart';
import 'package:flutter/cupertino.dart';

import 'blue_button.dart';

class SearchQualification extends StatefulWidget {
  const SearchQualification({Key? key}) : super(key: key);

  @override
  State<SearchQualification> createState() => _SearchQualificationState();
}

class _SearchQualificationState extends State<SearchQualification> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlueButton(height: 17, width: 65, textValue: '保有資格'),
        SizedBox(
          height: 10,
        ),
        TextFieldSearch(labelText: 'IT > 情報管理者検定'),
        SizedBox(
          height: 10,
        ),
        TextFieldSearch(labelText: 'IT > 情報管理者検定'),
        SizedBox(
          height: 10,
        ),
        RowAdd(dataText: 'マッチングしたい資格を追加'),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
