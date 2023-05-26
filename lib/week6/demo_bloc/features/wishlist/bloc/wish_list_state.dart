
import 'package:flutter/cupertino.dart';

import '../../home/models/product_model.dart';

@immutable
abstract class WishListState{}

abstract class WishListActionState extends WishListState{}

class WishListInitial extends WishListState{}

class WishListSuccessState extends WishListState{
  final List<ProductDataModel> wishListItems;
  WishListSuccessState({
    required this.wishListItems,
});
}

class WishListProductItemCartedActionState extends WishListActionState{}

class WishListProductItemRemoveFromWishListState extends WishListActionState{}