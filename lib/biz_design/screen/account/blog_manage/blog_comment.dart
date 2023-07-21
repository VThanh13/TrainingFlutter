import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/blog_manage_bloc/blog_manage_bloc.dart';
import '../../../core/blocs/blog_manage_bloc/blog_manage_event.dart';
import '../../../core/blocs/blog_manage_bloc/blog_manage_state.dart';
import '../../../core/common/avatar_user.dart';
import '../../../core/common/custom_button.dart';
import '../user_top_screen/widgets/user_top_divider.dart';
import 'blog_manage.dart';

class BlogCommentScreen extends StatefulWidget {
  const BlogCommentScreen({Key? key}) : super(key: key);

  @override
  State<BlogCommentScreen> createState() => _BlogCommentScreenState();
}

class _BlogCommentScreenState extends State<BlogCommentScreen> {
  BlogManageBloc blogManageBloc = BlogManageBloc();
  final TextEditingController _commentController = TextEditingController();

  bool validateComment = false;

  @override
  void initState() {
    blogManageBloc.add(ClickToCommentBlogEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: BlocConsumer<BlogManageBloc, BlogManageState>(
        bloc: blogManageBloc,
        listenWhen: (previous, current) => current is BlogManageActionState,
        buildWhen: (previous, current) => current is! BlogManageActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ClickToCommentBlogState:
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 310,
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height - 370,
                            width: double.maxFinite,
                            child: SingleChildScrollView(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const AvatarUser(
                                        width: 33,
                                        height: 31,
                                        urlImage:
                                            'assets/images/biz_design/image_1.png',
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          '田中 武彦',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .color,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: double.maxFinite,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 10),
                                      child: Text(
                                        'テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、'
                                        'テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、'
                                        'テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、'
                                        'テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、'
                                        'テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、'
                                        'テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、'
                                        'テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、'
                                        'テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、'
                                        'テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、テキスト、',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .color,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      '7時間前',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .color,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(12, 15, 12, 10),
                                    child: UserTopDivider(),
                                  ),
                                  Row(
                                    children: [
                                      const AvatarUser(
                                        width: 33,
                                        height: 31,
                                        urlImage:
                                            'assets/images/biz_design/image_11.png',
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          '高橋 恵',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .color,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: double.maxFinite,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 10),
                                      child: Text(
                                        'コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .color,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          '3時間前',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10,
                                            color: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .color,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.favorite_border,
                                            size: 20,
                                          ),
                                        ),
                                        Text(
                                          '85',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            color: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .color,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            '返信する',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .color,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 30,
                                    ),
                                    child: Column(
                                      children: [
                                        const UserTopDivider(),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            const AvatarUser(
                                              width: 27,
                                              height: 27,
                                              urlImage:
                                                  'assets/images/biz_design/image_11.png',
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Text(
                                                '高橋 恵',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .color,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: double.maxFinite,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, right: 10),
                                            child: Text(
                                              'コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .color,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Row(
                                            children: [
                                              Text(
                                                '3時間前',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 10,
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .color,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.favorite_border,
                                                  size: 20,
                                                ),
                                              ),
                                              Text(
                                                '85',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .color,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  '返信する',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .color),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const UserTopDivider(),
                                  const SizedBox(height: 50),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: double.maxFinite,
                            color: const Color(0xffF2F2F2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const AvatarUser(
                                  width: 45,
                                  height: 45,
                                  urlImage:
                                      'assets/images/biz_design/image_11.png',
                                ),
                                SizedBox(
                                  width: 215,
                                  child: TextField(
                                    controller: _commentController,
                                    decoration: InputDecoration(
                                      hintText: '1000文字以内でコメントを入力してください',
                                      border: InputBorder.none,
                                      errorText: validateComment
                                          ? 'Comment can\'t be null'
                                          : null,
                                      hintStyle: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffABABAB),
                                      ),
                                    ),
                                  ),
                                ),
                                CustomButton(
                                  height: 25,
                                  width: 82,
                                  text: 'コメント',
                                  size: 10,
                                  tab: () {
                                    setState(() {
                                      _commentController.text.isEmpty
                                          ? validateComment = true
                                          : validateComment = false;
                                    });
                                    if (validateComment == false) {
                                      blogManageBloc
                                          .add(BlogManageInitialEvent());
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            case BlogManageInitialState:
              return const BlogManageScreen();
            default:
          }
          return const SizedBox();
        },
      ),
    );
  }
}
