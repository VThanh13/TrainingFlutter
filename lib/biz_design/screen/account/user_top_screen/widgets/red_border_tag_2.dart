import 'package:flutter/material.dart';

class RedBorderTag2 extends StatelessWidget {
  const RedBorderTag2({required this.textValue, Key? key})
      : super(key: key);
  final String textValue;

  @override
  Widget build(BuildContext context) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: textValue,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      textDirection: TextDirection.ltr
    )..layout();
    return Container(
      height: 19,
      width: textPainter.width +15,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.3,
          color: const Color(0xffDD4A30),
        ),
      ),
      child: Center(
        child: Text(
          textValue,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
