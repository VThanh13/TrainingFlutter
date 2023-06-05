import 'package:flutter/cupertino.dart';

class UserDescription extends StatelessWidget {
  const UserDescription({required this.userDescription, Key? key})
      : super(key: key);
  final String userDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 171,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          width: 0.3,
          color: const Color(0xffDD4A30),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            userDescription,
            style: const TextStyle(
              color: Color(0xff333333),
              fontSize: 10,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.visible,
            ),
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}
