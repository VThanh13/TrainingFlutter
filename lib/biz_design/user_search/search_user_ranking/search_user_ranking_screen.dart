import 'package:flutter/material.dart';

import '../../common/avatar_user.dart';
import '../search_recently_login_user/search_result_material/user_age.dart';
import '../search_recently_login_user/search_result_material/user_company.dart';
import '../search_recently_login_user/search_result_material/user_description.dart';
import '../search_recently_login_user/search_result_material/user_hometown.dart';
import '../search_recently_login_user/search_result_material/user_job.dart';
import '../search_recently_login_user/search_result_material/user_name.dart';
import '../search_recently_login_user/search_result_material/user_position.dart';

class SearchUserRankingScreen extends StatefulWidget {
  const SearchUserRankingScreen({required this.index,Key? key}) : super(key: key);
  final int index;

  @override
  State<SearchUserRankingScreen> createState() =>
      _SearchUserRankingScreenState();
}

class _SearchUserRankingScreenState extends State<SearchUserRankingScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 5, top: 10),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 18,
              width: 62,
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: const Color(0xffFFF8F3),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                border: Border.all(
                  width: 1,
                  color: const Color(0xffE1E1E1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: Icon(
                      Icons.generating_tokens_outlined,
                      size: 10,
                      color: Colors.orange,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      '${ widget.index + 1}位',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AvatarUser(
                  width: 52,
                  height: 52,
                  urlImage: 'assets/images/biz_design/image_11.png',
                ),
                SizedBox(width: 3),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 115,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UserName(userName: '武井 えみ'),
                          UserAge(userAge: '22歳'),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 115,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UserPosition(userPosition: '会社員'),
                          UserJob(userJob: 'ITコンサル'),
                        ],
                      ),
                    ),
                    UserCompany(userCompany: 'キャリアネクスト 株式会社'),
                    UserHometown(userHometown: '大阪府'),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const UserDescription(userDescription: '良い出会いを期待しています！'),
          ],
        ),
      ),
    );
  }
}
