import 'package:flutter/cupertino.dart';

class MessageStartScreen extends StatelessWidget {
  const MessageStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 86,
          ),
          const Text(
            '名刺交換リクエストが承諾されました。'
            '\nメッセージを送信することができます。',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xff000000),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 37,
            width: 242,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffDD4A30),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Text(
                'メッセージを開始する',
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
