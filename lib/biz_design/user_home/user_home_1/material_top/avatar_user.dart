import 'package:flutter/cupertino.dart';

class AvatarUser extends StatelessWidget {
  const AvatarUser({required this.urlImage, Key? key}) : super(key: key);
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      width: 65,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        child: Image(
          image: AssetImage(urlImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
