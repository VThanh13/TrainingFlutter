import 'package:flutter/cupertino.dart';

class UserName extends StatelessWidget {
  const UserName({required this.userName, Key? key}) : super(key: key);
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Text(
      userName,
      style: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xff060606)),
    );
  }
}
