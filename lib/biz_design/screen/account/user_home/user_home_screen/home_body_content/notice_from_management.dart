import 'package:code/biz_design/core/common/custom_button.dart';
import 'package:flutter/material.dart';

import '../material_home_screen/content_value.dart';
import '../material_home_screen/item_content.dart';

class NoticeFromManagement extends StatelessWidget {
  const NoticeFromManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 46,
          width: double.maxFinite,
          color: const Color(0xffFFF8F3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ItemContent(
                textValue: '運営からのお知らせ',
                iconValue: Icons.newspaper_rounded,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CustomButton(
                  height: 25,
                  width: 114,
                  text: '一覧をみる',
                  tab: () {},
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 120,
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 12, 0, 1),
                child: Text(
                  '2020.00.00（月）',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                height: 12,
                width: 46,
                margin: const EdgeInsets.only(left: 11),
                color: const Color(0xff625148),
                child: const Center(
                  child: Text(
                    '重要',
                    style: TextStyle(
                      fontSize: 7,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(1, 3, 0, 0),
                child: TextInfo(
                  textValue: 'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
