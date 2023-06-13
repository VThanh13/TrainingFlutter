import 'package:flutter/cupertino.dart';

class AvatarUser extends StatelessWidget {
  const AvatarUser({required this.width,
    required this.height,
    required this.urlImage,
    Key? key}) : super(key: key);
  final String urlImage;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        child: Image(
          image: AssetImage(urlImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
