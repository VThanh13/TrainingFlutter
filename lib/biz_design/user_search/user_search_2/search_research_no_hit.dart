import 'package:flutter/material.dart';

import '../user_search_1/search_result_material/user_age.dart';
import '../user_search_1/search_result_material/user_avatar.dart';
import '../user_search_1/search_result_material/user_company.dart';
import '../user_search_1/search_result_material/user_description.dart';
import '../user_search_1/search_result_material/user_hometown.dart';
import '../user_search_1/search_result_material/user_job.dart';
import '../user_search_1/search_result_material/user_name.dart';
import '../user_search_1/search_result_material/user_position.dart';

class SearchResultNoHit extends StatefulWidget {
  const SearchResultNoHit({Key? key}) : super(key: key);

  @override
  State<SearchResultNoHit> createState() => _SearchResultNoHitState();
}

class _SearchResultNoHitState extends State<SearchResultNoHit> {
  int _visibleItemCount = 20;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent) {
      setState(() {
        _visibleItemCount += 20;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        mainAxisExtent: 150,
      ),
      itemCount: _visibleItemCount,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: double.maxFinite,
          child: Stack(
            children: [
              const SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
              ),
              Positioned(
                left: 8,
                top: 15,
                child: Container(
                  height: 18,
                  width: 62,
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
                          '${index + 1}位',
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
              ),
              const Positioned(
                left: 13,
                top: 41,
                child: UserAvatar(
                  urlImage: 'assets/images/biz_design/image_1.png',
                ),
              ),
              const Positioned(
                top: 41,
                left: 76,
                child: UserName(userName: 'いつき たくお'),
              ),
              const Positioned(
                top: 59,
                left: 76,
                child: UserPosition(
                  userPosition: '会社役員',
                ),
              ),
              const Positioned(
                top: 73,
                left: 76,
                child: UserCompany(
                  userCompany: '五洋建設株式会社',
                ),
              ),
              const Positioned(
                top: 85,
                left: 76,
                child: UserHometown(
                  userHometown: '東京都',
                ),
              ),
              const Positioned(
                top: 43,
                right: 10,
                child: UserAge(
                  userAge: '56',
                ),
              ),
              const Positioned(
                top: 59,
                right: 10,
                child: UserJob(
                  userJob: 'ゼネコン',
                ),
              ),
              const Positioned(
                left: 10,
                top: 110,
                child: UserDescription(
                  userDescription: 'はじめまして、よろしくお願いします。詳しくはプロフィールを...',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
