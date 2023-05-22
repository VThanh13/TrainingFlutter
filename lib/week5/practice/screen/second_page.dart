import 'package:code/week5/practice/screen/third_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget{
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Get.to(() => const ThirdPage());
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent
                ),
                child: const Center(
                  child: Text('Go to third page',
                    style: TextStyle(
                        fontSize: 20
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