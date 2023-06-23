import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/profile_setting_bloc/profile_setting_bloc.dart';
import '../../../core/blocs/profile_setting_bloc/profile_setting_event.dart';
import '../../../core/blocs/profile_setting_bloc/profile_setting_state.dart';
import '../../../core/common/tag_search_custom.dart';
import '../user_home/user_home_2/top_search_material/top_text_field_custom.dart';
import '../user_home/user_home_2/top_search_screen.dart';
import '../user_home/user_home_screen/material_home_screen/home_divider.dart';
import 'disable_profile_setting.dart';
import 'widgets/search_item_tag.dart';
import 'widgets/user_information.dart';

class ActiveProfileSetting extends StatefulWidget {
  const ActiveProfileSetting({Key? key}) : super(key: key);

  @override
  State<ActiveProfileSetting> createState() => _ActiveProfileSettingState();
}

class _ActiveProfileSettingState extends State<ActiveProfileSetting> {
  final ProfileSettingBloc profileSettingBloc = ProfileSettingBloc();

  late final ScrollController _scrollController;

  final List _listJobUserWant = [];
  final List _listAreaToMatch = [];
  final List _listSkillPerson = [];
  final List _listQualification = [];

  @override
  void initState() {
    super.initState();
    profileSettingBloc.add(ClickToActiveProfileEvent());
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: BlocConsumer<ProfileSettingBloc, ProfileSettingState>(
        bloc: profileSettingBloc,
        listenWhen: (previous, current) => current is ProfileSettingActionState,
        buildWhen: (previous, current) => current is! ProfileSettingActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ClickToActiveProfileState:
              return SingleChildScrollView(
                controller: _scrollController,
                //key: _storageKey,
                padding: const EdgeInsets.fromLTRB(10, 23, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const UserInformation(
                      isActive: true,
                    ),
                    const TagSearchCustom(textValue: 'マッチングしたい職種'),
                    SearchItemTag(listItem: _listJobUserWant),
                    const TagSearchCustom(textValue: 'マッチングしたいエリア'),
                    SearchItemTag(listItem: _listAreaToMatch),
                    const TagSearchCustom(textValue: '実績、経歴'),
                    const TopTextField(hintText: '\n \n'),
                    const TagSearchCustom(textValue: '保有スキル'),
                    SearchItem(listItem: _listSkillPerson),
                    const TagSearchCustom(textValue: '保有資格'),
                    SearchItem(listItem: _listQualification),
                    const TagSearchCustom(textValue: '役職'),
                    const TopTextField(hintText: '\n'),
                    const TagSearchCustom(textValue: '年収'),
                    const TopTextField(hintText: '\n'),
                    const TagSearchCustom(textValue: '資産'),
                    const TopTextField(hintText: '\n'),
                    const TagSearchCustom(textValue: '出身地'),
                    const TopTextField(hintText: '\n'),
                    const TagSearchCustom(textValue: '趣味'),
                    const TopTextField(hintText: '\n'),
                    const TagSearchCustom(textValue: 'SNS'),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: 'facebook ID',
                        hintStyle: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: 'Twitter ID',
                        hintStyle: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: 'Instagram ID',
                        hintStyle: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: 'TikTok ID',
                        hintStyle: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const TopDivider(),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 35,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xff060606),
                        ),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              profileSettingBloc
                                  .add(ProfileSettingInitialEvent());
                            },
                            child: SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width - 28) / 2,
                              child: const Center(
                                child: Text(
                                  '下書き保存する（公開されません）',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: const Color(0xff060606),
                            width: 1,
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoAlertDialog(
                                      title: const Text(
                                        'プロフィールを公開します',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      content: const Text(
                                        '公開してよろしいですか？',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      actions: [
                                        Column(
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return CupertinoAlertDialog(
                                                        title: const Text(
                                                          'プロフィールを公開します',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                              profileSettingBloc
                                                                  .add(
                                                                      ProfileSettingInitialEvent());
                                                            },
                                                            child: const Text(
                                                              '公開しない',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                    0xff001AFF),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              },
                                              child: const Text(
                                                '公開する',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff001AFF),
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                '公開しない',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff001AFF),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width - 28) / 2,
                              child: const Center(
                                child: Text(
                                  '保存する（公開されます）',
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffFFB6A9),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            case ProfileSettingInitialState:
              return const DisableProfileSetting();
            default:
          }
          return const SizedBox();
        },
      ),
    );
  }
}
