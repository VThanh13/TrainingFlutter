import 'package:flutter/cupertino.dart';

class ItemMenu extends StatelessWidget {
  const ItemMenu({required this.itemName, Key? key}) : super(key: key);
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Text(
          itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: Color(0xff060606),
          ),
        ),
      ),
    );
  }
}
