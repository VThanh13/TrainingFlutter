import 'package:flutter/material.dart';

class UserAge extends StatelessWidget {
  const UserAge({required this.userAge, Key? key}) : super(key: key);
  final String userAge;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$userAge歳',
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
    );
  }
}
