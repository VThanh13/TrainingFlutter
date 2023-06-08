import 'package:code/biz_design/user_screen/user_name_card_screen/user_name_card_bloc/name_card_event.dart';
import 'package:code/biz_design/user_screen/user_name_card_screen/user_name_card_bloc/name_card_state.dart';
import 'package:code/biz_design/user_screen/user_name_card_screen/user_name_card_bloc/name_cart_bloc.dart';
import 'package:code/biz_design/user_screen/user_name_card_screen/user_name_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameCardMenuScreen extends StatefulWidget {
  const NameCardMenuScreen({Key? key}) : super(key: key);

  @override
  State<NameCardMenuScreen> createState() => _NameCardMenuScreenState();
}

class _NameCardMenuScreenState extends State<NameCardMenuScreen> {
  final NameCardBloc nameCardBloc = NameCardBloc();

  @override
  void initState() {
    nameCardBloc.add(ClickChangeNameCardEvent());
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
          case ClickChangeNameCardState:
            return Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 86,
                  ),
                  const Text(
                    '本機能は有料会員限定の機能です。',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffE56565),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      nameCardBloc.add(NameCardInitialEvent());
                    },
                    child: Container(
                      height: 37,
                      width: 242,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffDD4A30),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          '詳しくはお問い合わせください',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          case NameCardInitialState:
            return const UserNameCardScreen();
          default:
        }
        return const SizedBox();
      },
      listener: (context, state) {},
    );
  }
}
