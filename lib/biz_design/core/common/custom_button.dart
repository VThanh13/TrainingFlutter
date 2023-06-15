import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {this.height = 38,
      this.width = 272,
      required this.text,
        this.size = 10,
      required this.tab,
      Key? key})
      : super(key: key);
  final double ?height;
  final double ?width;
  final double ?size;
  final String text;
  final dynamic tab;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ElevatedButton(
        onPressed: widget.tab,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffFF3C3C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          elevation: 0,
        ),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            fontSize: widget.size,
            color: const Color(0xffFFFFFF),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
