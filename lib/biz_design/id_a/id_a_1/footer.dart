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
          const GetFooterItem(textValue: 'ホーム', iconValue: Icons.home, size: 35),
          Stack(
            children: const [
              GetFooterItem(textValue: 'マイページ', iconValue: Icons.account_circle_outlined, size: 32),
              Positioned(
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
            children: const [
              GetFooterItem(textValue: 'ユーザー告知', iconValue: Icons.volume_up_outlined, size: 32),
              Positioned(
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
            children: const [
              GetFooterItem(textValue: 'イベント\nコミュニティ', iconValue: Icons.calendar_today_outlined, size: 28),
              Positioned(
                top: 10,
                right: 7,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Color(0xffFF3C3C),
                ),
              ),
            ],
          ),
          const GetFooterItem(textValue: '会員一覧', iconValue: Icons.groups_outlined, size: 30),
          Stack(
            children: const [
              GetFooterItem(textValue: 'メッセージ', iconValue: Icons.message_outlined, size: 28),
              Positioned(
                top: 10,
                right: 7,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Color(0xffFF3C3C),
                ),
              ),
              Positioned(
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
  const GetFooterItem(
      {required this.textValue, required this.iconValue, required this.size, super.key});

  final String textValue;
  final IconData iconValue;
  final double size;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
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