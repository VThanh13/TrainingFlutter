import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/blog_manage_bloc/blog_manage_bloc.dart';
import '../../../core/blocs/blog_manage_bloc/blog_manage_event.dart';
import '../../../core/blocs/blog_manage_bloc/blog_manage_state.dart';
import '../../../core/common/avatar_user.dart';
import '../../../core/common/custom_button.dart';
import 'blog_manage.dart';

class CreateBlogScreen extends StatefulWidget {
  const CreateBlogScreen({Key? key}) : super(key: key);

  @override
  State<CreateBlogScreen> createState() => _CreateBlogScreenState();
}

class _CreateBlogScreenState extends State<CreateBlogScreen> {
  BlogManageBloc blogManageBloc = BlogManageBloc();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  bool validateTitle = false;
  bool validateContent = false;

  @override
  void initState() {
    super.initState();
    blogManageBloc.add(ClickToCreateBlogEvent());
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
            case ClickToCreateBlogState:
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            blogManageBloc.add(BlogManageInitialEvent());
                          },
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: Color(0xff060606),
                            size: 25,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CustomButton(
                              text: '投稿する',
                              width: 82,
                              height: 25,
                              tab: () {
                                setState(() {
                                  _titleController.text.isEmpty
                                      ? validateTitle = true
                                      : validateTitle = false;
                                  _contentController.text.isEmpty
                                      ? validateContent = true
                                      : validateContent = false;
                                });
                                if (validateTitle == false &&
                                    validateContent == false) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return CupertinoAlertDialog(
                                          title: const Text(
                                            'アクション完了テキストが入ります',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                blogManageBloc.add(
                                                    BlogManageInitialEvent());
                                              },
                                              child: const Text(
                                                '戻る',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff0500FF),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                }
                              }),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const AvatarUser(
                          width: 30,
                          height: 30,
                          urlImage: 'assets/images/biz_design/image_1.png',
                        ),
                        Container(
                          width: 1,
                          height: 30,
                          color: const Color(0xffDD4A30),
                          margin: const EdgeInsets.only(left: 5, right: 10),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 80,
                          child: TextField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              hintText: 'タイトルを入力してください',
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                              errorText:
                                  validateTitle ? 'Title can\'t be null' : null,
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 30,
                        height: 200,
                        child: TextField(
                          maxLines: 10,
                          minLines: 1,
                          controller: _contentController,
                          decoration: InputDecoration(
                            hintText: '本文を入力してください',
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                            errorText: validateContent
                                ? 'Content can\'t be null'
                                : null,
                            border: const UnderlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        '画像を登録',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xff060606),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width - 40) / 2,
                          height: 86,
                          margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          decoration: const BoxDecoration(
                            color: Color(0xffF2F2F2),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_circle,
                                size: 40,
                                color: Color(0xff212862),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 40) / 2,
                          height: 86,
                          margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          decoration: const BoxDecoration(
                            color: Color(0xffF2F2F2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_circle,
                                size: 40,
                                color: Color(0xff212862),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
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
