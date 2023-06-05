import 'package:flutter/cupertino.dart';

class TextInfoD1 extends StatelessWidget {
  const TextInfoD1({required this.textValue, Key? key}) : super(key: key);
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color(0xff060606),
        overflow: TextOverflow.visible,
      ),
      maxLines: 5,
    );
  }
}
