import 'package:app/cubit/cart/cart_cubit.dart';
import 'package:app/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      final number = state.data.length;

      return Stack(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, XRoutes.cart);
            },
            icon: const Icon(
              Icons.shopping_cart,
              size: 28,
            ),
          ),
          if (number > 0)
            Container(
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "$number",
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ))
        ],
      );
    });
  }
}
