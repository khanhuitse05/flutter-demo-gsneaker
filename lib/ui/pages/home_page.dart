import 'package:app/cubit/cart/cart_cubit.dart';
import 'package:app/ui/widgets/background.dart';
import 'package:app/ui/widgets/home/cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/cubit/products/product_cubit.dart';
import 'package:app/ui/widgets/home/item_home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return XLayout(
      title: 'Our Products',
      action: const CartButton(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoaded) {
            return BlocBuilder<CartCubit, CartState>(
                builder: (context, cartState) {
              return _buildData(context, state, cartState);
            });
          } else if (state is ProductLoading) {
            return _buildLoading(context, state);
          } else if (state is ProductError) {
            return _buildError(context, state);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildLoading(BuildContext context, ProductLoading state) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(BuildContext context, ProductError state) {
    // todo
    return const Center(
      child: Icon(Icons.close),
    );
  }

  Widget _buildData(
      BuildContext context, ProductLoaded state, CartState cartState) {
    final shoesList = state.shoes;
    return ListView.builder(
      itemBuilder: (context, index) {
        return ItemHomeWidget(shoesList[index]);
      },
      itemCount: shoesList.length,
    );
  }
}
