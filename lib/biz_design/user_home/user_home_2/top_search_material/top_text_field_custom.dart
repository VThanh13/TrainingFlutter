import 'package:flutter/material.dart';

class TopTextField extends StatefulWidget {
  const TopTextField({this.width, required this.hintText, Key? key})
      : super(key: key);
  final String hintText;
  final double ?width;

  @override
  State<TopTextField> createState() => _TopTextFieldState();
}

class _TopTextFieldState extends State<TopTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.maxFinite,
      child: TextField(
        cursorColor: const Color(0xffDD4A30),
        maxLines: 5,
        minLines: 1,
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
              width: 1,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffDD4A30),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
