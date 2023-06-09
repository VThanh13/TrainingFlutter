import 'package:flutter/material.dart';

class UserMovieScreen extends StatefulWidget {
  const UserMovieScreen({Key? key}) : super(key: key);

  @override
  State<UserMovieScreen> createState() => _UserMovieScreenState();
}

class _UserMovieScreenState extends State<UserMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return SizedBox(
            width: double.maxFinite,
            height: 260,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '私の自己紹介動画です',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Color(0xff060606),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz,
                        size: 20,
                        color: Color(0xff060606),
                      ),
                    ),
                  ],
                ),
                const Image(
                  image: AssetImage(
                    'assets/images/biz_design/image_12.png',
                  ),
                ),
              ],
            ),
          );
        });
  }
}
