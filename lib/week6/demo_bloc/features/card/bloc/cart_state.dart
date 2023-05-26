import 'package:flutter/cupertino.dart';

import '../../home/models/product_model.dart';

@immutable
abstract class CartState{}

abstract class CartActionState extends CartState{}

class CartInitial extends CartState{}

class CartSuccessState extends CartState{
  final List<ProductDataModel> cartItems;
  CartSuccessState({
    required this.cartItems,
});
}

class CartProductItemWishListedActionState extends CartActionState{}

class CartProductItemRemoveFromCartState extends CartActionState{}
