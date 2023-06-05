import 'package:flutter/material.dart';

class Header01 extends StatefulWidget {
  const Header01({Key? key}) : super(key: key);

  @override
  State<Header01> createState() => _Header01State();
}

class _Header01State extends State<Header01> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 82,
          width: double.maxFinite,
          color: const Color(0xffF2F2F2),
        ),
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
          ),
        ),
        Positioned(
          right: 9,
          top: 37,
          child: SizedBox(
            height: 26,
            width: 26,
            child: IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () {},
              color: const Color(0xff212862),
            ),
          ),
        ),
      ],
    );
  }
}
