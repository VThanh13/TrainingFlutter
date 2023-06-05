import 'package:flutter/cupertino.dart';

class TextInfo extends StatelessWidget {
  const TextInfo({required this.textValue, Key? key}) : super(key: key);
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        textValue,
        maxLines: 1,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
          fontSize: 10,
        ),
      ),
    );
  }
}
