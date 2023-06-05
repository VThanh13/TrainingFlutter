import 'package:flutter/material.dart';

import 'material_top/button3.dart';
import 'material_top/icon_and_text.dart';
import 'material_top/text_info.dart';

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
            children: const [
              IconAndText(
                  textValue: '運営からのお知らせ',
                  iconValue: Icons.newspaper_rounded,
                  size: 20),
              Button3(),
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
                  textValue:
                  'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
