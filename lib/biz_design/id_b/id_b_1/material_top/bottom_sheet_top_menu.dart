import 'package:code/biz_design/id_b/id_b_1/material_top/row_icon_text.dart';
import 'package:flutter/material.dart';

class BottomSheetTopMenu extends StatelessWidget {
  const BottomSheetTopMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height-150.0,
      child: Column(
        children: [
          const SizedBox(height: 10,),
          Row(
            children: [
              Container(
                height: 1,
                width: 293,
                margin: const EdgeInsets.only(left: 20, right: 26),
                color: const Color(0xffDD4A30),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Image(
                    image: AssetImage('assets/images/biz_design/Vector_1.png'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          const RowIconText(textValue: 'myQRコード・URL表示', iconValue: Icons.qr_code_scanner_rounded),
          const SizedBox(height: 15,),
          const RowIconText(textValue: 'マイページ', iconValue: Icons.account_circle_outlined),
          const SizedBox(height: 15,),
          const RowIconText(textValue: 'ユーザー告知', iconValue: Icons.volume_up_outlined),
          const SizedBox(height: 15,),
          const RowIconText(textValue: 'イベント・コミィニティ', iconValue: Icons.calendar_today_outlined),
          const SizedBox(height: 15,),
          const RowIconText(textValue: '会員一覧', iconValue: Icons.groups_outlined),
          const SizedBox(height: 15,),
          const RowIconText(textValue: 'メッセージ', iconValue: Icons.message_outlined),
          const SizedBox(height: 15,),
          const RowIconText(textValue: '運営からのお知らせ', iconValue: Icons.newspaper_rounded),
          const SizedBox(height: 15,),
          const RowIconText(textValue: '運営会社情報', iconValue: Icons.location_city),
          const SizedBox(height: 15,),
          const RowIconText(textValue: 'サービス利用規約', iconValue: Icons.library_books_outlined),
          const SizedBox(height: 15,),
          const RowIconText(textValue: 'アプリ利用規約', iconValue: Icons.lightbulb_outline),
          const SizedBox(height: 15,),
          const RowIconText(textValue: 'アプリ対応OS、バージョンについて', iconValue: Icons.phone_iphone),
          const SizedBox(height: 15,),
          const RowIconText(textValue: 'ログアウト', iconValue: Icons.logout),
          const SizedBox(height: 15,),
        ],
      ),
    );
  }
}
