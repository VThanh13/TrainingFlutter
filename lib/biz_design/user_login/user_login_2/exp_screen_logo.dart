import 'package:flutter/cupertino.dart';

class ExpScreenLogo extends StatelessWidget {
  const ExpScreenLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 126),
          child: Center(
            child: SizedBox(
              height: 10,
              width: 252,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'ビジネスが加速するマッチングサービス',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Center(
            child: Container(
              height: 80,
              width: 189,
              padding: const EdgeInsets.only(bottom: 18),
              child: const FittedBox(
                fit: BoxFit.fitWidth,
                child: Image(
                  image: AssetImage(
                      'assets/images/biz_design/n-Biz.png'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
