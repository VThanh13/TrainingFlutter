import 'package:code/week5/demo%20state%20manage/models/product.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController{
  var products = <Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async{
    await Future.delayed(const Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          productName: 'FirstProd',
          productImage: 'abd',
          productDescription: 'some description about product',
          price: 30),
      Product(
          id: 2,
          productName: 'SecProd',
          productImage: 'abd',
          productDescription: 'some description about product',
          price: 40),
      Product(
          id: 3,
          productName: 'ThirdProd',
          productImage: 'abd',
          productDescription: 'some description about product',
          price: 50),
    ];
    products.value = productResult;

  }
}