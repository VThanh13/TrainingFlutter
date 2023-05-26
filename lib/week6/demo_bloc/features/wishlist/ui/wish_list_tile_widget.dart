import 'package:code/week6/demo_bloc/features/home/models/product_model.dart';
import 'package:flutter/material.dart';

import '../bloc/wish_list_bloc.dart';
import '../bloc/wish_list_event.dart';

class WishListTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishListBloc wishListBloc;
  const WishListTileWidget({Key? key, required this.productDataModel, required this.wishListBloc}) : super(key: key);

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
                    wishListBloc.add(WishListRemoveFromWishListEvent(
                      clickedProduct: productDataModel
                    ));
                    wishListBloc.add(WishListInitialEvent());
                  },
                      icon: const Icon(Icons.favorite)),
                  IconButton(onPressed: (){
                    wishListBloc.add(WishListProductCartButtonClickedEvent(
                      clickedProduct: productDataModel
                    ));
                  },
                      icon: const Icon(Icons.add_shopping_cart)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
