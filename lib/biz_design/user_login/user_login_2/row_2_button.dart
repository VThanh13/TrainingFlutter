import 'package:flutter/material.dart';

class Row2Button extends StatelessWidget {
  const Row2Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 641, left: 44, right: 37),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 25,
            width: 92,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFF3C3C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              child: const Text(
                '名刺交換する',
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 10,
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(
            height: 32,
            width: 169,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFF3C3C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              child: const Text(
                'お問い合わせページへ',
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
