import 'package:flutter/material.dart';

class SendCardButton extends StatefulWidget {
  const SendCardButton({Key? key}) : super(key: key);

  @override
  State<SendCardButton> createState() => _SendCardButtonState();
}

class _SendCardButtonState extends State<SendCardButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28),
      child: SizedBox(
        height: 38,
        width: 272,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFF3C3C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
          child: const Text(
            '名刺交換リクエストを送信',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
