import 'package:code/biz_design/user_search/search_recently_login_user/search_result_material/user_age.dart';
import 'package:code/biz_design/user_search/search_recently_login_user/search_result_material/user_company.dart';
import 'package:code/biz_design/user_search/search_recently_login_user/search_result_material/user_description.dart';
import 'package:code/biz_design/user_search/search_recently_login_user/search_result_material/user_hometown.dart';
import 'package:code/biz_design/user_search/search_recently_login_user/search_result_material/user_job.dart';
import 'package:code/biz_design/user_search/search_recently_login_user/search_result_material/user_name.dart';
import 'package:code/biz_design/user_search/search_recently_login_user/search_result_material/user_position.dart';
import 'package:flutter/cupertino.dart';

import '../../common/avatar_user.dart';

class SearchLoginUser extends StatefulWidget {
  const SearchLoginUser({Key? key}) : super(key: key);

  @override
  State<SearchLoginUser> createState() => _SearchLoginUserState();
}

class _SearchLoginUserState extends State<SearchLoginUser> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 5),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 17,
              width: 72,
              margin: const EdgeInsets.only(top: 16, bottom: 9),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: const Color(0xff212862),
                ),
              ),
              child: const Center(
                child: Text(
                  '本人書類確認済み',
                  style: TextStyle(
                    color: Color(0xff212862),
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                  ),
                ),
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
                SizedBox(width: 3,),
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
