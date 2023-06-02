import 'package:code/biz_design/id_a/id_a_1/footer.dart';
import 'package:code/biz_design/id_a/id_a_1/header_02.dart';
import 'package:code/biz_design/id_c/id_c_1/search_result_material/document_confirm.dart';
import 'package:code/biz_design/id_c/id_c_1/search_result_material/user_age.dart';
import 'package:code/biz_design/id_c/id_c_1/search_result_material/user_avatar.dart';
import 'package:code/biz_design/id_c/id_c_1/search_result_material/user_company.dart';
import 'package:code/biz_design/id_c/id_c_1/search_result_material/user_description.dart';
import 'package:code/biz_design/id_c/id_c_1/search_result_material/user_hometown.dart';
import 'package:code/biz_design/id_c/id_c_1/search_result_material/user_job.dart';
import 'package:code/biz_design/id_c/id_c_1/search_result_material/user_name.dart';
import 'package:code/biz_design/id_c/id_c_1/search_result_material/user_position.dart';
import 'package:code/biz_design/id_c/id_c_2/search_research_no_hit.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  List<String> items = List.generate(1000, (index) => "Item $index");
  int _visibleItemCount = 20;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header02(),
            Container(
              height: 37,
              width: double.maxFinite,
              color: const Color(0xffEAE9E9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.search,
                    size: 17,
                    color: Color(0xff060606),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 10),
                    child: Text(
                      '詳細条件を指定して検索する',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff060606),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 32,
              width: double.maxFinite,
              child: TabBar(
                controller: _tabController,
                indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(color: Colors.white)),
                tabs: [
                  Tab(
                    child: SizedBox(
                      height: 32,
                      width: double.maxFinite,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 20,
                              color: _selectedIndex == 0
                                  ? Colors.orangeAccent
                                  : Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                '最近ログインしたユーザーを表示',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 11,
                                    color: _selectedIndex == 0
                                        ? const Color(0xff212862)
                                        : Colors.grey),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: SizedBox(
                      height: 32,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Icon(
                            Icons.abc_outlined,
                            size: 20,
                            color: _selectedIndex == 1
                                ? Colors.yellowAccent
                                : Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(
                              'ユーザーランキングを表示',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11,
                                  color: _selectedIndex == 1
                                      ? const Color(0xff212862)
                                      : Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
            const Divider(
              height: 0,
              color: Color(0xff1A3563),
              indent: 0,
              thickness: 1,
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [
                GridView.builder(
                    controller: _scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                          children: const [
                            SizedBox(
                              height: double.maxFinite,
                              width: double.maxFinite,
                            ),
                            Positioned(
                              left: 8,
                              top: 15,
                              child: DocumentConfirm(),
                            ),
                            Positioned(
                                left: 13,
                                top: 41,
                                child: UserAvatar(
                                  urlImage:
                                      'assets/images/biz_design/image_1.png',
                                )),
                            Positioned(
                              top: 41,
                              left: 76,
                              child: UserName(userName: 'いつき たくお'),
                            ),
                            Positioned(
                              top: 59,
                              left: 76,
                              child: UserPosition(
                                userPosition: '会社役員',
                              ),
                            ),
                            Positioned(
                              top: 73,
                              left: 76,
                              child: UserCompany(
                                userCompany: '五洋建設株式会社',
                              ),
                            ),
                            Positioned(
                              top: 85,
                              left: 76,
                              child: UserHometown(
                                userHometown: '東京都',
                              ),
                            ),
                            Positioned(
                              top: 43,
                              right: 10,
                              child: UserAge(
                                userAge: '56',
                              ),
                            ),
                            Positioned(
                              top: 59,
                              right: 10,
                              child: UserJob(
                                userJob: 'ゼネコン',
                              ),
                            ),
                            Positioned(
                              left: 10,
                              top: 110,
                              child: UserDescription(
                                userDescription:
                                    'はじめまして、よろしくお願いします。詳しくはプロフィールを...',
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                const SearchResultNoHit(),
              ],
            )),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
