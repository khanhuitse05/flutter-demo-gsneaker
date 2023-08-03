import 'package:app/cubit/cart/cart_cubit.dart';
import 'package:app/ui/widgets/home/item_image.dart';
import 'package:app/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:app/model/shoes.dart';
import 'package:app/ui/widgets/home/add_button.dart';
import 'package:app/utils/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemHomeWidget extends StatelessWidget {
  const ItemHomeWidget(this.item, {Key? key}) : super(key: key);
  final Shoes item;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      final isOn = state.isOnOf(item.id);
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(XRoutes.product, arguments: item);
        },
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
              _title(context, title: item.name),
              const SizedBox(height: 8),
              _description(context, description: item.description),
              const SizedBox(height: 8),
              _bottom(context, isOn: isOn),
              const SizedBox(height: 8),
            ],
          ),
        ),
      );
    });
  }

  Widget _bottom(BuildContext context, {required bool isOn}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "\$${item.price}",
            style: const TextStyle(
                color: XColors.blackColor,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),
        AddButton(
            onPressed: () {
              context.read<CartCubit>().updateProduct(item, 1);
            },
            isOn: isOn),
      ],
    );
  }

  Widget _title(BuildContext context, {String? title}) {
    return Text(
      title!,
      style: const TextStyle(
        color: XColors.blackColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _description(BuildContext context, {String? description}) {
    return Text(
      description!,
      style: const TextStyle(
        color: XColors.greyColor,
        fontSize: 14,
        height: 1.5,
      ),
    );
  }
}
