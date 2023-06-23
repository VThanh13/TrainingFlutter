import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home_week5.dart';
import '../controller/tab_controller.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    TabControllerR controller = Get.find();
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: double.maxFinite,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueAccent),
                      child: Center(
                        child: Text(
                          'Y: ${controller.y.value}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: double.maxFinite,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueAccent),
                      child: Center(
                        child: Text(
                          'X+Y: ${controller.z}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                )),
            GestureDetector(
              onTap: () {
                Get.to(() => const HomeWeek5());
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent),
                child: Center(
                  child: Text(
                    'X: ${controller.x}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.find<TabControllerR>().increaseY();
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
                    'Increase Y',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.find<TabControllerR>().totalXY();
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
                    'Total X+Y',
                    style: TextStyle(fontSize: 20),
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
