import 'package:flutter/material.dart';

class TopTextField extends StatefulWidget {
  const TopTextField(
      {this.width, required this.hintText, this.readOnly, Key? key})
      : super(key: key);
  final String hintText;
  final double? width;
  final bool? readOnly;

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
        style: TextStyle(color: Theme.of(context).textTheme.titleSmall!.color),
        decoration: InputDecoration(
          hintText: widget.hintText,
          errorText: widget.readOnly != null ? '入力されていません。' : null,
          errorStyle: const TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w600,
            color: Color(0xffFF0000),
          ),
          hintStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.titleSmall!.color,
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
