import 'package:flutter/cupertino.dart';

class UserPosition extends StatelessWidget {
  const UserPosition({required this.userPosition, Key? key}) : super(key: key);
  final String userPosition;

  @override
  Widget build(BuildContext context) {
    return Text(
      userPosition,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Color(0xff333333),
      ),
    );
  }
}
