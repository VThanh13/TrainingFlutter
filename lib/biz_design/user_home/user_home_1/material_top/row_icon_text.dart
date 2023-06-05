import 'package:flutter/material.dart';

class RowIconText extends StatelessWidget {
  const RowIconText(
      {required this.textValue, required this.iconValue, Key? key})
      : super(key: key);
  final String textValue;
  final IconData iconValue;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          const SizedBox(
            width: 50,
          ),
          Icon(
            iconValue,
            size: 25,
            color: const Color(0xffDD4A30),
          ),
          const SizedBox(
            width: 17,
          ),
          Text(
            textValue,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff060606),
            ),
          ),
        ],
      ),
    );
  }
}
