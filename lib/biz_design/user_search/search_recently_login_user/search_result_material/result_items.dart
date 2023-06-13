import 'package:flutter/material.dart';

import '../../../common/avatar_user.dart';

class SearchResultItems extends StatefulWidget {
  const SearchResultItems({this.index, this.isRankingUser, Key? key})
      : super(key: key);
  final bool? isRankingUser;
  final int? index;

  @override
  State<SearchResultItems> createState() => _SearchResultItemsState();
}

class _SearchResultItemsState extends State<SearchResultItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 5, top: 10),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.isRankingUser != null
                ? Container(
                    height: 17,
                    width: 72,
                    margin: const EdgeInsets.only(top: 10, bottom: 9),
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
                  )
                : Container(
                    height: 18,
                    width: 62,
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
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
                            '${widget.index! + 1}位',
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
              children: [
                AvatarUser(
                  width: 52,
                  height: 52,
                  urlImage: 'assets/images/biz_design/image_11.png',
                ),
                SizedBox(width: 3),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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

class UserAge extends StatelessWidget {
  const UserAge({required this.userAge, Key? key}) : super(key: key);
  final String userAge;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$userAge歳',
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
    );
  }
}

class UserCompany extends StatelessWidget {
  const UserCompany({required this.userCompany, Key? key}) : super(key: key);
  final String userCompany;

  @override
  Widget build(BuildContext context) {
    return Text(
      userCompany,
      style: const TextStyle(
        fontSize: 9,
        fontWeight: FontWeight.w400,
        color: Color(0xff939598),
        overflow: TextOverflow.visible,
      ),
    );
  }
}

class UserDescription extends StatelessWidget {
  const UserDescription({required this.userDescription, Key? key})
      : super(key: key);
  final String userDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 171,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          width: 0.3,
          color: const Color(0xffDD4A30),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            userDescription,
            style: const TextStyle(
              color: Color(0xff333333),
              fontSize: 10,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.visible,
            ),
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}

class UserHometown extends StatelessWidget {
  const UserHometown({required this.userHometown, Key? key}) : super(key: key);
  final String userHometown;

  @override
  Widget build(BuildContext context) {
    return Text(
      userHometown,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Color(0xff333333),
      ),
    );
  }
}

class UserJob extends StatelessWidget {
  const UserJob({required this.userJob, Key? key}) : super(key: key);
  final String userJob;

  @override
  Widget build(BuildContext context) {
    return Text(
      userJob,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Color(0xff939598),
      ),
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({required this.userName, Key? key}) : super(key: key);
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Text(
      userName,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Color(0xff060606),
      ),
    );
  }
}

class UserPosition extends StatelessWidget {
  const UserPosition({required this.userPosition, Key? key}) : super(key: key);
  final String userPosition;

  @override
  Widget build(BuildContext context) {
    return Text(
      userPosition,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Color(0xff333333),
      ),
    );
  }
}
