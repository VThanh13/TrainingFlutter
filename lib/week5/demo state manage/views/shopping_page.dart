import 'package:code/week5/demo%20state%20manage/controllers/card_controller.dart';
import 'package:code/week5/demo%20state%20manage/controllers/shopping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget{
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cardController = Get.put(CardController());
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller){
                  return ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index){
                        return Card(
                          margin: const EdgeInsets.all(12),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                     Text(controller.products[index].productName,
                                        style: const TextStyle(fontSize: 24),
                                     ),
                                        Text(controller.products[index].productDescription),
                                      ],
                                    ),
                                    Text('\$${controller.products[index].price}',
                                    style: const TextStyle(
                                      fontSize: 24
                                    ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: (){
                                      cardController.addToCard(
                                        controller.products[index]
                                      );

                                    }, child: const Text('Add to card'),

                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
            GetX<CardController>(builder: (controller){
              return Text('Total amount: \$ ${controller.totalPrice}',
              style: const TextStyle(
                fontSize: 32,
                color: Colors.white
              ),);
            }),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){

          }, label: GetX<CardController>(builder: (controller){
            return Text(controller.count.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24
            ),
            );
      },
      ),
        backgroundColor: Colors.amber,
        icon: const Icon(Icons.add_shopping_cart_rounded,
        color: Colors.black,),
      ),
    );
  }
}