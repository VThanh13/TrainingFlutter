import 'package:code/biz_design/user_login/user_login_2/exp_screen_list_image.dart';
import 'package:code/biz_design/user_login/user_login_2/exp_screen_logo.dart';
import 'package:code/biz_design/user_login/user_login_2/row_2_button.dart';
import 'package:code/biz_design/user_login/user_login_2/text_to_login_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../user_login_4/login2.dart';
import 'bloc/exp_screen_bloc.dart';
import 'bloc/exp_screen_event.dart';
import 'bloc/exp_screen_state.dart';

class ExpScreen extends StatefulWidget {
  const ExpScreen({Key? key}) : super(key: key);

  @override
  State<ExpScreen> createState() => _ExpScreenState();
}

class _ExpScreenState extends State<ExpScreen> {
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
                builder: (context) => const Login2(),
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
                    const ExpScreenLogo(),
                    const ExpScreenListImage(),
                    const Row2Button(),
                    const TextToLogin2(),
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
