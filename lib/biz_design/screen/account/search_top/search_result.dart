import 'package:auto_route/annotations.dart';
import 'package:code/biz_design/screen/account/search_top/widgets/result_items.dart';
import 'package:flutter/material.dart';

import '../../../core/common/tab_bar_custom.dart';




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

  final List<Widget> _listUserLogin = List.generate(
    20,
    (index) => const SearchResultItems(
      isRankingUser: false,
    ),
  );
  final List<Widget> _listUserRanking = List.generate(20, (index) {
    return SearchResultItems(
      index: index,
    );
  });
  late final ScrollController _scrollController;
  late final ScrollController _scrollController2;
  double? _scrollPosition;
  double? _scrollPosition2;
  late final PageStorageKey _storageKey;
  late final PageStorageKey _storageKey2;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
    _scrollController2 = ScrollController();
    _storageKey = const PageStorageKey('user_login_scroll_position');
    _storageKey2 = const PageStorageKey('user_ranking_scroll_position');
    _scrollController.addListener(_scrollListener);
    _scrollController2.addListener(_scrollListener2);
    _totalUserLogin = 110;
    _totalUserRanking = 110;
    _loadUserLogin();
    _loadUserRanking();
    super.initState();
  }

  void _loadUserLogin() {
    int itemsToLoad = _totalUserLogin - _listUserLogin.length;
    if (itemsToLoad > _itemPerPage) {
      itemsToLoad = _itemPerPage;
    }
    for (int i = 0; i < itemsToLoad; i++) {
      _listUserLogin.add(
        const SearchResultItems(isRankingUser: false),
      );
    }
  }

  void _loadUserRanking() {
    int itemsToLoad = _totalUserRanking - _listUserRanking.length;
    int k = _listUserRanking.length;
    if (itemsToLoad > _itemPerPage) {
      itemsToLoad = _itemPerPage;
    }
    for (int i = 0; i < itemsToLoad; i++) {
      _listUserRanking.add(SearchResultItems(
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
                                    : Colors.grey,
                              ),
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
                  FutureBuilder(
                      future: Future.delayed(Duration.zero),
                      builder:
                          (BuildContext context, AsyncSnapshot<void> snapshot) {
                        if (_scrollPosition != null) {
                          if (!_scrollController.hasClients) {
                            _scrollController.animateTo(
                              _scrollPosition!,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          }
                        }
                        return GridView.builder(
                            controller: _scrollController,
                            key: _storageKey,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              mainAxisExtent: 165,
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
                            });
                      }),
                  FutureBuilder(
                      future: Future.delayed(Duration.zero),
                      builder:
                          (BuildContext context, AsyncSnapshot<void> snapshot) {
                        if (_scrollPosition2 != null) {
                          if (!_scrollController2.hasClients) {
                            _scrollController2.animateTo(
                              _scrollPosition2!,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          }
                        }
                        return GridView.builder(
                            controller: _scrollController2,
                            key: _storageKey2,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              mainAxisExtent: 160,
                            ),
                            itemCount:
                                _listUserRanking.length < _totalUserRanking
                                    ? _listUserRanking.length + 1
                                    : _listUserRanking.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (index == _listUserRanking.length &&
                                  _listUserRanking.length < _totalUserRanking) {
                                _loadUserRanking();
                              }
                              return _listUserRanking[index];
                            });
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
