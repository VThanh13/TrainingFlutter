import 'package:flutter/material.dart';

class Header02 extends StatefulWidget {
  const Header02({Key? key}) : super(key: key);

  @override
  State<Header02> createState() => _Header02State();
}

class _Header02State extends State<Header02> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: Color(0xff212862),
            ),
          ),
          const SizedBox(
            height: 34,
            width: 81,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Image(
                image: AssetImage('assets/images/biz_design/n-Biz.png'),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
              size: 25,
              color: Color(0xff212862),
            ),
          ),
        ],
      ),
    );
  }
}
