import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../data/cart_items.dart';
import '../../../data/wishlist_items.dart';
import 'wish_list_event.dart';
import 'wish_list_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  WishListBloc() : super(WishListInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
    on<WishListProductCartButtonClickedEvent>(
        wishListProductCartButtonClickedEvent);
    on<WishListRemoveFromWishListEvent>(wishListRemoveFromWishListEvent);
  }

  FutureOr<void> wishListInitialEvent(
      WishListInitialEvent event, Emitter<WishListState> emit) {
    emit(WishListSuccessState(wishListItems: wishlistItems));
  }

  FutureOr<void> wishListProductCartButtonClickedEvent(
      WishListProductCartButtonClickedEvent event,
      Emitter<WishListState> emit) {
    cartItems.add(event.clickedProduct);
    emit(WishListProductItemCartedActionState());
  }

  FutureOr<void> wishListRemoveFromWishListEvent(
      WishListRemoveFromWishListEvent event, Emitter<WishListState> emit) {
    wishlistItems.remove(event.clickedProduct);
    emit(WishListProductItemRemoveFromWishListState());
  }
}
