
import 'package:code/week6/demo_bloc/features/home/models/product_model.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class WishListEvent{

}

class WishListInitialEvent extends WishListEvent{}

class WishListRemoveFromWishListEvent extends WishListEvent{
  final ProductDataModel clickedProduct;
  WishListRemoveFromWishListEvent({
    required this.clickedProduct,
});
}

class WishListProductCartButtonClickedEvent extends WishListEvent{
  final ProductDataModel clickedProduct;
  WishListProductCartButtonClickedEvent({
    required this.clickedProduct
});

}

