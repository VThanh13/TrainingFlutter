import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/blog_manage_bloc/blog_manage_bloc.dart';
import '../../../core/blocs/blog_manage_bloc/blog_manage_event.dart';
import '../../../core/blocs/blog_manage_bloc/blog_manage_state.dart';
import '../../../core/common/avatar_user.dart';
import 'blog_comment.dart';
import 'create_blog.dart';

class BlogManageScreen extends StatefulWidget {
  const BlogManageScreen({Key? key}) : super(key: key);

  @override
  State<BlogManageScreen> createState() => _BlogManageScreenState();
}

class _BlogManageScreenState extends State<BlogManageScreen> {
  BlogManageBloc blogManageBloc = BlogManageBloc();

  @override
  void initState() {
    super.initState();
    blogManageBloc.add(BlogManageInitialEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlogManageBloc, BlogManageState>(
        bloc: blogManageBloc,
        listenWhen: (previous, current) => current is BlogManageActionState,
        buildWhen: (previous, current) => current is! BlogManageActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case BlogManageInitialState:
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 47,
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              blogManageBloc.add(ClickToCreateBlogEvent());
                            },
                            icon: const Icon(Icons.add_circle),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              'ブログを作成',
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
                    Divider(
                      height: 0,
                      color: Theme.of(context).dividerColor,
                      indent: 0,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: SizedBox(
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height - 400,
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, snapshot) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const AvatarUser(
                                            width: 32,
                                            height: 32,
                                            urlImage:
                                                'assets/images/biz_design/image_14.png',
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '田中 武彦',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .color,
                                            ),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showCupertinoModalPopup(
                                              context: context,
                                              builder: (context) {
                                                return CupertinoActionSheet(
                                                  actions: [
                                                    CupertinoActionSheetAction(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return CupertinoAlertDialog(
                                                                title:
                                                                    const Text(
                                                                  '投稿を削除します',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Color(
                                                                        0xff000000),
                                                                  ),
                                                                ),
                                                                content:
                                                                    const Text(
                                                                  'この投稿を削除します。\n投稿した内容が全て削除されます。',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Color(
                                                                        0xff000000),
                                                                  ),
                                                                ),
                                                                actions: [
                                                                  Column(
                                                                    children: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          '削除する',
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                Color(0xff001AFF),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          '削除しない',
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                Color(0xff001AFF),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              );
                                                            });
                                                      },
                                                      child: const Text(
                                                        '削除する',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff0500FF),
                                                        ),
                                                      ),
                                                    ),
                                                    CupertinoActionSheetAction(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        blogManageBloc.add(
                                                            ClickToCreateBlogEvent());
                                                      },
                                                      child: const Text(
                                                        '編集する',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  cancelButton:
                                                      CupertinoActionSheetAction(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'キャンセル',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xff000000),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        icon: const Icon(
                                          Icons.more_horiz,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const SizedBox(
                                    width: double.maxFinite,
                                    height: 350,
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/biz_design/Rectangle_12.png'),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 10),
                                    color: const Color(0xffF2F2F2),
                                    width: double.maxFinite,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.favorite_border,
                                                size: 25,
                                                color: Colors.black,
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
                                                blogManageBloc.add(
                                                    ClickToCommentBlogEvent());
                                              },
                                              icon: const Icon(
                                                Icons.messenger_outline_sharp,
                                                size: 25,
                                                color: Colors.black,
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
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              );
            case ClickToCommentBlogState:
              return const BlogCommentScreen();
            case ClickToCreateBlogState:
              return const CreateBlogScreen();
            default:
          }
          return const SizedBox();
        },
        listener: (context, state) {});
  }
}
