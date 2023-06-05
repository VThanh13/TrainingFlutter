import 'package:flutter/material.dart';

class TopSearchHeader extends StatefulWidget {
  const TopSearchHeader({Key? key}) : super(key: key);

  @override
  State<TopSearchHeader> createState() => _TopSearchHeaderState();
}

class _TopSearchHeaderState extends State<TopSearchHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.maxFinite,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Image(
                  image: AssetImage(
                      'assets/images/biz_design/Vector_1.png'),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(108, 8, 0, 0),
              child: Text(
                '絞り込み検索',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color(0xff000000),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(68, 12, 0, 0),
              child: Text(
                '全てクリア',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff001AFF),
                ),
              ),
            ),
          ]),
    );
  }
}
