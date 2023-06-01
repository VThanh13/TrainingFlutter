import 'package:flutter/cupertino.dart';

class IconAndText extends StatelessWidget {
  const IconAndText({required this.textValue, required this.iconValue, required this.size, Key? key}) : super(key: key);
  final String textValue;
  final IconData iconValue;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10,),
        Icon(iconValue,
        color: const Color(0xffDD4A30),
          size: size,
        ),
        const SizedBox(width: 5,),
        Text(textValue, style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color(0xff212862)
        ),)
      ],
    );
  }
}
