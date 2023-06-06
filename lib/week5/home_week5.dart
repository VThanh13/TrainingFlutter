import 'package:code/week5/practice/controller/tab_controller.dart';
import 'package:code/week5/practice/screen/first_page.dart';
import 'package:code/week5/practice/screen/second_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWeek5 extends StatefulWidget {
  const HomeWeek5({super.key});

  @override
  State<HomeWeek5> createState() => _HomeWeek5State();
}

class _HomeWeek5State extends State<HomeWeek5> {
  TabControllerR controller = Get.put(TabControllerR());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<TabControllerR>(builder: (tabController) {
              return Container(
                margin: const EdgeInsets.all(20),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent),
                child: Center(
                  child: Text(
                    tabController.x.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              );
            }),
            GestureDetector(
              onTap: () {
                controller.increaseX();
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent),
                child: const Center(
                  child: Text(
                    'Tab',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const FirstPage());
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent),
                child: const Center(
                  child: Text(
                    'Go to first page',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const SecondPage());
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent),
                child: const Center(
                  child: Text(
                    'Go to second page',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                margin: const EdgeInsets.all(20),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueAccent,
                ),
                child: const Center(
                  child: Text(
                    'Tab',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
