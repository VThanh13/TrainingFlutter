import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../user_login_2/exp_screen.dart';
import '../user_login_4/login2.dart';
import 'bloc/login1.bloc.dart';
import 'bloc/login1_event.dart';
import 'bloc/login1_state.dart';

class Login1 extends StatefulWidget {
  const Login1({Key? key}) : super(key: key);

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Login2()));
          } else if (state is Login1NavigateExpScreenState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ExpScreen()));
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
                    ),
                    const Positioned(
                      left: 148,
                      top: 0,
                      child: Image(
                        image: AssetImage(
                            'assets/images/biz_design/Ellipse_19.png'),
                      ),
                    ),
                    const Positioned(
                      left: 0,
                      top: 537,
                      child: Image(
                        image: AssetImage(
                            'assets/images/biz_design/Ellipse_18.png'),
                      ),
                    ),
                    const Positioned(
                      top: 282,
                      left: 80,
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
                    Positioned(
                      top: 315,
                      left: 110,
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
                    Positioned(
                      left: 60,
                      top: 458,
                      child: SizedBox(
                        height: 38,
                        width: 272,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffFF3C3C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          onPressed: () {
                            login1Bloc.add(Login1NavigateExpScreenEvent());
                          },
                          child: const Text(
                            '無料アカウントを作成',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 60,
                      top: 517,
                      child: SizedBox(
                        height: 38,
                        width: 272,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffFF3C3C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          onPressed: () {
                            login1Bloc.add(Login1NavigateLogin2Event());
                          },
                          child: const Text(
                            'アカウントをお持ちの方はこちら',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
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
