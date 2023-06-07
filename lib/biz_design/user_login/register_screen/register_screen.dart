import 'package:code/biz_design/common/custom_button.dart';
import 'package:code/biz_design/user_login/register_screen/register_screen_list_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login_screen/login_screen.dart';
import 'bloc/register_screen_bloc.dart';
import 'bloc/register_screen_event.dart';
import 'bloc/register_screen_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ExpScreenBloc expScreenBloc = ExpScreenBloc();

  @override
  void initState() {
    expScreenBloc.add(ExpScreenInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: BlocConsumer<ExpScreenBloc, ExpScreenState>(
        bloc: expScreenBloc,
        listenWhen: (previous, current) => current is ExpScreenActionState,
        buildWhen: (previous, current) => current is! ExpScreenActionState,
        listener: (context, state) {
          if (state is ExpScreenNavigateLogin2State) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case ExpScreenInitial:
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: double.maxFinite,
                      child: const Image(
                        image: AssetImage('assets/images/biz_design/background.png'),
                      ),
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 126),
                          child: Center(
                            child: SizedBox(
                              height: 10,
                              width: 252,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'ビジネスが加速するマッチングサービス',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Center(
                            child: Container(
                              height: 80,
                              width: 189,
                              padding: const EdgeInsets.only(bottom: 18),
                              child: const FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Image(
                                  image: AssetImage('assets/images/biz_design/n-Biz.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const RegisterScreenListImage(),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 641, left: 44, right: 37),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            text: '名刺交換する',
                            width: 92,
                            height: 25,
                            tab: () {},
                            size: 10,
                          ),
                          CustomButton(
                            text: 'お問い合わせページへ',
                            width: 169,
                            height: 32,
                            tab: () {},
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 700,
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            expScreenBloc.add(
                              ExpScreenNavigateLogin2Event(),
                            );
                          },
                          child: const Text(
                            'ログイン',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            default:
          }
          return const SizedBox();
        },
      ),
    );
  }
}

