import 'package:code/biz_design/user_home/user_home_2/top_search_material/text_field_no_icon.dart';
import 'package:flutter/cupertino.dart';

import 'blue_button.dart';

class SearchAnnualIncome extends StatefulWidget {
  const SearchAnnualIncome({Key? key}) : super(key: key);

  @override
  State<SearchAnnualIncome> createState() => _SearchAnnualIncomeState();
}

class _SearchAnnualIncomeState extends State<SearchAnnualIncome> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlueButton(height: 17, width: 41, textValue: '年収'),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: TextFieldNoIcon(
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
              child: TextFieldNoIcon(
                width: 137,
                hintText: '500 万円',
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
