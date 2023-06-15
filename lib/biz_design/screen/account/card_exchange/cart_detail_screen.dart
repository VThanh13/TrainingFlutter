import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/card_exchange_bloc/card_exchange_bloc.dart';
import '../../../core/blocs/card_exchange_bloc/card_exchange_event.dart';
import '../../../core/blocs/card_exchange_bloc/card_exchange_state.dart';
import '../../../core/common/avatar_user.dart';
import '../../../core/common/custom_button.dart';
import '../../../models/card_exchange_model/card_exchange_model.dart';

class CardDetailScreen extends StatefulWidget {
  const CardDetailScreen({required this.cardDetail, Key? key})
      : super(key: key);
  final CardExchangeModel cardDetail;

  @override
  State<CardDetailScreen> createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends State<CardDetailScreen> {
  CardExchangeBloc cardExchangeBloc = CardExchangeBloc();

  @override
  void initState() {
    cardExchangeBloc.add(ClickToDetailCardEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  AvatarUser(
                    width: 54,
                    height: 54,
                    urlImage: widget.cardDetail.image,
                  ),
                  Text(
                    widget.cardDetail.name,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff060606),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width - 110,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.cardDetail.status == '名刺交換済み'
                        ? Container(
                            height: 15,
                            width: 78,
                            color: const Color(0xffE56565),
                            child: Center(
                              child: Text(
                                widget.cardDetail.status,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(height: 15),
                    const SizedBox(height: 15),
                    widget.cardDetail.status == '名刺交換済み'
                        ? CustomButton(
                            width: 82, height: 25, text: 'メッセージ', tab: () {})
                        : const SizedBox(
                            width: 82,
                            height: 15,
                          ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.cardDetail.status == '名刺交換申請中'
                            ? Container(
                                height: 12,
                                width: 70,
                                color: const Color(0xff4D4AD6),
                                child: Center(
                                  child: Text(
                                    widget.cardDetail.status,
                                    style: const TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(
                                height: 12,
                                width: 70,
                              ),
                        const Text(
                          '2020.00.00  17:35',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA3A3A3),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          BlocConsumer<CardExchangeBloc, CardExchangeState>(
              bloc: cardExchangeBloc,
              listenWhen: (previous, current) =>
                  current is CardExchangeActionState,
              buildWhen: (previous, current) =>
                  current is! CardExchangeActionState,
              builder: (context, state) {
                switch (state.runtimeType) {
                  case ClickToDetailCardState:
                    return Column(
                      children: [
                        const SizedBox(
                          height: 350,
                          width: double.maxFinite,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Image(
                              image: AssetImage(
                                  'assets/images/biz_design/image_13.png'),
                            ),
                          ),
                        ),
                        widget.cardDetail.status == '名刺交換申請中'
                            ? Column(
                                children: [
                                  const Text(
                                    '名刺交換申請がありました。\nあなたの名刺情報を送信すると、交換が完了し\nダイレクトメッセージの送信が可能になります。',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff333333),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomButton(
                                        width: 82,
                                        height: 25,
                                        size: 10,
                                        text: '交換しない',
                                        tab: () {},
                                      ),
                                      const SizedBox(width: 15),
                                      CustomButton(
                                        width: 82,
                                        height: 25,
                                        size: 10,
                                        text: '名刺交換する',
                                        tab: () {
                                          cardExchangeBloc.add(
                                              ClickToSendCardRequestEvent());
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 40),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    );
                  case ClickToSendCardRequestState:
                    return Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          '名刺交換リクエストを送信しました。\n相手の承認を待っています。',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff333333),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                            width: 82,
                            height: 25,
                            size: 10,
                            text: '送信取り消し',
                            tab: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoAlertDialog(
                                      title: const Text(
                                        '名刺交換リクエストを取り消します',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      content: const Text(
                                        '申請元の履歴からも削除されます。',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      actions: [
                                        Column(
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return CupertinoAlertDialog(
                                                        title: const Text(
                                                          '名刺交換を取り消ししました',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                              cardExchangeBloc.add(
                                                                  ClickToDetailCardEvent());
                                                            },
                                                            child: const Text(
                                                              '完了',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                    0xff0500FF),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              },
                                              child: const Text(
                                                '取り消す',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff001AFF),
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                '取り消さない',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff001AFF),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  });
                            }),
                      ],
                    );
                  default:
                }
                return const SizedBox();
              },
              listener: (context, state) {}),
        ],
      ),
    );
  }
}
