import 'package:code/biz_design/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login_screen/login_screen.dart';
import '../register_screen/register_screen.dart';
import 'bloc/login_or_register.bloc.dart';
import 'bloc/login_or_register_event.dart';
import 'bloc/login_or_register_state.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({Key? key}) : super(key: key);

  @override
  State<LoginOrRegister> createState() => _Login1State();
}

class _Login1State extends State<LoginOrRegister> {
  final Login1Bloc login1Bloc = Login1Bloc();

  @override
  void initState() {
    login1Bloc.add(Login1InitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: BlocConsumer<Login1Bloc, Login1State>(
        bloc: login1Bloc,
        listenWhen: (previous, current) => current is Login1ActionState,
        buildWhen: (previous, current) => current is! Login1ActionState,
        listener: (context, state) {
          if (state is Login1NavigateLogin2State) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          } else if (state is Login1NavigateExpScreenState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case Login1Initial:
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: double.maxFinite,
                      child: const Image(
                        image: AssetImage(
                            'assets/images/biz_design/background.png'),
                      ),
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 282),
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
                          padding: const EdgeInsets.only(top: 17),
                          child: Center(
                            child: Container(
                              height: 80,
                              width: 189,
                              padding: const EdgeInsets.only(bottom: 18),
                              child: const FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/biz_design/n-Biz.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 63),
                          child: Center(
                            child: CustomButton(
                              height: 38,
                              width: 272,
                              text: '無料アカウントを作成',
                              size: 14,
                              tab: () {
                                login1Bloc.add(Login1NavigateExpScreenEvent());
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 21),
                          child: Center(
                            child: CustomButton(
                              height: 38,
                              width: 272,
                              text: 'アカウントをお持ちの方はこちら',
                              size: 14,
                              tab: () {
                                login1Bloc.add(Login1NavigateLogin2Event());
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
