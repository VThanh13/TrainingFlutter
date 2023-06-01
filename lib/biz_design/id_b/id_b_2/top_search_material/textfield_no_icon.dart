import 'package:flutter/material.dart';

class TextFieldNoIcon extends StatefulWidget {
  const TextFieldNoIcon({required this.width, required this.hintText, Key? key}) : super(key: key);
  final String hintText;
  final double width;

  @override
  State<TextFieldNoIcon> createState() => _TextFieldNoIconState();
}

class _TextFieldNoIconState extends State<TextFieldNoIcon> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextField(
        cursorColor: const Color(0xffDD4A30),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xff060606),
          ),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0xffDD4A30),
                  width: 1
              )
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xffDD4A30),
                width: 2
            ),
          ),
        ),
      ),
    );
  }
}
