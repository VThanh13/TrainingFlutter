import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/register_bloc/register_screen_bloc.dart';
import '../../../core/blocs/register_bloc/register_screen_event.dart';
import '../../../core/blocs/register_bloc/register_screen_state.dart';
import '../../../core/common/custom_button.dart';
import '../../../router/app_router.gr.dart';
import 'widgets/list_image.dart';

@RoutePage()
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
            AutoRouter.of(context).push(const LoginRoute());
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case ExpScreenInitial:
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    const SizedBox(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image(
                          image: AssetImage(
                              'assets/images/biz_design/background.png'),
                        ),
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
                                  image: AssetImage(
                                      'assets/images/biz_design/n-Biz.png'),
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
                      padding: const EdgeInsets.only(top: 700, bottom: 50),
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
