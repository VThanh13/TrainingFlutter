import 'package:code/biz_design/core/common/avatar_user.dart';
import 'package:code/biz_design/screen/account/card_exchange/search_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/blocs/card_exchange_bloc/card_exchange_bloc.dart';
import '../../../core/blocs/card_exchange_bloc/card_exchange_event.dart';
import '../../../core/blocs/card_exchange_bloc/card_exchange_state.dart';
import '../../../models/card_exchange_model/card_exchange_model.dart';
import 'cart_detail_screen.dart';

class CardExchangeScreen extends StatefulWidget {
  const CardExchangeScreen({Key? key}) : super(key: key);

  @override
  State<CardExchangeScreen> createState() => _CardExchangeScreenState();
}

class _CardExchangeScreenState extends State<CardExchangeScreen> {
  final CardExchangeBloc cardExchangeBloc = CardExchangeBloc();

  late CardExchangeModel cardDetail;

  @override
  void initState() {
    super.initState();
    cardExchangeBloc.add(CardExchangeInitialEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: BlocConsumer<CardExchangeBloc, CardExchangeState>(
        bloc: cardExchangeBloc,
        listenWhen: (previous, current) => current is CardExchangeActionState,
        buildWhen: (previous, current) => current is! CardExchangeActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CardLoadedSuccessState:
              final successState = state as CardLoadedSuccessState;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 48,
                      margin: const EdgeInsets.fromLTRB(15, 18, 15, 5),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffDD4A30),
                          width: 0.3,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: const Color(0xffF2F2F2),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              cardExchangeBloc.add(ClickToSearchCardEvent());
                            },
                            icon: const Icon(
                              Icons.search,
                              size: 25,
                              color: Color(0xff060606),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: const TextField(
                              decoration: InputDecoration(
                                  hintText: 'ユーザー名検索',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height - 400,
                      child: ListView.builder(
                          itemCount: successState.cards.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                cardDetail = successState.cards[index];
                                cardExchangeBloc.add(ClickToDetailCardEvent());
                              },
                              child: Container(
                                width: double.maxFinite,
                                padding:
                                    const EdgeInsets.fromLTRB(15, 10, 0, 10),
                                color: index % 2 != 0
                                    ? const Color(0xffFAFAFA)
                                    : const Color(0xffE5E5E5),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        AvatarUser(
                                            width: 54,
                                            height: 54,
                                            urlImage: successState
                                                .cards[index].image),
                                        Text(
                                          successState.cards[index].name,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff060606),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          110,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 78,
                                                height: 15,
                                                color: successState.cards[index]
                                                            .status ==
                                                        '名刺交換済み'
                                                    ? const Color(0xffE56565)
                                                    : const Color(0xff4D4AD6),
                                                child: Center(
                                                  child: Text(
                                                    successState
                                                        .cards[index].status,
                                                    style: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xffFFFFFF),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              successState.cards[index]
                                                          .status ==
                                                      '名刺交換済み'
                                                  ? const Icon(Icons.more_horiz)
                                                  : const SizedBox(),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          successState.cards[index]
                                                      .description ==
                                                  '相手の認証を待っています。'
                                              ? Text(
                                                  successState
                                                      .cards[index].description,
                                                  style: const TextStyle(
                                                    color: Color(0xff000000),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                  ),
                                                )
                                              : successState.cards[index]
                                                          .description ==
                                                      '申請がありました、内容を確認する >>'
                                                  ? RichText(
                                                      text: TextSpan(
                                                        text: successState
                                                            .cards[index]
                                                            .description,
                                                        style: const TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          color:
                                                              Color(0xff005BAC),
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    )
                                                  : const Text(''),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                '2020.00.00  17:35',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xffA3A3A3),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              );
            case ClickToDetailCardState:
              return CardDetailScreen(
                cardDetail: cardDetail,
              );
            case ClickToSearchCardState:
              return const SearchCardScreen();
            default:
          }
          return const SizedBox();
        },
      ),
    );
  }
}
