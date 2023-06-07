import 'package:flutter/cupertino.dart';

class UserCompany extends StatelessWidget {
  const UserCompany({required this.userCompany, Key? key}) : super(key: key);
  final String userCompany;

  @override
  Widget build(BuildContext context) {
    return Text(
      userCompany,
      style: const TextStyle(
        fontSize: 9,
        fontWeight: FontWeight.w400,
        color: Color(0xff939598),
        overflow: TextOverflow.visible,
      ),
    );
  }
}
