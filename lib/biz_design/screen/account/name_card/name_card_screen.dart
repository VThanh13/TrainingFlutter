import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/name_card_bloc/name_card_event.dart';
import '../../../core/blocs/name_card_bloc/name_card_state.dart';
import '../../../core/blocs/name_card_bloc/name_cart_bloc.dart';
import '../../../core/common/custom_button.dart';
import 'message_start_screen.dart';
import 'name_card_menu_screen.dart';

class UserNameCardScreen extends StatefulWidget {
  const UserNameCardScreen({Key? key}) : super(key: key);

  @override
  State<UserNameCardScreen> createState() => _UserNameCardScreenState();
}

class _UserNameCardScreenState extends State<UserNameCardScreen> {
  final NameCardBloc nameCardBloc = NameCardBloc();

  @override
  void initState() {
    nameCardBloc.add(NameCardInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NameCardBloc, NameCardState>(
      bloc: nameCardBloc,
      listenWhen: (previous, current) => current is NameCardActionState,
      buildWhen: (previous, current) => current is! NameCardActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case NameCardInitialState:
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.6,
                      width: double.maxFinite,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                'あなたの名刺情報を送信します。',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff333333),
                                ),
                              ),
                            ),
                            const Image(
                              image: AssetImage(
                                  'assets/images/biz_design/image_13.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 240),
                              child: CustomButton(
                                height: 25,
                                width: 114,
                                text: '一覧をみる',
                                tab: () {
                                  nameCardBloc.add(ClickChangeNameCardEvent());
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: SizedBox(
                                height: 98,
                                width: 333,
                                child: Column(
                                  children: [
                                    const Text(
                                      'あなたの名刺情報送信後、相手があなたのリクエストを認証するまで、相手の名刺情報を閲覧することはできません。\n'
                                      '\n相手があなたの名刺交換リクエストを承諾すると、マイページから相手の名刺を確認することができます。\n',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        RichText(
                                          text: const TextSpan(
                                            text: 'プライバシーポリシー',
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Color(0xff0267FF),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          '、',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        RichText(
                                          text: const TextSpan(
                                            text: '利用規約',
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Color(0xff0267FF),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          'を確認のうえ送信してください。',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 28,
                            ),
                            CustomButton(
                              text: '名刺交換リクエストを送信',
                              size: 14,
                              tab: () {
                                nameCardBloc.add(ClickSendNameCardEvent());
                              },
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          case ClickChangeNameCardState:
            return const NameCardMenuScreen();
          case ClickSendNameCardState:
            return const MessageStartScreen();
          default:
        }
        return const SizedBox();
      },
      listener: (context, state) {},
    );
  }
}
