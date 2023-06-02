import 'package:flutter/cupertino.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({required this.urlImage, Key? key}) : super(key: key);
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: 60,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: Image(
          image: AssetImage(urlImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
