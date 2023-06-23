import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../controller/user_controller.dart';
import '../../../core/blocs/profile_bloc/profile_bloc.dart';
import '../../../core/blocs/profile_bloc/profile_event.dart';
import '../../../core/blocs/profile_bloc/profile_state.dart';
import '../../../core/common/tag_search_custom.dart';
import '../../../models/user_model/user_model.dart';
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
    userController.getUsers();
    getAllUser();
    profileBloc.add(ProfileInitialEvent());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  ProfileBloc profileBloc = ProfileBloc();

  UserController userController = Get.put(UserController());
  late List<UserModel> _userList = <UserModel>[];

  getAllUser() async {
    var users = await userController.readUser();
    _userList = <UserModel>[];
    users.forEach((user) {
      _userList.clear();
      setState(() {
        var userModel = UserModel();
        userModel.businessComment = user['businessComment'];
        userModel.industryConnect = user['industryConnect'];
        userModel.area = user['area'];
        userModel.career = user['career'];
        userModel.personSkill = user['personSkill'];
        userModel.director = user['director'];
        userModel.annualIncome = user['annualIncome'];
        userModel.asset = user['asset'];
        userModel.placeOfBirth = user['placeOfBirth'];
        userModel.hobby = user['hobby'];
        userModel.id = user['id'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
        bloc: profileBloc,
        listenWhen: (previous, current) => current is ProfileActionState,
        buildWhen: (previous, current) => current is! ProfileActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case ProfileInitialState:
              return FutureBuilder(
                  future: userController.getUsers(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.maxFinite,
                              height: MediaQuery.of(context).size.height * 0.6,
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const TagSearchCustom(
                                      textValue: 'ビジネスコメント',
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: ShowItemsListToColumn(
                                          list: userController
                                                  .isInternetConnect.value
                                              ? userController
                                                  .users.first.businessComment!
                                              : ['1', '2']),
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
                                            list: userController
                                                    .isInternetConnect.value
                                                ? userController.users.first
                                                    .industryConnect!
                                                : ['1'])),
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
                                          list: userController
                                                  .isInternetConnect.value
                                              ? userController.users.first.area!
                                              : ['1']),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const UserTopDivider(),
                                    const TagSearchCustom(
                                      textValue: '実績、経歴',
                                    ),
                                    ShowItemsListToColumn(
                                        list: userController
                                                .isInternetConnect.value
                                            ? userController.users.first.career!
                                            : ['1']),
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
                                        list: userController
                                                .isInternetConnect.value
                                            ? userController
                                                .users.first.personSkill!
                                            : ['1']),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const UserTopDivider(),
                                    const TagSearchCustom(
                                      textValue: '保有資格',
                                    ),
                                    FormatText(
                                        textValue: userController
                                                .isInternetConnect.value
                                            ? userController
                                                .users.first.qualification!
                                            : _userList.first.qualification!),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    const UserTopDivider(),
                                    const TagSearchCustom(textValue: '役職'),
                                    FormatText(
                                        textValue: userController
                                                .isInternetConnect.value
                                            ? userController
                                                .users.first.director!
                                            : _userList.first.director!),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const UserTopDivider(),
                                    const TagSearchCustom(textValue: '年収'),
                                    FormatText(
                                        textValue: userController
                                                .isInternetConnect.value
                                            ? userController
                                                .users.first.annualIncome!
                                            : _userList.first.annualIncome!),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const TagSearchCustom(textValue: '資産'),
                                    FormatText(
                                        textValue: userController
                                                .isInternetConnect.value
                                            ? userController.users.first.asset!
                                            : _userList.first.asset!),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const UserTopDivider(),
                                    const TagSearchCustom(textValue: '出身地'),
                                    FormatText(
                                        textValue: userController
                                                .isInternetConnect.value
                                            ? userController
                                                .users.first.placeOfBirth!
                                            : _userList.first.placeOfBirth!),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const UserTopDivider(),
                                    const TagSearchCustom(textValue: '趣味'),
                                    FormatText(
                                        textValue: userController
                                                .isInternetConnect.value
                                            ? userController.users.first.hobby!
                                            : _userList.first.hobby!),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const UserTopDivider(),
                                    const TagSearchCustom(textValue: 'SNS'),
                                    Row(
                                      children: [
                                        ...List.generate(_listIcon.length,
                                            (index) {
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
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator()),
                      );
                    }
                  });
            default:
          }
          return const SizedBox();
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
