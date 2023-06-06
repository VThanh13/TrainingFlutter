import 'package:code/biz_design/common/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../user_home/user_home_1/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 148),
                child: const Image(
                  image: AssetImage('assets/images/biz_design/Ellipse_19.png'),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(52, 92, 52, 0),
                child: Center(
                  child: Column(
                    children: [
                      const TextField(
                        cursorColor: Color(0xffDD4A30),
                        decoration: InputDecoration(
                          hintText: 'メールアドレス',
                          icon: Icon(
                            Icons.mail_outline,
                            color: Color(0xffDD4A30),
                          ),
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffBBBBBB),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        color: Color(0xffDD4A30),
                        indent: 0,
                        thickness: 1,
                      ),
                      const TextField(
                        cursorColor: Color(0xffDD4A30),
                        decoration: InputDecoration(
                          hintText: 'パスワード',
                          icon: Icon(
                            CupertinoIcons.lock,
                            color: Color(0xffDD4A30),
                          ),
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffBBBBBB),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        color: Color(0xffDD4A30),
                        indent: 0,
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                        height: 38,
                        width: 272,
                        text: 'ログイン',
                        size: 14,
                        tab: () {
                          navigateToTopScreen();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 41, right: 165),
                child: const Image(
                  image: AssetImage('assets/images/biz_design/Ellipse_18.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToTopScreen() {
    final route = MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    );
    Navigator.push(context, route);
  }
}
