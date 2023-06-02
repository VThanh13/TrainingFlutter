import 'package:code/biz_design/id_a/id_a_1/footer.dart';
import 'package:code/biz_design/id_b/id_b_1/material_top/avatar_user.dart';
import 'package:code/biz_design/id_b/id_b_1/material_top/box_new.dart';
import 'package:code/biz_design/id_b/id_b_1/material_top/icon_and_text.dart';
import 'package:code/biz_design/id_b/id_b_1/material_top/text_info.dart';
import 'package:code/biz_design/id_b/id_b_1/material_top/top_divider.dart';
import 'package:code/biz_design/id_b/id_b_2/top_search.dart';
import 'package:code/biz_design/id_d/id_d_1/user_top.dart';
import 'package:flutter/material.dart';

import 'material_top/bottom_sheet_top_menu.dart';
import 'material_top/button3.dart';

class TopScreen extends StatefulWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  State<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 82,
                  width: double.maxFinite,
                  color: const Color(0xffF2F2F2),
                ),
                Positioned(
                    top: 37,
                    left: 150,
                    child: Container(
                      height: 34,
                      width: 81,
                      padding: const EdgeInsets.only(bottom: 13),
                      child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Image(
                          image: AssetImage('assets/images/biz_design/n-Biz.png'),
                        ),
                      ),
                    )
                ),
              ],
            ),
            SizedBox(
              width: double.maxFinite,
              height: 600,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 48,
                      width: double.maxFinite,
                      color: const Color(0xffEAE9E9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(onPressed: (){
                                modelBottomSheetTopMenu();
                              },
                                icon: const Icon(Icons.groups_outlined,
                                  color: Color(0xffDD4A30),),
                              ),
                              const Padding(padding: EdgeInsets.only(left: 7),
                                child: Text('会員メンバー  一覧', style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff060606)
                                ),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                              onTap: (){
                                navigateToTopSearch();
                              },
                              child: Row(
                                children: const [
                                  Image(
                                    image: AssetImage('assets/images/biz_design/image_41.png'),
                                  ),
                                  SizedBox(width: 14,)
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: Color(0xff060606),
                      indent: 0,
                      thickness: 1,
                    ),
                    Container(
                      height: 38,
                      width: double.maxFinite,
                      color: const Color(0xffFFF8F3),
                      child: const IconAndText(textValue: '今週のピックアップパーソン',
                        iconValue: Icons.account_circle_outlined,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      height: 102,
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(padding: EdgeInsets.fromLTRB(10, 5, 12, 0),
                            child: AvatarUser(urlImage: 'assets/images/biz_design/image_1.png',),),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(
                                height: 42,
                                width: 269,
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text('今週のピックアップパーソンは、大手ゼネコンで働く田中\nさんです。国際色豊かな経歴を持つ彼のプロフィールを是非\nチェックしてください。',
                                    maxLines: 3,
                                    style: TextStyle(
                                      fontSize: 10,fontWeight: FontWeight.w400, color: Color(0xff000000),
                                    ),),
                                ),
                              ),
                              const SizedBox(height: 14,),
                              SizedBox(
                                height: 25,
                                width: 125,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffFF3C3C),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => const UserTop()));
                                  },
                                  child: const Text('プロフィールをみる',style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700
                                  ),),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const TopDivider(),
                    Container(
                      height: 38,
                      width: double.maxFinite,
                      color: const Color(0xffFFF8F3),
                      child: const IconAndText(textValue: 'n-Biz Channel',
                        iconValue: Icons.video_call_outlined,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      height: 193,
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(padding: EdgeInsets.fromLTRB(10, 9, 0, 1),
                            child: Text('2020.00.00（月）',
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),),),
                          const TextInfo(textValue: 'タイトルが入ります、タイトルが入ります、タイトルが入ります'),
                          const SizedBox(height: 11,),
                          Center(
                            child: Container(
                              height: 131,
                              width: 279,
                              color: const Color(0xffF2F2F2),
                              child: const Image(
                                image: AssetImage('assets/images/biz_design/image_40.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const TopDivider(),
                    Container(
                      height: 38,
                      width: double.maxFinite,
                      color: const Color(0xffFFF8F3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          IconAndText(textValue: '新着ユーザー告知',
                              iconValue: Icons.volume_up_outlined, size: 20),
                          Button3(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 175,
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(padding: EdgeInsets.only(top: 10),
                            child: BoxNew(),),
                          Padding(padding: EdgeInsets.only(top: 3),
                            child: TextInfo(textValue: 'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...'),
                          ),
                          Padding(padding: EdgeInsets.only(top: 16),
                            child: BoxNew(),
                          ),
                          Padding(padding: EdgeInsets.only(top: 3),
                            child: TextInfo(textValue: 'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...'),
                          ),
                          Padding(padding: EdgeInsets.only(top: 16),
                            child: BoxNew(),
                          ),
                          Padding(padding: EdgeInsets.only(top: 3),
                            child: TextInfo(textValue: 'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...'),
                          ),
                        ],
                      ),
                    ),
                    const TopDivider(),
                    Container(
                      height: 46,
                      width: double.maxFinite,
                      color: const Color(0xffFFF8F3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          IconAndText(textValue: 'イベント・コミュニティ',
                              iconValue: Icons.calendar_today_outlined, size: 20),
                          Button3(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 186,
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                const BoxNew(),
                                const SizedBox(width: 6,),
                                Container(
                                  height: 18,
                                  width: 46,
                                  decoration: const BoxDecoration(
                                      color: Color(0xffCE2424)
                                  ),
                                  child: const Center(
                                    child: Text('ビジネス', style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffFFFFFF),
                                    ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 6),
                            child: TextInfo(textValue: 'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...',),),
                          Padding(padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                const BoxNew(),
                                const SizedBox(width: 6,),
                                Container(
                                  height: 18,
                                  width: 58,
                                  decoration: const BoxDecoration(
                                      color: Color(0xff5A8E5C)
                                  ),
                                  child: const Center(
                                    child: Text('趣味/音楽', style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffFFFFFF),
                                    ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 6),
                            child: TextInfo(textValue: 'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...',),),
                          Padding(padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                const BoxNew(),
                                const SizedBox(width: 6,),
                                Container(
                                  height: 18,
                                  width: 70,
                                  decoration: const BoxDecoration(
                                      color: Color(0xff454890)
                                  ),
                                  child: const Center(
                                    child: Text('趣味/スポーツ', style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffFFFFFF),
                                    ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 6),
                            child: TextInfo(textValue: 'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...',),),
                        ],
                      ),
                    ),
                    const TopDivider(),
                    Container(
                      height: 46,
                      width: double.maxFinite,
                      color: const Color(0xffFFF8F3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          IconAndText(textValue: '運営からのお知らせ',
                              iconValue: Icons.newspaper_rounded, size: 20),
                          Button3(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 120,
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(padding: EdgeInsets.fromLTRB(10, 12, 0, 1),
                            child: Text('2020.00.00（月）',
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),),),
                          Container(
                            height: 12,
                            width: 46,
                            margin: const EdgeInsets.only(left: 11),
                            color: const Color(0xff625148),
                            child: const Center(
                              child: Text('重要', style: TextStyle(
                                  fontSize: 7,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffFFFFFF)
                              ),),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.fromLTRB(1, 3, 0, 0),
                            child: TextInfo(textValue: 'タイトルが入ります、タイトルが入ります、タイトルが入ります、タイトル...',),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
  modelBottomSheetTopMenu(){
    return showModalBottomSheet(
      isScrollControlled: true,
        context: context, builder: (BuildContext context){
      return const BottomSheetTopMenu();
    });
  }
  void navigateToTopSearch(){
    final route = MaterialPageRoute(builder: (context) => const TopSearch());
    Navigator.push(context, route);
  }
}
