import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/user_controller.dart';
import '../../../core/blocs/profile_bloc/profile_bloc.dart';
import '../../../core/blocs/profile_bloc/profile_event.dart';
import '../../../core/blocs/profile_bloc/profile_state.dart';
import '../../../core/common/tag_search_custom.dart';
import '../user_top_screen/widgets/user_top_divider.dart';
import 'widget/profile_widget.dart';

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

  @override
  void initState() {
    super.initState();

    profileBloc.add(ProfileInitialEvent());
    userController.getUserInfo();
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
  }

  ProfileBloc profileBloc = ProfileBloc();

  UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    // ignore: unrelated_type_equality_checks
    return BlocBuilder<ProfileBloc, ProfileState>(
        bloc: profileBloc,
        //listenWhen: (previous, current) => current is ProfileActionState,
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
                    Container(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height * 0.6,
                      color: Theme.of(context).scaffoldBackgroundColor,
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
                                  list: profileBloc.user.businessComment),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: UserTopDivider(),
                            ),
                            const TagSearchCustom(textValue: '繋がりたい業種・職種'),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: ShowItemsListToRow(
                                  list: profileBloc.user.industryConnect),
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
                                  list: profileBloc.user.area),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const UserTopDivider(),
                            const TagSearchCustom(textValue: '実績、経歴'),
                            Column(
                              children: [
                                ...List.generate(
                                  profileBloc.user.career.length,
                                  (index) => Row(
                                    children: [
                                      Text(profileBloc.listCareer[index])
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            const UserTopDivider(),
                            const TagSearchCustom(textValue: '保有スキル'),
                            const SizedBox(height: 6),
                            ShowItemsListToRow(
                                list: profileBloc.user.personSkill),
                            const SizedBox(
                              height: 10,
                            ),
                            const UserTopDivider(),
                            const TagSearchCustom(textValue: '保有資格'),
                            FormatText(
                                textValue: profileBloc.user.qualification),
                            const SizedBox(height: 6),
                            const UserTopDivider(),
                            const TagSearchCustom(textValue: '役職'),
                            FormatText(textValue: profileBloc.user.director),
                            const SizedBox(height: 5),
                            const UserTopDivider(),
                            const TagSearchCustom(textValue: '年収'),
                            FormatText(
                                textValue: profileBloc.user.annualIncome),
                            const SizedBox(height: 10),
                            const TagSearchCustom(textValue: '資産'),
                            FormatText(textValue: profileBloc.user.asset),
                            const SizedBox(height: 10),
                            const UserTopDivider(),
                            const TagSearchCustom(textValue: '出身地'),
                            FormatText(
                                textValue: profileBloc.user.placeOfBirth),
                            const SizedBox(height: 10),
                            const UserTopDivider(),
                            const TagSearchCustom(textValue: '趣味'),
                            FormatText(textValue: profileBloc.user.hobby),
                            const SizedBox(height: 10),
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
            } else if (state is ProfileErrorState) {
              return const Center(child: Text('Error!'));
            }
            return const SizedBox();
          } else {
            return const Center(
              child: Text('No internet'),
            );
          }
        });
    //listener: (context, state) {});
  }
}
