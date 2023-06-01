import 'package:code/biz_design/id_b/id_b_1/top_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login2 extends StatefulWidget {
  const Login2({Key? key}) : super(key: key);

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
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
                margin: const EdgeInsets.fromLTRB(52, 92, 52, 0 ),
                child: Center(
                  child: Column(
                    children: [
                      const TextField(
                        cursorColor: Color(0xffDD4A30),
                        decoration: InputDecoration(
                            hintText: 'メールアドレス',
                          icon: Icon(Icons.mail_outline,
                          color: Color(0xffDD4A30),),
                         border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffBBBBBB),
                          )
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
                            icon: Icon(CupertinoIcons.lock,
                              color: Color(0xffDD4A30),),
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffBBBBBB),
                            )
                        ),
                      ),
                      const Divider(
                        height: 0,
                        color: Color(0xffDD4A30),
                        indent: 0,
                        thickness: 1,
                      ),
                      const SizedBox(height: 40,),
                      SizedBox(
                        height: 38,
                        width: 272,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffFF3C3C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          onPressed: (){
                            navigateToTopScreen();
                          },
                          child: const Text('ログイン',style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700
                          ),),
                        ),
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
  void navigateToTopScreen(){
    final route = MaterialPageRoute(builder: (context) => const TopScreen());
    Navigator.push(context, route);
  }
}
