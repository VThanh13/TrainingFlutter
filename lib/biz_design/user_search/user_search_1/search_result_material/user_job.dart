import 'package:flutter/cupertino.dart';

class UserJob extends StatelessWidget {
  const UserJob({required this.userJob, Key? key}) : super(key: key);
  final String userJob;

  @override
  Widget build(BuildContext context) {
    return Text(
      userJob,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Color(0xff939598),
      ),
    );
  }
}
