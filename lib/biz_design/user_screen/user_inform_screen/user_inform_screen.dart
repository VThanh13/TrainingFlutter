import 'package:code/biz_design/common/avatar_user.dart';
import 'package:flutter/material.dart';

class UserInformScreen extends StatefulWidget {
  const UserInformScreen({Key? key}) : super(key: key);

  @override
  State<UserInformScreen> createState() => _UserInformScreenState();
}

class _UserInformScreenState extends State<UserInformScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              height: 70,
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
                    Text(
                      '告知タイトルが入ります、告知タイトルが入ります',
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
