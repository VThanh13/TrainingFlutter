import 'package:flutter/cupertino.dart';

class DocumentConfirm extends StatelessWidget {
  const DocumentConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17,
      width: 72,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: const Color(0xff212862))),
      child: const Center(
        child: Text(
          '本人書類確認済み',
          style: TextStyle(
            color: Color(0xff212862),
            fontSize: 8,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
