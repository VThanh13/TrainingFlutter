import 'package:flutter/material.dart';

import '../../../../../core/common/custom_button.dart';
import '../material_home_screen/content_value.dart';
import '../material_home_screen/home_divider.dart';
import '../material_home_screen/item_content.dart';
import '../material_home_screen/new_notification.dart';

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ItemContent(
                  textValue: 'イベント・コミュニティ',
                  iconValue: Icons.calendar_today_outlined,
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
          height: 186,
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    const BoxNew(),
                    Container(
                      height: 18,
                      width: 46,
                      margin: const EdgeInsets.only(top: 7),
                      decoration: const BoxDecoration(color: Color(0xffCE2424)),
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
                  textValue: 'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    const BoxNew(),
                    Container(
                      height: 18,
                      width: 58,
                      margin: const EdgeInsets.only(top: 7),
                      decoration: const BoxDecoration(color: Color(0xff5A8E5C)),
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
                  textValue: 'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    const BoxNew(),
                    Container(
                      height: 18,
                      width: 70,
                      margin: const EdgeInsets.only(top: 7),
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
                  textValue: 'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...',
                ),
              ),
            ],
          ),
        ),
        const TopDivider(),
      ],
    );
  }
}
