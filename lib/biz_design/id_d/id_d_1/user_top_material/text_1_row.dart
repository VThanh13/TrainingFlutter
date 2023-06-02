import 'package:flutter/cupertino.dart';

class Text1Row extends StatelessWidget {
  const Text1Row({required this.text, Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Color(0xff060606),
        overflow: TextOverflow.visible,
      ),
    );
  }
}
