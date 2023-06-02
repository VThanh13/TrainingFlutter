import 'package:flutter/cupertino.dart';

class UserHometown extends StatelessWidget {
  const UserHometown({required this.userHometown, Key? key}) : super(key: key);
  final String userHometown;

  @override
  Widget build(BuildContext context) {
    return Text(
      userHometown,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Color(0xff333333),
      ),
    );
  }
}
