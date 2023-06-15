import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/blocs/card_exchange_bloc/card_exchange_bloc.dart';
import '../../../core/blocs/card_exchange_bloc/card_exchange_event.dart';
import '../../../core/blocs/card_exchange_bloc/card_exchange_state.dart';
import '../../../core/common/avatar_user.dart';
import 'card_exchange_screen.dart';

class SearchCardScreen extends StatefulWidget {
  const SearchCardScreen({Key? key}) : super(key: key);

  @override
  State<SearchCardScreen> createState() => _SearchCardScreenState();
}

class _SearchCardScreenState extends State<SearchCardScreen> {
  CardExchangeBloc cardExchangeBloc = CardExchangeBloc();

  @override
  void initState() {
    cardExchangeBloc.add(ClickToSearchCardEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CardExchangeBloc, CardExchangeState>(
        bloc: cardExchangeBloc,
        listenWhen: (previous, current) => current is CardExchangeActionState,
        buildWhen: (previous, current) => current is! CardExchangeActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case ClickToSearchCardState:
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width * 0.7,
                          margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                          decoration: const BoxDecoration(
                            color: Color(0xffF0F0F0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.search,
                              ),
                              Text(
                                'あいうえお',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            cardExchangeBloc.add(CardExchangeInitialEvent());
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'キャンセル',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Color(0xff035FCB),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 18,
                      color: const Color(0xffC4C4C4),
                      margin: const EdgeInsets.only(top: 9),
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                        'ユーザー',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height - 380,
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 70,
                              color: index % 2 != 0
                                  ? const Color(0xffF4F4F4)
                                  : Colors.white,
                              child: const Row(
                                children: [
                                  SizedBox(
                                    width: 18,
                                  ),
                                  AvatarUser(
                                      width: 54,
                                      height: 54,
                                      urlImage:
                                          'assets/images/biz_design/image_14.png',),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      '吉岡 みほ',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              );
            case CardLoadedSuccessState:
              return const CardExchangeScreen();
            default:
          }
          return const SizedBox();
        },
        listener: (context, state) {});
  }
}
