import 'package:code/biz_design/common/avatar_user.dart';
import 'package:code/biz_design/user_screen/user_message_screen/user_message_bloc/user_message_bloc.dart';
import 'package:code/biz_design/user_screen/user_message_screen/user_message_bloc/user_message_event.dart';
import 'package:code/biz_design/user_screen/user_message_screen/user_message_bloc/user_message_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserMessageScreen extends StatefulWidget {
  const UserMessageScreen({Key? key}) : super(key: key);

  @override
  State<UserMessageScreen> createState() => _UserMessageScreenState();
}

class _UserMessageScreenState extends State<UserMessageScreen> {
  final UserMessageBloc userMessageBloc = UserMessageBloc();

  @override
  void initState() {
    userMessageBloc.add(UserMessageInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: SingleChildScrollView(
        child: Center(
          child: BlocConsumer<UserMessageBloc, UserMessageState>(
            bloc: userMessageBloc,
            listenWhen: (previous, current) =>
                current is UserMessageActionState,
            buildWhen: (previous, current) =>
                current is! UserMessageActionState,
            listener: (context, state) {},
            builder: (context, state) {
              switch (state.runtimeType) {
                case UserMessageInitialState:
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          height: 385,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const Text(
                                  '2020.00.00',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    const Column(
                                      children: [
                                        AvatarUser(
                                          width: 54,
                                          height: 51,
                                          urlImage:
                                              'assets/images/biz_design/image_1.png',
                                        ),
                                        Text(
                                          '田中  武彦',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff333333),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 74,
                                          width: 275,
                                          decoration: const BoxDecoration(
                                            color: Color(0xffFFF8F3),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Text(
                                                  'はじめまして\nよろしくお願いいたします。',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Text(
                                          '17:35',
                                          style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 8,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 39,
                                  width: 280,
                                  margin: const EdgeInsets.only(top: 38),
                                  color: const Color(0xffE3E3E3),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '名刺交換が取り消しされたためメッセージのやりとりはできません。',
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff6C6C6C),
                                        ),
                                      ),
                                      Text(
                                        '再度名刺交換をするとメッセージを再開することができます。',
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff6C6C6C),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 46,
                        width: double.maxFinite,
                        margin: const EdgeInsets.fromLTRB(12, 10, 12, 20),
                        // padding: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffF2F2F2),
                          border: Border.all(
                            color: const Color(0xffDD4A30),
                            width: 0.3,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.camera_alt_outlined,
                                size: 25,
                                color: Color(0xff060606),
                              ),
                            ),
                            const SizedBox(
                              width: 250,
                              child: TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                userMessageBloc
                                    .add(CheckNameCardIsAcceptEvent());
                              },
                              icon: const Icon(
                                Icons.send_sharp,
                                size: 23,
                                color: Color(0xff212862),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                case CheckNameCardIsAcceptState:
                  return const Padding(
                    padding: EdgeInsets.only(top: 56),
                    child: Text(
                      '名刺交換リクエストが承諾されていません。'
                      '\nリクエスト承諾後にメッセージを送信することができます。',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffE56565),
                      ),
                    ),
                  );
                default:
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
