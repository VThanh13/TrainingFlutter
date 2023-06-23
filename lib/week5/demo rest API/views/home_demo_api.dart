import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class HomeDemoAPI extends StatelessWidget {
  const HomeDemoAPI({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'ShopX',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w500),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.view_list_rounded)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.grid_view))
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (productController.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return const SizedBox();
                    //    return StaggeredGridView.countBuilder(
                    // // shrinkWrap: true,
                    //      crossAxisCount: 2,
                    //      itemCount: productController.productList.length,
                    //      crossAxisSpacing: 16,
                    //      mainAxisSpacing: 16,
                    //      itemBuilder: (context, index){
                    //        //return ProductTile(productController.productList[index]);
                    //        return ProductTile(productController.productList[index]);
                    //      },
                    //  staggeredTileBuilder: (int index) {
                    //  return const StaggeredTile.fit(1);
                    //  },);
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
