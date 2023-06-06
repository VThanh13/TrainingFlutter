import 'package:code/week6/demo_bloc/features/card/ui/cart.dart';
import 'package:code/week6/demo_bloc/features/home/bloc/home_event.dart';
import 'package:code/week6/demo_bloc/features/home/bloc/home_state.dart';
import 'package:code/week6/demo_bloc/features/home/ui/product_tile_widget.dart';
import 'package:code/week6/demo_bloc/features/wishlist/ui/wish_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class HomeDemoBloc extends StatefulWidget {
  const HomeDemoBloc({super.key});

  @override
  State<HomeDemoBloc> createState() => _HomeBlocState();
}

class _HomeBlocState extends State<HomeDemoBloc> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Bloc'),
        actions: [
          IconButton(
              onPressed: () {
                homeBloc.add(HomeWishlistButtonNavigateEvent());
              },
              icon: const Icon(Icons.favorite_border)),
          IconButton(
              onPressed: () {
                homeBloc.add(HomeCardButtonNavigateEvent());
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
          bloc: homeBloc,
          listenWhen: (previous, current) => current is HomeActionState,
          buildWhen: (previous, current) => current is! HomeActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case HomeLoadingState:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case HomeLoadedSuccessState:
                final successState = state as HomeLoadedSuccessState;
                return ListView.builder(
                    itemCount: successState.products.length,
                    itemBuilder: (context, index) {
                      return ProductTileWidget(
                        productDataModel: successState.products[index],
                        homeBloc: homeBloc,
                      );
                    });
              case HomeErrorState:
                return const Center(
                  child: Text('Error'),
                );
              default:
                return const SizedBox();
            }
          },
          listener: (context, state) {
            if (state is HomeNavigateToCardPageActionState) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Cart()));
            } else if (state is HomeNavigateToWishlistPageActionState) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WishList()));
            } else if (state is HomeProductItemCartedActionState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add to card success!')));
            } else if (state is HomeProductItemWishListedActionState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add to wish list success!')));
            }
          }),
    );
  }
}
