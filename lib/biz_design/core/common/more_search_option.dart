import 'package:flutter/material.dart';

class MoreSearchOption extends StatelessWidget {
  const MoreSearchOption({required this.dataText, Key? key}) : super(key: key);
  final String dataText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add_circle_sharp,
            size: 30,
            color: Color(0xff212862),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          dataText,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
