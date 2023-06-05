import 'package:code/biz_design/user_screen/user_screen_2/user_name_card_material/send_card_button.dart';
import 'package:flutter/material.dart';

import '../../user_home/user_home_1/material_top/button3.dart';
import '../../user_login/user_login_1/footer.dart';

class UserNameCardScreen extends StatefulWidget {
  const UserNameCardScreen({Key? key}) : super(key: key);

  @override
  State<UserNameCardScreen> createState() => _UserNameCardScreenState();
}

class _UserNameCardScreenState extends State<UserNameCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 449,
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'あなたの名刺情報を送信します。',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff333333),
                      ),
                    ),
                  ),
                  const Image(
                    image: AssetImage(
                        'assets/images/biz_design/image_13.png'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 240),
                    child: Button3(),
                  ),
                  Padding(padding: const EdgeInsets.only(top: 16),
                    child: SizedBox(
                      height: 98,
                      width: 333,
                      child: Column(
                        children: [
                          const Text('あなたの名刺情報送信後、相手があなたのリクエストを認証するまで、相手の名刺情報を閲覧することはできません。\n'
                              '\n相手があなたの名刺交換リクエストを承諾すると、マイページから相手の名刺を確認することができます。\n',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Colors.grey
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(text: const TextSpan(text: 'プライバシーポリシー',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff0267FF),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),),),
                              const Text('、', style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.grey
                              ),),
                              RichText(text: const TextSpan(text: '利用規約',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff0267FF),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),),),
                              const Text('を確認のうえ送信してください。',style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.grey
                              ),),
                            ],
                          ),
                        ],
                      ),
                    ),),
                  const SendCardButton(),
                  const SizedBox(height: 70,),
                ],
              ),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
