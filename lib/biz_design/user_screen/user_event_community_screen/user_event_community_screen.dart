import 'package:flutter/material.dart';

import '../../common/avatar_user.dart';

class UserEventCommunityScreen extends StatefulWidget {
  const UserEventCommunityScreen({Key? key}) : super(key: key);

  @override
  State<UserEventCommunityScreen> createState() =>
      _UserEventCommunityScreenState();
}

class _UserEventCommunityScreenState extends State<UserEventCommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              height: 96,
              width: double.maxFinite,
              color: index % 2 != 0
                  ? const Color(0xffFAFAFA)
                  : const Color(0xffE5E5E5),
              child: const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          '2020.00.00（月）',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        AvatarUser(
                          width: 36,
                          height: 34,
                          urlImage: 'assets/images/biz_design/image_1.png',
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '田中  武彦',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff060606),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TagInfo(
                      text: '趣味/音楽',
                    ),
                    Text(
                      'イベント・コミュニティタイトルが入ります、イベント・コミュニ'
                      '\nティタイトルが入ります',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Color(0xff060606),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class TagInfo extends StatelessWidget {
  const TagInfo({required this.text, Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 46,
      color: text == 'ビジネス'
          ? const Color(0xffCE2424)
          : text == '趣味/音楽'
              ? const Color(0xff5A8E5C)
              : const Color(0xff454890),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 7,
            fontWeight: FontWeight.w700,
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
    );
  }
}
