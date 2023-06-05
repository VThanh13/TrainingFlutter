import 'package:flutter/material.dart';

import '../../user_login/user_login_1/footer.dart';

class UserMessageScreen extends StatefulWidget {
  const UserMessageScreen({Key? key}) : super(key: key);

  @override
  State<UserMessageScreen> createState() => _UserMessageScreenState();
}

class _UserMessageScreenState extends State<UserMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: SizedBox(
                  height: 374,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          '2020.00.00',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: Color(0xff000000),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Column(
                              children: const [
                                SizedBox(
                                  height: 51,
                                  width: 54,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/biz_design/image_1.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  '田中  武彦',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff333333)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  height: 74,
                                  width: 275,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFFF8F3),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'はじめまして\nよろしくお願いいたします。',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Color(0xff000000)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Text(
                                  '17:35',
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 39,
                          width: 280,
                          margin: const EdgeInsets.only(top: 38),
                          color: const Color(0xffE3E3E3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                '名刺交換が取り消しされたためメッセージのやりとりはできません。',
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff6C6C6C),
                                ),
                              ),
                              Text(
                                '再度名刺交換をするとメッセージを再開することができます。',
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff6C6C6C),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 350,
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffF2F2F2),
                  border: Border.all(
                    color: const Color(0xffDD4A30),
                    width: 0.3,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        size: 25,
                        color: Color(0xff060606),
                      ),
                    ),
                    Container(
                      width: 250,
                      margin: const EdgeInsets.only(bottom: 7),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send_sharp,
                        size: 25,
                        color: Color(0xff212862),
                      ),
                    ),
                  ],
                ),
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
