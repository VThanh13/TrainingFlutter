import 'package:code/biz_design/screen/account/profile_setting/widgets/user_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/blocs/profile_setting_bloc/profile_setting_bloc.dart';
import '../../../core/blocs/profile_setting_bloc/profile_setting_event.dart';
import '../../../core/blocs/profile_setting_bloc/profile_setting_state.dart';
import '../../../core/common/tag_search_custom.dart';
import '../user_home/user_home_2/top_search_material/top_text_field_custom.dart';
import '../user_home/user_home_2/top_search_screen.dart';
import '../user_home/user_home_screen/material_home_screen/home_divider.dart';
import 'active_profile_setting.dart';


class DisableProfileSetting extends StatefulWidget {
  const DisableProfileSetting({Key? key}) : super(key: key);

  @override
  State<DisableProfileSetting> createState() => _DisableProfileSettingState();
}

class _DisableProfileSettingState extends State<DisableProfileSetting> {
  final List _listJobUserWant = [];
  final List _listAreaToMatch = [];
  final List _listSkillPerson = [];
  final List _listQualification = [];

  late final ScrollController _scrollController;
  late final PageStorageKey _storageKey;
  double? _savedPosition;

  final ProfileSettingBloc profileSettingBloc = ProfileSettingBloc();

  @override
  void initState() {
    super.initState();
    profileSettingBloc.add(ProfileSettingInitialEvent());
    _storageKey = const PageStorageKey('user_profile_scroll_position');
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
        buildWhen: (previous, current) => current is !ProfileSettingActionState,
        listener: (context, state){},
        builder: (context, state){
          switch(state.runtimeType){
            case ProfileSettingInitialState:
              return FutureBuilder(
                future: Future.delayed(Duration.zero),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  if (_savedPosition != null) {
                    _scrollController.animateTo(
                      _savedPosition!,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                  return SingleChildScrollView(
                    controller: _scrollController,
                    key: _storageKey,
                    padding: const EdgeInsets.fromLTRB(10, 23, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const UserInformation(),
                        const TagSearchCustom(textValue: 'マッチングしたい職種'),
                        SearchItem(listItem: _listJobUserWant),
                        const TagSearchCustom(textValue: 'マッチングしたいエリア'),
                        SearchItem(listItem: _listAreaToMatch),
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
                                child: SizedBox(
                                  width: (MediaQuery.of(context).size.width - 28) / 3,
                                  child: const Center(
                                    child: Text(
                                      '非公開にする',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff4C3CFF),
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
                                child: SizedBox(
                                  width: (MediaQuery.of(context).size.width - 28) / 3,
                                  child: const Center(
                                    child: Text(
                                      '下書き保存する\n（公開されません）',
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff494949),
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
                                onTap: (){
                                  profileSettingBloc.add(ClickToActiveProfileEvent());
                                },
                                child: SizedBox(
                                  width: (MediaQuery.of(context).size.width - 28) / 3,
                                  child: const Center(
                                    child: Text(
                                      '公開する',
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffDD4A30),
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
                },
              );
            case ClickToActiveProfileState:
              return const ActiveProfileSetting();
            default:
          }
          return const SizedBox();
        },
      ),
    );
  }
}
