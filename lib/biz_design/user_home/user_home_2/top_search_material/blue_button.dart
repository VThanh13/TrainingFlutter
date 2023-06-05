import 'package:flutter/cupertino.dart';

class BlueButton extends StatelessWidget {
  const BlueButton(
      {required this.height,
      required this.width,
      required this.textValue,
      Key? key})
      : super(key: key);
  final double height;
  final double width;
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.only(left: 8),
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
