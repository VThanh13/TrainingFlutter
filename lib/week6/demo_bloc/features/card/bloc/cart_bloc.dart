import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:code/week6/demo_bloc/data/wishlist_items.dart';
import 'package:code/week6/demo_bloc/features/card/bloc/cart_event.dart';

import '../../../data/cart_items.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState>{
  CartBloc() :super(CartInitial()){
    on<CartInitialEvent>(cartInitialEvent);
    on<CartProductWishListButtonClickedEvent>(cartProductWishListButtonClickedEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);

  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartProductWishListButtonClickedEvent(
      CartProductWishListButtonClickedEvent event, Emitter<CartState> emit) {
    wishlistItems.add(event.clickedProduct);
    emit(CartProductItemWishListedActionState());
  }

  FutureOr<void> cartRemoveFromCartEvent(CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.clickedProduct);
    emit(CartProductItemRemoveFromCartState());
  }
}