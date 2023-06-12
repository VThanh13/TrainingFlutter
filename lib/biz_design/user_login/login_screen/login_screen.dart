import 'package:auto_route/auto_route.dart';
import 'package:code/biz_design/common/custom_button.dart';
import 'package:code/biz_design/router/app_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


@RoutePage()
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
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: double.maxFinite,
                child: const FittedBox(
                  fit: BoxFit.cover,
                  child: Image(
                    image: AssetImage(
                        'assets/images/biz_design/background.png'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(52, MediaQuery.of(context).size.height*0.4, 52, 0),
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
                        width: 272,
                        text: 'ログイン',
                        size: 14,
                        tab: () {
                          AutoRouter.of(context).push(const HomeRoute());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
