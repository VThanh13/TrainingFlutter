import 'package:flutter/material.dart';

import '../../../core/common/avatar_user.dart';
import '../../../core/common/custom_button.dart';
import '../user_top_screen/widgets/user_top_divider.dart';

class BlogCommentDetailScreen extends StatefulWidget {
  const BlogCommentDetailScreen({Key? key}) : super(key: key);

  @override
  State<BlogCommentDetailScreen> createState() =>
      _BlogCommentDetailScreenState();
}

class _BlogCommentDetailScreenState extends State<BlogCommentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.83,
          width: double.maxFinite,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: double.maxFinite,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const AvatarUser(
                              width: 33,
                              height: 31,
                              urlImage: 'assets/images/biz_design/image_1.png',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
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
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 10),
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
                                fontSize: 10,
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
                              color:
                                  Theme.of(context).textTheme.titleSmall!.color,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(12, 15, 12, 10),
                          child: UserTopDivider(),
                        ),
                        Row(
                          children: [
                            const AvatarUser(
                              width: 33,
                              height: 31,
                              urlImage: 'assets/images/biz_design/image_11.png',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                '高橋 恵',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
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
                            padding: const EdgeInsets.only(left: 15, right: 10),
                            child: Text(
                              'コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント、コメント',
                              style: TextStyle(
                                fontSize: 10,
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
                                icon: Icon(
                                  Icons.favorite_border,
                                  size: 20,
                                  color: Theme.of(context)
                                      .appBarTheme
                                      .iconTheme!
                                      .color,
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
                            ],
                          ),
                        ),
                        const UserTopDivider(),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(bottom: 10),
                  color: const Color(0xffF2F2F2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const AvatarUser(
                        width: 45,
                        height: 45,
                        urlImage: 'assets/images/biz_design/image_11.png',
                      ),
                      const SizedBox(
                        width: 215,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '1000文字以内でコメントを入力してください',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
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
                        tab: () {},
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
  }
}
