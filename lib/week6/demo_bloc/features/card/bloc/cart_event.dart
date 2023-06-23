import 'package:flutter/cupertino.dart';

import '../../home/models/product_model.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final ProductDataModel clickedProduct;
  CartRemoveFromCartEvent({
    required this.clickedProduct,
  });
}

class CartProductWishListButtonClickedEvent extends CartEvent {
  final ProductDataModel clickedProduct;
  CartProductWishListButtonClickedEvent({
    required this.clickedProduct,
  });
}
