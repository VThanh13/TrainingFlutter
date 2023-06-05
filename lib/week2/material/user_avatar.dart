import 'package:flutter/cupertino.dart';

class UserAvatar extends StatefulWidget{
  const UserAvatar({super.key});

  @override
  State<UserAvatar> createState() => _UserAvatar();
}

class _UserAvatar extends State<UserAvatar>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 73,
      height: 74,
      margin: const EdgeInsets.only(top: 32.47),
      child: const ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Image(
          image: AssetImage('assets/images/week2/image1.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

}