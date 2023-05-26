import 'package:code/week6/demo_bloc/features/home/bloc/home_bloc.dart';
import 'package:code/week6/demo_bloc/features/home/bloc/home_event.dart';
import 'package:code/week6/demo_bloc/features/home/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
final ProductDataModel productDataModel;
final HomeBloc homeBloc;
  const ProductTileWidget({Key? key, required this.productDataModel, required this.homeBloc}) : super(key: key);

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
                    homeBloc.add(HomeProductWishlistButtonClickedEvent(
                      clickedProduct: productDataModel
                    ));
                  },
                      icon: const Icon(Icons.favorite_border)),
                  IconButton(onPressed: (){
                    homeBloc.add(HomeProductCardButtonClickedEvent(
                      clickedProduct: productDataModel
                    ));
                  },
                      icon: const Icon(Icons.add_shopping_cart_rounded)),
                ],
              )
            ],
          )

        ],
      ),
    );
  }
}
