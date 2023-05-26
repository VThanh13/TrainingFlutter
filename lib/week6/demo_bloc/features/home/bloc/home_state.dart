import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState{}

class HomeInitial extends HomeState{}

class HomeLoadingState extends HomeState{}

class HomeLoadedSuccessState extends HomeState{
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({
    required this.products,
});
}

class HomeErrorState extends HomeState{}

class HomeNavigateToWishlistPageActionState extends HomeActionState{}

class HomeNavigateToCardPageActionState extends HomeActionState{}

class HomeProductItemWishListedActionState extends HomeActionState{}

class HomeProductItemCartedActionState extends HomeActionState{}

