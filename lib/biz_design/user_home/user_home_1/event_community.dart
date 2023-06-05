import 'package:code/biz_design/user_home/user_home_1/material_top/text_info.dart';
import 'package:flutter/material.dart';

import 'material_top/box_new.dart';
import 'material_top/button3.dart';
import 'material_top/icon_and_text.dart';

class EventCommunity extends StatelessWidget {
  const EventCommunity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 46,
          width: double.maxFinite,
          color: const Color(0xffFFF8F3),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndText(
                  textValue: 'イベント・コミュニティ',
                  iconValue: Icons.calendar_today_outlined,
                  size: 20),
              Button3(),
            ],
          ),
        ),
        SizedBox(
          height: 186,
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    const BoxNew(),
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                      height: 18,
                      width: 46,
                      decoration: const BoxDecoration(
                          color: Color(0xffCE2424)),
                      child: const Center(
                        child: Text(
                          'ビジネス',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 6),
                child: TextInfo(
                  textValue:
                  'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    const BoxNew(),
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                      height: 18,
                      width: 58,
                      decoration: const BoxDecoration(
                          color: Color(0xff5A8E5C)),
                      child: const Center(
                        child: Text(
                          '趣味/音楽',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 6),
                child: TextInfo(
                  textValue:
                  'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    const BoxNew(),
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                      height: 18,
                      width: 70,
                      decoration: const BoxDecoration(
                        color: Color(0xff454890),
                      ),
                      child: const Center(
                        child: Text(
                          '趣味/スポーツ',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 6),
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
