import 'package:code/biz_design/user_home/user_home_2/top_search_material/text_field_no_icon.dart';
import 'package:flutter/cupertino.dart';

import 'blue_button.dart';

class SearchAge extends StatefulWidget {
  const SearchAge({Key? key}) : super(key: key);

  @override
  State<SearchAge> createState() => _SearchAgeState();
}

class _SearchAgeState extends State<SearchAge> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        BlueButton(height: 17, width: 41, textValue: '年齢'),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(right: 8, left: 8),
          child: TextFieldNoIcon(
            width: double.maxFinite,
            hintText: '35',
          ),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
