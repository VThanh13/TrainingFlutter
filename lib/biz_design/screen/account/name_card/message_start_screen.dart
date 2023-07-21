import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/blocs/name_card_bloc/name_card_event.dart';
import '../../../core/blocs/name_card_bloc/name_card_state.dart';
import '../../../core/blocs/name_card_bloc/name_cart_bloc.dart';
import 'name_card_screen.dart';

class MessageStartScreen extends StatefulWidget {
  const MessageStartScreen({Key? key}) : super(key: key);

  @override
  State<MessageStartScreen> createState() => _MessageStartScreenState();
}

class _MessageStartScreenState extends State<MessageStartScreen> {
  final NameCardBloc nameCardBloc = NameCardBloc();

  @override
  void initState() {
    nameCardBloc.add(ClickSendNameCardEvent());
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
          case ClickSendNameCardState:
            return Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 86,
                    ),
                    Text(
                      '名刺交換リクエストが承諾されました。'
                      '\nメッセージを送信することができます。',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).textTheme.titleSmall!.color,
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
                            'メッセージを開始する',
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
