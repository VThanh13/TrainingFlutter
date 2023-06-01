import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.maxFinite,
      color: const Color(0xffE5E5E5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GetFooterItem(textValue: 'ホーム', iconValue: Icons.home, size: 35),
          Stack(
            children: [
              GetFooterItem(textValue: 'マイページ', iconValue: Icons.account_circle_outlined, size: 32),
              const Positioned(
                top: 10,
                right: 7,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Color(0xffFF3C3C),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              GetFooterItem(textValue: 'ユーザー告知', iconValue: Icons.volume_up_outlined, size: 32),
              const Positioned(
                top: 10,
                right: 7,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Color(0xffFF3C3C),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              GetFooterItem(textValue: 'イベント\nコミュニティ', iconValue: Icons.calendar_today_outlined, size: 28),
              const Positioned(
                top: 10,
                right: 7,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Color(0xffFF3C3C),
                ),
              ),
            ],
          ),
          GetFooterItem(textValue: '会員一覧', iconValue: Icons.groups_outlined, size: 30),
          Stack(
            children: [
              GetFooterItem(textValue: 'メッセージ', iconValue: Icons.message_outlined, size: 28),
              const Positioned(
                top: 10,
                right: 7,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Color(0xffFF3C3C),
                ),
              ),
              const Positioned(
                  top: 12,
                  right: 9,

                  child: Text('23',style: TextStyle(
                      fontSize: 6, color: Color(0xffFFFFFF)
                  ),))
            ],
          ),

        ],
      ),
    );
  }
}

class GetFooterItem extends StatelessWidget {
  GetFooterItem(
      {required this.textValue, required this.iconValue, required this.size, super.key});

  late String textValue;
  late IconData iconValue;
  late double size;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(iconValue,
            size: size,),

          color: const Color(0xff212862),
        ),
        Text(textValue,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 6,
              color: Color(0xff212862)
          ),),
      ],
    );
  }
}