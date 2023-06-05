import 'package:flutter/cupertino.dart';

class BlueTag extends StatelessWidget {
  const BlueTag({required this.value,required this.width, Key? key}) : super(key: key);
  final String value;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17,
      width: width,
      color: const Color(0xff212862),
      child: Center(
        child: Text(
          value,
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
