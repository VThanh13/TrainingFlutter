import 'package:flutter/cupertino.dart';

class BlueBorderTag extends StatelessWidget {
  const BlueBorderTag(
      {required this.textValue, this.height, this.size, Key? key})
      : super(key: key);
  final String textValue;
  final double? height;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: textValue,
        style: const TextStyle(
          color: Color(0xff212862),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    return Container(
      height: height ?? 31,
      width: size == null ? textPainter.width + 28 : textPainter.width + 5 ,
      margin: const EdgeInsets.only(right: 10),
      padding: size == null
          ? const EdgeInsets.fromLTRB(13, 0, 13, 0)
          : const EdgeInsets.all(0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xff212862),
        ),
      ),
      child: Center(
        child: Text(
          textValue,
          style: TextStyle(
            color: const Color(0xff212862),
            fontSize: size ?? 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
