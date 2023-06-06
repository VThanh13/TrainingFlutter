import 'package:code/biz_design/user_screen/user_blog_screen/user_blog_comment_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/avatar_user.dart';
import 'bloc_bloc_screen/blog_bloc.dart';
import 'bloc_bloc_screen/blog_event.dart';
import 'bloc_bloc_screen/blog_state.dart';

class UserBlogDetailScreen extends StatefulWidget {
  const UserBlogDetailScreen({required this.image, Key? key}) : super(key: key);
  final String image;

  @override
  State<UserBlogDetailScreen> createState() => _UserBlogDetailScreenState();
}

class _UserBlogDetailScreenState extends State<UserBlogDetailScreen> {
  final BlogBloc blogBloc = BlogBloc();

  @override
  void initState() {
    blogBloc.add(BlogClickImageToBlogDetailEvent());
    super.initState();
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
            return SingleChildScrollView(
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
                            urlImage: 'assets/images/biz_design/image_1.png',
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
                  SizedBox(
                    height: 349,
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
                                blogBloc.add(
                                  BlogClickCommentToBlogDetailCommentEvent(),
                                );
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
          case BlogClickCommentToBlogDetailCommentState:
            return const BlogCommentDetailScreen();
          default:
        }
        return const SizedBox();
      },
    );
  }
}
