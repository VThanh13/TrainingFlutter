import 'package:flutter/cupertino.dart';

class NameCardMenuScreen extends StatelessWidget {
  const NameCardMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 86,
          ),
          const Text(
            '本機能は有料会員限定の機能です。',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xffE56565),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 37,
            width: 242,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffDD4A30), width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Text(
                '詳しくはお問い合わせください',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
