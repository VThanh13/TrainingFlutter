import 'package:code/week6/demo_bloc/features/home/models/product_model.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CartEvent{

}

class CartInitialEvent extends CartEvent{}

class CartRemoveFromCartEvent extends CartEvent{
  final ProductDataModel clickedProduct;
  CartRemoveFromCartEvent({
    required this.clickedProduct,
});
}

class CartProductWishListButtonClickedEvent extends CartEvent{
  final ProductDataModel clickedProduct;
  CartProductWishListButtonClickedEvent({
    required this.clickedProduct,
});
}

