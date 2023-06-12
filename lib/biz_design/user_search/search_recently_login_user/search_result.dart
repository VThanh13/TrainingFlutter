import 'package:auto_route/annotations.dart';
import 'package:code/biz_design/user_search/search_recently_login_user/search_recently_login_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../common/tab_bar_custom.dart';
import '../search_user_ranking/search_user_ranking_screen.dart';

@RoutePage()
class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  late int _totalUserLogin;
  late int _totalUserRanking;
  final int _itemPerPage = 20;

  final List<Widget> _listUserLogin =
      List.generate(20, (index) => const SearchLoginUser());
  final List<Widget> _listUserRanking = List.generate(20, (index) {
    return SearchUserRankingScreen(
      index: index,
    );
  });
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  double? _scrollPosition;
  double? _scrollPosition2;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _scrollController.addListener(_scrollListener);
    _scrollController2.addListener(_scrollListener2);
    _totalUserLogin = 110;
    _totalUserRanking = 110;
    _loadUserLogin();
    _loadUserRanking();
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollPosition ?? 0.0);
    });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController2.jumpTo(_scrollPosition2 ?? 0.0);
    });
  }

  void _loadUserLogin() {
    int itemsToLoad = _totalUserLogin - _listUserLogin.length;
    if (itemsToLoad > _itemPerPage) {
      itemsToLoad = _itemPerPage;
    }
    for (int i = 0; i < itemsToLoad; i++) {
      _listUserLogin.add(const SearchLoginUser());
    }
  }

  void _loadUserRanking() {
    int itemsToLoad = _totalUserRanking - _listUserRanking.length;
    int k = _listUserRanking.length;
    if (itemsToLoad > _itemPerPage) {
      itemsToLoad = _itemPerPage;
    }
    for (int i = 0; i < itemsToLoad; i++) {
      _listUserRanking.add(SearchUserRankingScreen(
        index: k,
      ));
      k++;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    _scrollController2.dispose();
    _scrollPosition = _scrollController.position.pixels;
    _scrollPosition2 = _scrollController2.position.pixels;
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent) {
      setState(() {});
    }
  }
  void _scrollListener2() {
    if (_scrollController2.offset >=
        _scrollController2.position.maxScrollExtent) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TabBarCustom(
              isBackButton: true,
              isSettingButton: true,
            ),
            Container(
              height: 37,
              width: double.maxFinite,
              color: const Color(0xffEAE9E9),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
              width: double.maxFinite,
              child: TabBar(
                controller: _tabController,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.white),
                ),
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
                                      : Colors.grey,
                                ),
                              ),
                            ),
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
                          ),
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
                      itemCount: _listUserLogin.length < _totalUserLogin
                          ? _listUserLogin.length + 1
                          : _listUserLogin.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == _listUserLogin.length &&
                            _listUserLogin.length < _totalUserLogin) {
                          // Load more items
                          _loadUserLogin();
                        }
                        return _listUserLogin[index];
                      }),
                  GridView.builder(
                      controller: _scrollController2,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        mainAxisExtent: 150,
                      ),
                      itemCount: _listUserRanking.length < _totalUserRanking
                          ? _listUserRanking.length + 1
                          : _listUserRanking.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == _listUserRanking.length &&
                            _listUserRanking.length < _totalUserRanking) {
                          _loadUserRanking();
                        }
                        return _listUserRanking[index];
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
