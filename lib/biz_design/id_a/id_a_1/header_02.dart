import 'package:flutter/material.dart';

class Header02 extends StatefulWidget {
  const Header02({Key? key}) : super(key: key);

  @override
  State<Header02> createState() => _Header02State();
}

class _Header02State extends State<Header02> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 82,
          width: double.maxFinite,
          color: const Color(0xffF2F2F2),
        ),
        Positioned(
          left: 13,
          top: 41,
          child: SizedBox(
            height: 22,
            width: 12,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: (){},
              color: const Color(0xff212862),
            ),
          ),),
        const Positioned(
          left: 150,
          top: 37,
          child: SizedBox(
            height: 34,
            width: 81,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Image(
                image: AssetImage('assets/images/biz_design/n-Biz.png'),
              ),
            ),
          ),),
        Positioned(
          right: 9,
          top: 37,
          child: SizedBox(
            height: 26,
            width: 26,
            child: IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: (){},
              color: const Color(0xff212862),
            ),
          ),),

      ],
    );
  }
}
