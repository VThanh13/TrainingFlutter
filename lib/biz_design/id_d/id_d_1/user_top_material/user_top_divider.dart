import 'package:flutter/material.dart';

class UserTopDivider extends StatelessWidget {
  const UserTopDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Divider(
        height: 0,
        color: Color(0xffDD4A30),
        indent: 0,
        thickness: 1,
      ),
    );
  }
}
