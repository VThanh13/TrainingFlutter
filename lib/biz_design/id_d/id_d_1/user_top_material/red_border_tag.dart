import 'package:flutter/cupertino.dart';

class RedBorderTag extends StatelessWidget {
  const RedBorderTag({required this.textValue,required this.width,Key? key}) : super(key: key);
  final String textValue;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 19,
      width: width,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 0.3,
              color: const Color(0xffDD4A30))
      ),
      child: Center(
        child: Text(textValue, style: const TextStyle(
          color: Color(0xff060606),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        ),
      ),
    );
  }
}
