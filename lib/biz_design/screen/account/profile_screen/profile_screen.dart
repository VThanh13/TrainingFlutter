import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../controller/user_controller.dart';
import '../../../core/blocs/profile_bloc/profile_bloc.dart';
import '../../../core/blocs/profile_bloc/profile_event.dart';
import '../../../core/blocs/profile_bloc/profile_state.dart';
import '../../../core/common/tag_search_custom.dart';
import '../user_top_screen/widgets/user_top_divider.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final List<IconData> _listIcon = <IconData>[
    Icons.facebook,
    Icons.eco_rounded,
    Icons.insert_comment_outlined,
    Icons.tiktok,
  ];

  final List<Color> _listColorIcon = <Color>[
    const Color(0xff212862),
    Colors.lightBlue,
    Colors.brown,
    Colors.black,
  ];

  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    profileBloc.add(ProfileInitialEvent());
    userController.getUserInfo();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  ProfileBloc profileBloc = ProfileBloc();

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    // ignore: unrelated_type_equality_checks
    return BlocConsumer<ProfileBloc, ProfileState>(
        bloc: profileBloc,
        listenWhen: (previous, current) => current is ProfileActionState,
        buildWhen: (previous, current) => current is! ProfileActionState,
        builder: (context, state) {
          // ignore: unrelated_type_equality_checks
          if (userController.isInternetConnect == true) {
            if (state is ProfileLoadingState) {
              return const Center(
                child: SizedBox(
                    height: 30, width: 30, child: CircularProgressIndicator()),
              );
            } else if (state is ProfileLoadedState) {
              return SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: SingleChildScrollView(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TagSearchCustom(
                              textValue: 'ビジネスコメント',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: ShowItemsListToColumn(
                                  list:
                                      userController.userModel.businessComment),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: UserTopDivider(),
                            ),
                            const TagSearchCustom(
                              textValue: '繋がりたい業種・職種',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: ShowItemsListToRow(
                                  list:
                                      userController.userModel.industryConnect),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: UserTopDivider(),
                            ),
                            const TagSearchCustom(
                              textValue: 'エリア',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: ShowItemsListToRow(
                                  list: userController.userModel.area),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const UserTopDivider(),
                            const TagSearchCustom(
                              textValue: '実績、経歴',
                            ),
                            Column(
                              children: [
                                ...List.generate(
                                  userController.userModel.career.length,
                                  (index) => Row(
                                    children: [
                                      Text(userController.list[index])
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const UserTopDivider(),
                            const TagSearchCustom(
                              textValue: '保有スキル',
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            ShowItemsListToRow(
                                list: userController.userModel.personSkill),
                            const SizedBox(
                              height: 10,
                            ),
                            const UserTopDivider(),
                            const TagSearchCustom(
                              textValue: '保有資格',
                            ),
                            FormatText(
                                textValue:
                                    userController.userModel.qualification),
                            const SizedBox(
                              height: 6,
                            ),
                            const UserTopDivider(),
                            const TagSearchCustom(textValue: '役職'),
                            FormatText(
                                textValue: userController.userModel.director),
                            const SizedBox(
                              height: 5,
                            ),
                            const UserTopDivider(),
                            const TagSearchCustom(textValue: '年収'),
                            FormatText(
                                textValue:
                                    userController.userModel.annualIncome),
                            const SizedBox(
                              height: 10,
                            ),
                            const TagSearchCustom(textValue: '資産'),
                            FormatText(
                                textValue: userController.userModel.asset),
                            const SizedBox(
                              height: 10,
                            ),
                            const UserTopDivider(),
                            const TagSearchCustom(textValue: '出身地'),
                            FormatText(
                                textValue:
                                    userController.userModel.placeOfBirth),
                            const SizedBox(
                              height: 10,
                            ),
                            const UserTopDivider(),
                            const TagSearchCustom(textValue: '趣味'),
                            FormatText(
                                textValue: userController.userModel.hobby),
                            const SizedBox(
                              height: 10,
                            ),
                            const UserTopDivider(),
                            const TagSearchCustom(textValue: 'SNS'),
                            Row(
                              children: [
                                ...List.generate(_listIcon.length, (index) {
                                  return IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      _listIcon[index],
                                      color: _listColorIcon[index],
                                      size: 20,
                                    ),
                                  );
                                })
                              ],
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          } else {
            return const Center(
              child: Text('No internet'),
            );
          }
        },
        listener: (context, state) {});
  }
}

class FormatText extends StatelessWidget {
  const FormatText({required this.textValue, Key? key}) : super(key: key);
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color(0xff060606),
        overflow: TextOverflow.visible,
      ),
      maxLines: 5,
    );
  }
}

class ShowItemsListToRow extends StatelessWidget {
  const ShowItemsListToRow({required this.list, super.key});
  final List list;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(list.length, (index) {
          final textPainter = TextPainter(
            text: TextSpan(
              text: list[index],
              style: const TextStyle(
                color: Color(0xff060606),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            textDirection: TextDirection.ltr,
          )..layout();
          return Container(
            height: 19,
            width: textPainter.width + 15,
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.3,
                color: const Color(0xffDD4A30),
              ),
            ),
            child: Center(
              child: Text(
                list[index],
                style: const TextStyle(
                  color: Color(0xff060606),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          );
        })
      ],
    );
  }
}

class ShowItemsListToColumn extends StatelessWidget {
  const ShowItemsListToColumn({required this.list, super.key});
  final List list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(list.length, (index) {
          return Text(
            list[index],
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff060606),
              overflow: TextOverflow.visible,
            ),
          );
        })
      ],
    );
  }
}
