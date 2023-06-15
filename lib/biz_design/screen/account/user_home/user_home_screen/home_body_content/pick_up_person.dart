import 'package:auto_route/auto_route.dart';
import 'package:code/biz_design/router/app_router.gr.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/avatar_user.dart';
import '../../../../../core/common/custom_button.dart';
import '../material_home_screen/home_divider.dart';
import '../material_home_screen/item_content.dart';

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
          child: const ItemContent(
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
                  height: 62,
                  width: 65,
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
                  CustomButton(
                    height: 25,
                    width: 125,
                    text: 'プロフィールをみる',
                    tab: () {
                      AutoRouter.of(context).push(const UserTop());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        const TopDivider(),
      ],
    );
  }
}
