import 'package:code/week6/demo_bloc/data/cart_items.dart';
import 'package:code/week6/demo_bloc/features/card/bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import 'cart_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('card'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is !CartActionState,
        listener: (context, state){
          if(state is CartProductItemWishListedActionState){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Add to wish list success!'))
            );
          } else if (state is CartProductItemRemoveFromCartState){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Delete item success!'))
            );
          }
        },
        builder: (context, state){
          switch(state.runtimeType){
            case CartSuccessState:
              final successState = state as CartSuccessState;
              if(cartItems.isEmpty){
                return const Center(
                  child: Text('No item in cart!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                );
              }else{
                return Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 50,
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          const Text('Total items:',style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),),
                          const SizedBox(width: 5,),
                          Text(cartItems.length.toString(),style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                    ),

                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: successState.cartItems.length,
                          itemBuilder: (context, index){
                            return CartTileWidget(
                              cartBloc: cartBloc,
                              productDataModel: successState.cartItems[index],
                            );
                          }),
                    ),

                  ],
                );
              }

            default:
          }
          return Container();
        },
      ),
    );
  }
}
