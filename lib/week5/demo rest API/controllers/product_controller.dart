import 'package:code/week5/demo%20rest%20API/models/product.dart';
import 'package:code/week5/demo%20rest%20API/service/remote_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  List<Product> productList = [];
  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async{

    try{
      isLoading(true);
    var products = await RemoteService.fetchProducts();
    if(products != null){
      productList = products;
      print(productList.length);
    }
    }finally{
      isLoading(false);
    }
}}