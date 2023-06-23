import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/blog_screen_bloc/blog_bloc.dart';
import '../../../core/blocs/blog_screen_bloc/blog_event.dart';
import '../../../core/blocs/blog_screen_bloc/blog_state.dart';
import '../../../core/common/avatar_user.dart';
import 'user_blog_comment_detail_screen.dart';

class UserBlogDetailScreen extends StatefulWidget {
  const UserBlogDetailScreen({required this.image, Key? key}) : super(key: key);
  final String image;

  @override
  State<UserBlogDetailScreen> createState() => _UserBlogDetailScreenState();
}

class _UserBlogDetailScreenState extends State<UserBlogDetailScreen> {
  final BlogBloc blogBloc = BlogBloc();

  late final ScrollController _scrollController;
  late final PageStorageKey _storageKey;
  double? _savedPosition;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    blogBloc.add(BlogClickImageToBlogDetailEvent());
    super.initState();
    _storageKey = const PageStorageKey('user_profile_scroll_position');
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlogBloc, BlogState>(
      bloc: blogBloc,
      listenWhen: (previous, current) => current is BlogActionState,
      buildWhen: (previous, current) => current is! BlogActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case BlogClickImageToBlogDetailState:
            return FutureBuilder(
                future: Future.delayed(Duration.zero),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  if (_savedPosition != null) {
                    _scrollController.animateTo(
                      _savedPosition!,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                  return SingleChildScrollView(
                    controller: _scrollController,
                    key: _storageKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                AvatarUser(
                                  width: 33,
                                  height: 31,
                                  urlImage:
                                      'assets/images/biz_design/image_1.png',
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    '田中 武彦',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: Color(0xff060606),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.more_horiz,
                                color: Color(0xff060606),
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 350,
                          margin: const EdgeInsets.only(top: 25),
                          width: double.maxFinite,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image(
                              image: AssetImage(widget.image),
                            ),
                          ),
                        ),
                        Container(
                          height: 148,
                          width: double.maxFinite,
                          color: const Color(0xffF2F2F2),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite_border,
                                      size: 20,
                                    ),
                                  ),
                                  const Text(
                                    '85',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff060606),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      show();
                                    },
                                    icon: const Icon(
                                      Icons.messenger_outline,
                                      size: 20,
                                    ),
                                  ),
                                  const Text(
                                    '5',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff060606),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 6, right: 9),
                                child: Text(
                                  'テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff060606),
                                  ),
                                ),
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '2020.10.20 (Mon)',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Color(0xff060606),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          case BlogClickCommentToBlogDetailCommentState:
            return show();
          default:
        }
        return const SizedBox();
      },
    );
  }

  show() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const BlogCommentDetailScreen(),
        );
      },
    );
  }
}
