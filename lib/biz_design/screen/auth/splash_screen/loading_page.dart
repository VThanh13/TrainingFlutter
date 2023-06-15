import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../router/app_router.gr.dart';

@RoutePage()
class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      AutoRouter.of(context).push(const LoginOrRegister());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const FittedBox(
                fit: BoxFit.cover,
                child: Image(
                  image: AssetImage(
                      'assets/images/biz_design/background.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4),
              child: const Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 10,
                      width: 252,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'ビジネスが加速するマッチングサービス',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: SizedBox(
                      height: 100,
                      width: 236,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Image(
                          image: AssetImage('assets/images/biz_design/n-Biz.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
