import 'package:code/week5/demo%20state%20manage/models/product.dart';
import 'package:get/get.dart';

class CardController extends GetxController{
  var cardItems = <Product>[].obs;
  int get count => cardItems.length;
  double  get totalPrice => cardItems.fold(0, (sum, item) => sum + item.price);

  addToCard(Product product){
    cardItems.add(product);
  }
}