import 'package:app/cubit/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:app/ui/widgets/background.dart';
import 'package:app/ui/widgets/your_cart/item_cart_widget.dart';
import 'package:app/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      return XLayout(
          title: 'Your Cart',
          supTitle: Text(
            state.totalPriceText,
            style: const TextStyle(
                color: XColors.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          child: (state.data.isNotEmpty)
              ? ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    return ItemCartWidget(state.data[index]);
                  },
                  itemCount: state.data.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 40);
                  },
                )
              : _buildEmpty(context));
    });
  }

  Widget _buildEmpty(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        "Your cart is empty.",
        style: TextStyle(
          color: XColors.blackColor,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
