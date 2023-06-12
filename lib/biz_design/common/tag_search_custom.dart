import 'package:flutter/cupertino.dart';

class TagSearchCustom extends StatelessWidget {
  const TagSearchCustom({
      required this.textValue,
      Key? key})
      : super(key: key);
  final String textValue;

  @override
  Widget build(BuildContext context) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: textValue,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xffFFFFFF),
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    return Container(
      height: 17,
      width: textPainter.width + 15,
      margin: const EdgeInsets.only( bottom: 10, top: 10),
      //padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      color: const Color(0xff212862),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
          child: Text(
            textValue,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xffFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
