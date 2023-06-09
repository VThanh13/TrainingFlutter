import 'package:auto_route/auto_route.dart';
import 'package:code/biz_design/common/custom_button.dart';
import 'package:code/biz_design/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_or_register.bloc.dart';
import 'bloc/login_or_register_event.dart';
import 'bloc/login_or_register_state.dart';

@RoutePage()
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
            AutoRouter.of(context).push(const LoginRoute());
          } else if (state is Login1NavigateExpScreenState) {
            AutoRouter.of(context).push(const RegisterRoute());
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
                      child: const FittedBox(
                        fit: BoxFit.cover,
                        child: Image(
                          image: AssetImage(
                              'assets/images/biz_design/background.png'),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),
                          child: const Center(
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
