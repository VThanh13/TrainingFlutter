import 'package:flutter/material.dart';
import '../../../../core/common/avatar_user.dart';
import '../../../../core/common/tag_search_custom.dart';
import '../../user_home/user_home_2/top_search_material/top_text_field_custom.dart';
import 'blue_border_tag.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({this.isActive = false, Key? key}) : super(key: key);
  final bool ?isActive;

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isActive == true?
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlueBorderTag(
              textValue: '公開中',
              size: 10,
              height: 21,
            ),
            BlueBorderTag(
              textValue: '本人書類確認済み',
              size: 10,
              height: 21,
            ),
            BlueBorderTag(
              textValue: 'プレミアム会員',
              size: 10,
              height: 21,
            ),
          ],
        ): const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlueBorderTag(textValue: '公開中'),
            BlueBorderTag(textValue: '本人書類確認済み'),
            BlueBorderTag(textValue: 'プレミアム会員'),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          width: double.maxFinite,
          height: 180,
          child: Row(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      const SizedBox(
                        width: 95,
                      ),
                      const AvatarUser(
                        width: 92,
                        height: 92,
                        urlImage:
                        'assets/images/biz_design/image_1.png',
                      ),
                      Positioned(
                        left: 55,
                        top: 55,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_circle_sharp,
                            color: Color(0xff212862),
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 76,
                    height: 33,
                    margin: const EdgeInsets.only(top: 14),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff000000),
                        width: 1,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'My QRコード\nを表示',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const TagSearchCustom(textValue: 'お名前'),
                        widget.isActive == true ?activeTag() : const SizedBox(),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        TopTextField(
                          hintText: '田中',
                          width: 106,
                        ),
                        TopTextField(
                          hintText: '武彦',
                          width: 106,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const TagSearchCustom(textValue: '年齢'),
                        widget.isActive == true? activeTag() : const SizedBox(),
                      ],
                    ),
                    const TopTextField(
                      hintText: '36',
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            const TagSearchCustom(textValue: '一言コメント（公開されます）'),
            widget.isActive == true ?activeTag() : const SizedBox(),
          ],
        ),
        widget.isActive == true ?
        const TopTextField(
          hintText: 'はじめまして\nよろしくお願いいたします。',
          readOnly: true,
        ):
        const TopTextField(
          hintText: 'はじめまして\nよろしくお願いいたします。',
        ),
        Row(
          children: [
            const TagSearchCustom(textValue: '職業'),
            widget.isActive == true ?activeTag() : const SizedBox(),
          ],
        ),
        const TopTextField(hintText: '会社員'),
        Row(
          children: [
            const TagSearchCustom(textValue: '業種・職種'),
            widget.isActive == true ?activeTag() : const SizedBox(),
          ],
        ),
        const TopTextField(hintText: '建設業 > 営業'),
        Row(
          children: [
            const TagSearchCustom(textValue: '会社名'),
            widget.isActive == true ?activeTag() : const SizedBox(),
          ],
        ),
        const TopTextField(hintText: '五洋建設株式会社'),
        Row(
          children: [
            const TagSearchCustom(textValue: 'エリア設定'),
            widget.isActive == true ?activeTag() : const SizedBox(),
          ],
        ),
        const TopTextField(hintText: '東京都 杉並区'),
        Row(
          children: [
            const TagSearchCustom(textValue: '名刺設定'),
            widget.isActive == true ?activeTag() : const SizedBox(),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 134,
              width: 240,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Image(
                  image: AssetImage(
                      'assets/images/biz_design/image_13.png'),
                ),
              ),
            ),
            Container(
              width: 40,
              height: 40,
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
                    Icons.add_circle_sharp,
                    color: Color(0xff212862),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: TagSearchCustom(textValue: 'ビジネスコメント'),
        ),
        const TopTextField(
            hintText: '初めまして、既存のお客様からDX関連の相談をいただくことが多いです。\n'
                'ITコンサルやWebシステム制作のノウハウをお持ちの方と繋がりたいと思っています。\n'
                'よろしくお願いします。'),
      ],
    );
  }
  Widget activeTag() {
    return Container(
      height: 17,
      width: 40,
      color: const Color(0xffFF0202),
      margin: const EdgeInsets.only(left: 12),
      child: const Center(
        child: Text(
          '必須',
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
