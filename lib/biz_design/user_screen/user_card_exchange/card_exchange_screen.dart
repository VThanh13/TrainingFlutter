import 'package:code/biz_design/common/avatar_user.dart';
import 'package:code/biz_design/user_screen/user_card_exchange/card_exchange_bloc/card_exchange_bloc.dart';
import 'package:code/biz_design/user_screen/user_card_exchange/card_exchange_bloc/card_exchange_event.dart';
import 'package:code/biz_design/user_screen/user_card_exchange/card_exchange_bloc/card_exchange_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardExchangeScreen extends StatefulWidget {
  const CardExchangeScreen({Key? key}) : super(key: key);

  @override
  State<CardExchangeScreen> createState() => _CardExchangeScreenState();
}

class _CardExchangeScreenState extends State<CardExchangeScreen> {
  final CardExchangeBloc cardExchangeBloc = CardExchangeBloc();

  @override
  void initState() {
    super.initState();
    cardExchangeBloc.add(CardExchangeInitialEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Map<String, String>> cardData = [
    {
      'image': 'assets/images/biz_design/image_1.png',
      'name': '高橋 恵',
      'status': '名刺交換済み',
      'description': ' ',
    },
    {
      'image': 'assets/images/biz_design/image_11.png',
      'name': '佐藤 秀雄',
      'status': '名刺交換申請中',
      'description': '相手の認証を待っています。',
    },
    {
      'image': 'assets/images/biz_design/image_14.png',
      'name': '吉岡 みほ',
      'status': '名刺交換済み',
      'description': ' ',
    },
    {
      'image': 'assets/images/biz_design/image_15.png',
      'name': '杉本 太郎',
      'status': '名刺交換申請中',
      'description': '申請がありました、内容を確認する >>',
    },
  ];
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
            case CardExchangeInitialState:
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
                            onPressed: () {},
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
                      height: MediaQuery.of(context).size.height - 420,
                      child: ListView.builder(
                          itemCount: cardData.length,
                          itemBuilder: (context, index) {
                            Map<String, String> item = cardData[index];
                            return Container(
                              width: double.maxFinite,
                              padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
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
                                          urlImage: item['image']!),
                                      Text(
                                        item['name']!,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff060606),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 15,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width - 110,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 78,
                                              height: 15,
                                              color: item['status']! == '名刺交換済み'
                                                  ? const Color(0xffE56565)
                                                  : const Color(0xff4D4AD6),
                                              child: Center(
                                                child: Text(
                                                  item['status']!,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xffFFFFFF),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            item['status']! == '名刺交換済み'?
                                            const Icon(Icons.more_horiz): const SizedBox(),
                                          ],
                                        ),
                                        const SizedBox(height: 10,),
                                        item['description']! == '相手の認証を待っています。'
                                            ? Text(
                                                item['description']!,
                                                style: const TextStyle(
                                                  color: Color(0xff000000),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                ),
                                              )
                                            : item['description']! ==
                                                    '申請がありました、内容を確認する >>'
                                                ? RichText(
                                                    text: TextSpan(
                                                      text: item['description']!,
                                                      style: const TextStyle(
                                                        decoration: TextDecoration
                                                            .underline,
                                                        color: Color(0xff005BAC),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  )
                                                : const Text(''),
                                        const SizedBox(height: 5,),
                                        const Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text('2020.00.00  17:35',style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xffA3A3A3),
                                            ),)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
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

class CardData {
  static List<Map<String, String>> cardData = [
    {
      'image': 'assets/images/biz_design/bloc_image_1.png',
      'name': '高橋 恵',
      'status': '名刺交換済み',
      'description': ' ',
    },
    {
      'image': 'assets/images/biz_design/bloc_image_13.png',
      'name': '佐藤 秀雄',
      'status': '名刺交換申請中',
      'description': '相手の認証を待っています。',
    },
    {
      'image': 'assets/images/biz_design/bloc_image_14.png',
      'name': '吉岡 みほ',
      'status': '名刺交換済み',
      'description': ' ',
    },
    {
      'image': 'assets/images/biz_design/bloc_image_15.png',
      'name': '杉本 太郎',
      'status': '名刺交換申請中',
      'description': '申請がありました、内容を確認する >>',
    },
  ];
}
