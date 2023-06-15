import 'package:code/biz_design/screen/account/blog_screen/user_blog_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/blog_screen_bloc/blog_bloc.dart';
import '../../../core/blocs/blog_screen_bloc/blog_event.dart';
import '../../../core/blocs/blog_screen_bloc/blog_state.dart';


class UserBlogScreen extends StatefulWidget {
  const UserBlogScreen({Key? key}) : super(key: key);

  @override
  State<UserBlogScreen> createState() => _UserBlogScreenState();
}

class _UserBlogScreenState extends State<UserBlogScreen>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final PageStorageKey _storageKey;
  double? _savedPosition;
  final BlogBloc blogBloc = BlogBloc();
  @override
  void initState() {
    _storageKey = const PageStorageKey('user_profile_scroll_position');
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    blogBloc.add(BlogInitialEvent());
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
      setState(() {});
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

  String image = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: BlocConsumer<BlogBloc, BlogState>(
        bloc: blogBloc,
        listenWhen: (previous, current) => current is BlogActionState,
        buildWhen: (previous, current) => current is! BlogActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case BlogInitialState:
              return FutureBuilder(
                future: Future.delayed(Duration.zero),
                  builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                  if(_savedPosition != null){
                    _scrollController.animateTo(_savedPosition!,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  }
                  return GridView.builder(
                    key: _storageKey,
                    controller: _scrollController,
                    itemCount: _listImageUrl.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                    ),
                    itemBuilder: (context, index) {
                      for (int i = 0; i <= _listImageUrl.length;) {
                        return InkWell(
                          onTap: () {
                            blogBloc.add(BlogClickImageToBlogDetailEvent());
                            image = _listImageUrl[index];
                          },
                          child: SizedBox(
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
                          ),
                        );
                      }
                      return null;
                    },
                  );
              });
            case BlogClickImageToBlogDetailState:
              return UserBlogDetailScreen(image: image,);
            default:
          }
          return const SizedBox();
        },
      ),
    );
  }
}
