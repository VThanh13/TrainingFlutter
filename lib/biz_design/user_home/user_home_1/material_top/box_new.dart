import 'package:flutter/cupertino.dart';

class BoxNew extends StatelessWidget {
  const BoxNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 46,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: const Color(0xffDD4A30),
        ),
      ),
      child: const Center(
        child: Text(
          'New',
          style: TextStyle(
            color: Color(0xffDD4A30),
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
