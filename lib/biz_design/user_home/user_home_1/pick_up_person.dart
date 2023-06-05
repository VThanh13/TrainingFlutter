import 'package:flutter/material.dart';

import '../../user_screen/user_screen_1/user_top.dart';
import 'material_top/avatar_user.dart';
import 'material_top/icon_and_text.dart';

class PickUpPerson extends StatelessWidget {
  const PickUpPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 38,
          width: double.maxFinite,
          color: const Color(0xffFFF8F3),
          child: const IconAndText(
            textValue: '今週のピックアップパーソン',
            iconValue: Icons.account_circle_outlined,
            size: 20,
          ),
        ),
        SizedBox(
          height: 102,
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 12, 0),
                child: AvatarUser(
                  urlImage: 'assets/images/biz_design/image_1.png',
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 42,
                    width: 269,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '今週のピックアップパーソンは、大手ゼネコンで働く田中\nさんです。国際色豊かな経歴を持つ彼のプロフィールを是非\nチェックしてください。',
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  SizedBox(
                    height: 25,
                    width: 125,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFF3C3C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const UserTop()));
                      },
                      child: const Text(
                        'プロフィールをみる',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
