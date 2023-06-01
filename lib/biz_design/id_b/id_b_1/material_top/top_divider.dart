import 'package:flutter/material.dart';

class TopDivider extends StatelessWidget {
  const TopDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 0,
      color: Color(0xffDD4A30),
      indent: 0,
      thickness: 1,
    );
  }
}
