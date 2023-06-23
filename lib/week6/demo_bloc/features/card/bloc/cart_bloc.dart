import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../data/cart_items.dart';
import '../../../data/wishlist_items.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartProductWishListButtonClickedEvent>(
        cartProductWishListButtonClickedEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartProductWishListButtonClickedEvent(
      CartProductWishListButtonClickedEvent event, Emitter<CartState> emit) {
    wishlistItems.add(event.clickedProduct);
    emit(CartProductItemWishListedActionState());
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.clickedProduct);
    emit(CartProductItemRemoveFromCartState());
  }
}
