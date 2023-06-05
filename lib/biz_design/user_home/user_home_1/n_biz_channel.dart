import 'package:flutter/material.dart';

import 'material_top/icon_and_text.dart';
import 'material_top/text_info.dart';

class NBizChannel extends StatelessWidget {
  const NBizChannel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 38,
          width: double.maxFinite,
          color: const Color(0xffFFF8F3),
          child: const IconAndText(
            textValue: 'n-Biz Channel',
            iconValue: Icons.video_call_outlined,
            size: 20,
          ),
        ),
        SizedBox(
          height: 193,
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 9, 0, 1),
                child: Text(
                  '2020.00.00（月）',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),
              const TextInfo(
                  textValue: 'タイトルが入ります、タイトルが入ります、タイトルが入ります'),
              const SizedBox(
                height: 11,
              ),
              Center(
                child: Container(
                  height: 131,
                  width: 279,
                  color: const Color(0xffF2F2F2),
                  child: const Image(
                    image: AssetImage(
                        'assets/images/biz_design/image_40.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
