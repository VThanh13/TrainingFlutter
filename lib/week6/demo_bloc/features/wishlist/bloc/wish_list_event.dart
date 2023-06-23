import 'package:flutter/cupertino.dart';

import '../../home/models/product_model.dart';

@immutable
abstract class WishListEvent {}

class WishListInitialEvent extends WishListEvent {}

class WishListRemoveFromWishListEvent extends WishListEvent {
  final ProductDataModel clickedProduct;
  WishListRemoveFromWishListEvent({
    required this.clickedProduct,
  });
}

class WishListProductCartButtonClickedEvent extends WishListEvent {
  final ProductDataModel clickedProduct;
  WishListProductCartButtonClickedEvent({required this.clickedProduct});
}
