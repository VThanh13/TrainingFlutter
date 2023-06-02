import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 104,
          width: double.maxFinite,
          color: const Color(0xffEAE9E9),
        ),
        const Positioned(
            top: 14,
            left: 10,
            child: SizedBox(
              height: 76,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Image(
                  image: AssetImage('assets/images/biz_design/image_1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            )),
        const Positioned(
            top: 13,
            left: 98,
            child: Text(
              '田中  武彦',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff060606)),
            )),
        const Positioned(
            left: 98,
            top: 33,
            child: Text(
              '会社員',
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w700,
                color: Color(0xff333333),
              ),
            )),
        const Positioned(
            left: 98,
            top: 48,
            child: Text(
              '建設業 > 営業事務',
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w400,
                color: Color(0xff939598),
              ),
            )),
        const Positioned(
            left: 98,
            top: 63,
            child: Text(
              '五洋建設株式会社',
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w400,
                color: Color(0xff939598),
              ),
            )),
        const Positioned(
            left: 98,
            top: 78,
            child: Text(
              '東京都 杉並区',
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w700,
                color: Color(0xff333333),
              ),
            )),
        const Positioned(
            top: 17,
            left: 173,
            child: Text(
              '36歳',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            )),
        Positioned(
            top: 5,
            left: 216,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mail,
                color: Color(
                  0xffDD4A30,
                ),
                size: 25,
              ),
            )),
        Positioned(
            right: 10,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                color: Color(0xff060606),
                size: 25,
              ),
            )),
        const Positioned(
            right: 10,
            top: 31,
            child: Text(
              '最終ログイン : 1日前',
              style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff333333)),
            )),
        Positioned(
            right: 10,
            top: 53,
            child: Container(
              height: 43,
              width: 149,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border:
                      Border.all(width: 0.3, color: const Color(0xffDD4A30))),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    'はじめまして\nよろしくお願いいたします。',
                    style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.visible),
                    maxLines: 2,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
