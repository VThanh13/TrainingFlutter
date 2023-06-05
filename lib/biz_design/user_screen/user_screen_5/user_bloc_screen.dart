import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserBlocScreen extends StatefulWidget {
  const UserBlocScreen({Key? key}) : super(key: key);

  @override
  State<UserBlocScreen> createState() => _UserBlocScreenState();
}

class _UserBlocScreenState extends State<UserBlocScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent) {
      setState(() {
      });
    }
  }

  final List _listImageUrl = [
    'assets/images/biz_design/bloc_image_1.png',
    'assets/images/biz_design/bloc_image_2.png',
    'assets/images/biz_design/bloc_image_3.png',
    'assets/images/biz_design/bloc_image_4.png',
    'assets/images/biz_design/bloc_image_5.png',
    'assets/images/biz_design/bloc_image_6.png',
    'assets/images/biz_design/bloc_image_7.png',
    'assets/images/biz_design/bloc_image_8.png',
    'assets/images/biz_design/bloc_image_9.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: GridView.builder(
        controller: _scrollController,
        itemCount: _listImageUrl.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemBuilder: (context, index) {
          for (int i = 0; i <= _listImageUrl.length;) {
            return SizedBox(
              height: 115,
              width: 118,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image(
                  image: AssetImage(
                    _listImageUrl[index],
                  ),
                ),
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}
