import 'package:flutter/material.dart';

class Button3 extends StatelessWidget {
  const Button3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 25,
          width: 114,
          child: ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffFF3C3C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
              child: const Text('一覧をみる',style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 10,
              ),
              ),
          ),
        ),
        const SizedBox(width: 10,)
      ],
    );
  }
}
