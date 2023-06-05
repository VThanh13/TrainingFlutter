import 'package:flutter/material.dart';

import '../user_home_2/top_search.dart';
import 'material_top/bottom_sheet_top_menu.dart';

class MemberListSearch extends StatefulWidget {
  const MemberListSearch({Key? key}) : super(key: key);

  @override
  State<MemberListSearch> createState() => _MemberListSearchState();
}

class _MemberListSearchState extends State<MemberListSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.maxFinite,
      color: const Color(0xffEAE9E9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  modelBottomSheetTopMenu();
                },
                icon: const Icon(
                  Icons.groups_outlined,
                  color: Color(0xffDD4A30),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 7),
                child: Text(
                  '会員メンバー  一覧',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff060606),
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              navigateToTopSearch();
            },
            child: Row(
              children: const [
                Image(
                  image: AssetImage(
                      'assets/images/biz_design/image_41.png'),
                ),
                SizedBox(
                  width: 14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  modelBottomSheetTopMenu() {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return const BottomSheetTopMenu();
        });
  }

  void navigateToTopSearch() {
    final route = MaterialPageRoute(builder: (context) => const TopSearch());
    Navigator.push(context, route);
  }
}
