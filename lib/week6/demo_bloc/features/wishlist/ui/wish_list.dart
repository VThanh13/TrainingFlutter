import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/wishlist_items.dart';
import '../bloc/wish_list_bloc.dart';
import '../bloc/wish_list_event.dart';
import '../bloc/wish_list_state.dart';
import 'wish_list_tile_widget.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final WishListBloc wishListBloc = WishListBloc();
  @override
  void initState() {
    wishListBloc.add(WishListInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wish list'),
      ),
      body: BlocConsumer<WishListBloc, WishListState>(
        bloc: wishListBloc,
        listenWhen: (previous, current) => current is WishListActionState,
        buildWhen: (previous, current) => current is! WishListActionState,
        listener: (context, state) {
          if (state is WishListProductItemCartedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Add to card success!'),
              ),
            );
          } else if (state is WishListProductItemRemoveFromWishListState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Delete item success!'),
              ),
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishListSuccessState:
              final successState = state as WishListSuccessState;
              if (wishlistItems.isEmpty) {
                return const Center(
                  child: Text(
                    'No item in wish list!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                );
              } else {
                return Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 50,
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          const Text(
                            'Total items:',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            wishlistItems.length.toString(),
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: successState.wishListItems.length,
                          itemBuilder: (context, index) {
                            return WishListTileWidget(
                                productDataModel:
                                    successState.wishListItems[index],
                                wishListBloc: wishListBloc);
                          }),
                    ),
                  ],
                );
              }
          }
          return const SizedBox();
        },
      ),
    );
  }
}
