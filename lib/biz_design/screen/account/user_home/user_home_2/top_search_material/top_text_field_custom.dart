import 'package:flutter/material.dart';

class TopTextField extends StatefulWidget {
  const TopTextField({this.width, required this.hintText, this.readOnly, Key? key})
      : super(key: key);
  final String hintText;
  final double ?width;
  final bool ?readOnly;

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
        readOnly: widget.readOnly ?? false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          errorText: widget.readOnly != null? '入力されていません。': null,
          errorStyle: const TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w600,
            color: Color(0xffFF0000),
          ),
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
