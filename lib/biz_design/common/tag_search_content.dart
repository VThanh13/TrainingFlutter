import 'package:flutter/cupertino.dart';

class TagSearchContent extends StatelessWidget {
  const TagSearchContent(
      {required this.width,
      required this.textValue,
      Key? key})
      : super(key: key);
  final double width;
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17,
      width: width,
      margin: const EdgeInsets.only( bottom: 10, top: 10),
      color: const Color(0xff212862),
      child: Center(
        child: Text(
          textValue,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
    );
  }
}