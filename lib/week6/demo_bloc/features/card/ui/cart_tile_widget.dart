import 'package:code/week6/demo_bloc/features/card/bloc/cart_event.dart';
import 'package:code/week6/demo_bloc/features/home/models/product_model.dart';
import 'package:flutter/material.dart';

import '../bloc/cart_bloc.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({Key? key, required this.productDataModel, required this.cartBloc, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(productDataModel.imageUrl),
                    fit: BoxFit.cover
                )
            ),
          ),
          const SizedBox(height: 20,),
          Text(productDataModel.name, style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),),
          Text(productDataModel.description),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$  ${productDataModel.price.toString()}"  , style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
              ),
              Row(
                children: [
                  IconButton(onPressed: (){
                    cartBloc.add(CartProductWishListButtonClickedEvent(
                        clickedProduct: productDataModel));
                  },
                      icon: const Icon(Icons.favorite_border)),
                  IconButton(onPressed: (){
                    cartBloc.add(CartRemoveFromCartEvent(
                      clickedProduct: productDataModel
                    ));
                    cartBloc.add(CartInitialEvent());
                  },
                      icon: const Icon(Icons.shopping_cart_checkout)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
