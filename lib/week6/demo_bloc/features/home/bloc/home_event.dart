import 'package:code/week6/demo_bloc/features/home/models/product_model.dart';
import 'package:flutter/cupertino.dart';


@immutable
abstract class HomeEvent{}

class HomeInitialEvent extends HomeEvent{
}

class HomeProductWishlistButtonClickedEvent extends HomeEvent{
  final ProductDataModel clickedProduct;
  HomeProductWishlistButtonClickedEvent({
    required this.clickedProduct,
});

}

class HomeProductCardButtonClickedEvent extends HomeEvent{
  final ProductDataModel clickedProduct;
  HomeProductCardButtonClickedEvent({
    required this.clickedProduct
});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent{

}

class HomeCardButtonNavigateEvent extends HomeEvent{

}

