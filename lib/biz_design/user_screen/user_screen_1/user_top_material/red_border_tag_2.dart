import 'package:flutter/material.dart';

class RedBorderTag2 extends StatelessWidget {
  const RedBorderTag2({required this.textValue, required this.width, Key? key})
      : super(key: key);
  final String textValue;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 19,
      width: width,
      margin: const EdgeInsets.only(right: 10),
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
