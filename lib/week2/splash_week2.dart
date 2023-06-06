import 'package:code/week2/login_week2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashWeek2 extends StatefulWidget{
  const SplashWeek2({super.key});

  @override
  State<SplashWeek2> createState() => _SplashWeek2State();

}

class _SplashWeek2State extends State<SplashWeek2>{
  @override
  void initState() {
    super.initState();
    
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (ctx) => const LoginWeek2(),),);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 8),
          ),
          Stack(
            children: <Widget>[
              const SizedBox(
                width: double.infinity,
                height: 550,
              ),
              const SizedBox(
                width: double.infinity,
                height: 450,
                child: ClipRRect(
                  child: Image(
                    image: AssetImage('assets/images/week2/Vector.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              const Positioned(
                left: 133,
                top: 90.0,
                child: SizedBox(
                  height: 70.0,
                  width: 148.0,
                  child: ClipRRect(
                    child: Image(
                      image: AssetImage('assets/images/week2/bookYourRide.png'),
                    ),
                  ),
                ),
              ),
              Positioned(
                //left: 88.25,
                right: 50,
                top: 234.0,
                child: Container(
                  //color: Colors.pink,
                  padding: const EdgeInsets.only(top: 13),
                  height: 278.0,
                  width: 240.0,
                    child: const ClipRRect(
                      child: Image(
                        image: AssetImage('assets/images/week2/car.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}