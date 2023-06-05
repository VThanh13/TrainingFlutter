import 'package:flutter/material.dart';

class TextFieldSearch extends StatefulWidget {
  const TextFieldSearch({required this.labelText, Key? key}) : super(key: key);
  final String labelText;

  @override
  State<TextFieldSearch> createState() => _TextFieldSearchState();
}

class _TextFieldSearchState extends State<TextFieldSearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: TextField(
        cursorColor: const Color(0xffDD4A30),
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffDD4A30),
              width: 1,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffDD4A30),
              width: 2,
            ),
          ),
          hintText: widget.labelText,
          hintStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xff060606),
          ),
          suffixIcon: const Icon(
            Icons.cancel_outlined,
            size: 30,
            color: Color(0xff212862),
          ),
        ),
      ),
    );
  }
}
