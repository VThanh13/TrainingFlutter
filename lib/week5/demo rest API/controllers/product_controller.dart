import 'package:get/get.dart';

import '../models/product.dart';
import '../service/remote_service.dart';

class ProductController extends GetxController {
  List<Product> productList = [];
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteService.fetchProducts();
      productList = products;
    } finally {
      isLoading(false);
    }
  }
}
