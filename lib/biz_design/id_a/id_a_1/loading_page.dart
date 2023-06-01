import 'package:code/biz_design/id_a/id_a_3/login1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx) => const Login1()));
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
              width: double.maxFinite,
            ),
            const Positioned(
              left: 148,
              top: 0,
              child: Image(
                image: AssetImage('assets/images/biz_design/Ellipse_19.png'),
              ),),
            const Positioned(
              left: 0,
              top: 537,
              child: Image(
                image: AssetImage('assets/images/biz_design/Ellipse_18.png'),
              ),),
            Positioned(
              top: 352,
              left: 77,
              child: Container(
                height: 100,
                width: 236,
                padding: const EdgeInsets.only(bottom: 18),
                child: const FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Image(
                    image: AssetImage('assets/images/biz_design/n-Biz.png'),
                  ),
                ),
              ),),
            const Positioned(
              top: 312,
              left: 61,
              child: SizedBox(
                height: 10,
                width: 252,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text('ビジネスが加速するマッチングサービス',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700
                    ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}




