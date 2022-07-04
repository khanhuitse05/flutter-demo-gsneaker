import 'package:app/cubit/cart/cart_cubit.dart';
import 'package:app/model/shoes.dart';
import 'package:app/ui/wigets/background.dart';
import 'package:app/ui/wigets/home/add_button.dart';
import 'package:app/ui/wigets/home/cart_button.dart';
import 'package:app/ui/wigets/home/item_image.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage(this.item, {Key? key}) : super(key: key);
  final Shoes item;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      final isOn = state.isOnOf(item.id);
      return XLayout(
        title: item.name,
        action: const CartButton(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: item.id,
                child: ItemImageWidget(
                  color: item.color,
                  url: item.image,
                  size: Size(double.infinity, size.width * 0.7),
                ),
              ),
              const SizedBox(height: 16),
              _price(context, price: item.price),
              const SizedBox(height: 8),
              _description(context, descrip: item.description),
              const SizedBox(height: 24),
              _bottom(context, isOn: isOn),
              const SizedBox(height: 8),
            ],
          ),
        ),
      );
    });
  }

  Widget _bottom(BuildContext context, {required bool isOn}) {
    return AddButton(
        onPressed: () {
          context.read<CartCubit>().updateProduct(item, 1);
        },
        isOn: isOn);
  }

  Widget _price(BuildContext context, {required double price}) {
    return Text(
      "\$$price",
      style: const TextStyle(
          fontFamily: XFonts.rubik,
          color: XColors.blackColor,
          fontSize: 22,
          fontWeight: FontWeight.bold),
    );
  }

  Widget _description(BuildContext context, {String? descrip}) {
    return Text(
      descrip!,
      style: const TextStyle(
        color: XColors.greyColor,
        fontSize: 14,
        height: 1.5,
      ),
    );
  }
}
