import 'package:code/biz_design/id_b/id_b_2/top_search_material/blue_button.dart';
import 'package:code/biz_design/id_b/id_b_2/top_search_material/row_add.dart';
import 'package:code/biz_design/id_b/id_b_2/top_search_material/textfield_no_icon.dart';
import 'package:code/biz_design/id_b/id_b_2/top_search_material/textfield_search.dart';
import 'package:code/biz_design/id_c/id_c_1/search_result.dart';
import 'package:flutter/material.dart';

class TopSearch extends StatefulWidget {
  const TopSearch({Key? key}) : super(key: key);

  @override
  State<TopSearch> createState() => _TopSearchState();
}

class _TopSearchState extends State<TopSearch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                  width: double.maxFinite,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                        child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: const Image(
                            image: AssetImage('assets/images/biz_design/Vector_1.png'),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(108, 8, 0, 0),
                        child: Text('絞り込み検索', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xff000000)
                        ),),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(68, 12, 0, 0),
                        child: Text('全てクリア', style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff001AFF)
                        ),),
                      )
                     ]
                  ),
                ),
                const BlueButton(height: 17, width: 40, textValue: '職業',),
                const TextFieldSearch(labelText: 'CEO',),
                const SizedBox(height: 10,),
                const TextFieldSearch(labelText: '自営業',),
                const SizedBox(height: 10,),
                const RowAdd(dataText: 'マッチングしたい職業を追加'),
                const SizedBox(height: 40,),
                const BlueButton(height: 17, width: 76, textValue: '業種・職種'),
                const SizedBox(height: 10,),
                const TextFieldSearch(labelText: '建設業 > 営業'),
                const SizedBox(height: 10,),
                const TextFieldSearch(labelText: 'IT > コンサル'),
                const SizedBox(height: 10,),
                const RowAdd(dataText: 'マッチングしたい業種・職種を追加'),
                const SizedBox(height: 40,),
                const BlueButton(height: 17, width: 51, textValue: 'エリア'),
                const SizedBox(height: 10,),
                const TextFieldSearch(labelText: '東京都 杉並区'),
                const SizedBox(height: 10,),
                const TextFieldSearch(labelText: '東京都'),
                const SizedBox(height: 10,),
                const RowAdd(dataText: 'マッチングしたいエリアを追加'),
                const SizedBox(height: 40,),
                const BlueButton(height: 17, width: 65, textValue: '保有資格'),
                const SizedBox(height: 10,),
                const TextFieldSearch(labelText: 'IT > 情報管理者検定'),
                const SizedBox(height: 10,),
                const TextFieldSearch(labelText: 'IT > 情報管理者検定'),
                const SizedBox(height: 10,),
                const RowAdd(dataText: 'マッチングしたい資格を追加'),
                const SizedBox(height: 40,),
                const BlueButton(height: 17, width: 41, textValue: '年収'),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    //SizedBox(width: 8,),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: TextFieldNoIcon(width: 137, hintText: '201 万円'),
                    ),
                    Text('~', style: TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xff060606)
                    ),),
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: TextFieldNoIcon(width: 137, hintText: '500 万円'),
                    ),
                  ],
                ),
                const SizedBox(height: 40,),
                const BlueButton(height: 17, width: 41, textValue: '年齢'),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.only(right: 8, left: 8),
                  child: TextFieldNoIcon(width: double.maxFinite, hintText: '35'),
                ),
                const SizedBox(height: 40,),
                const BlueButton(height: 17, width: 173, textValue: '相手が探している業種・職種'),
                const SizedBox(height: 10,),
                const TextFieldSearch(labelText: '建設業 > 営業'),
                const SizedBox(height: 10,),
                const TextFieldSearch(labelText: 'IT > コンサル'),
                const SizedBox(height: 10,),
                const RowAdd(dataText: '相手の探している業種・職種を追加'),
                const SizedBox(height: 40,),
                const BlueButton(height: 17, width: 147, textValue: '相手が探しているエリア'),
                const SizedBox(height: 10,),
                const TextFieldSearch(labelText: '東京都 杉並区'),
                const SizedBox(height: 10,),
                const TextFieldSearch(labelText: '東京都'),
                const SizedBox(height: 10,),
                const RowAdd(dataText: '相手の探しているエリアを追加'),
                const SizedBox(height: 40,),
                const BlueButton(height: 17, width: 89, textValue: 'フリーワード'),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.only(right: 8, left: 8),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: TextField(
                      cursorColor: Color(0xffDD4A30),
                      decoration: InputDecoration(
                        hintText: '特定の固有名詞など一般的なワードで検索してください',
                        hintStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff9A9A9A),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffDD4A30),
                                width: 1
                            )
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xffDD4A30),
                              width: 2
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 49,),
                Center(
                  child: SizedBox(
                    height: 38,
                    width: 277,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFF3C3C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const SearchResult()));
                      },
                      child: const Text('検索する', style: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 14
                      ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
              ],
            ),
          ),
        ),
    ),
    );
  }
}
