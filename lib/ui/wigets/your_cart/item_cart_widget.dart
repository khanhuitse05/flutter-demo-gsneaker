import 'package:app/cubit/cart/cart_cubit.dart';
import 'package:app/utils/fonts.dart';
import 'package:app/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:app/model/shoes.dart';
import 'package:app/ui/wigets/your_cart/buttons_widget.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class ItemCartWidget extends StatelessWidget {
  final Shoes item;

  const ItemCartWidget(this.item, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(XRoutes.product, arguments: item);
      },
      child: Container(
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _image(context),
            Expanded(child: _info(context)),
          ],
        ),
      ),
    );
  }

  Widget _info(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          item.name,
          style: const TextStyle(
              fontFamily: XFonts.rubik,
              color: XColors.blackColor,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          "\$${item.price}",
          style: const TextStyle(
              fontFamily: XFonts.rubik,
              color: XColors.blackColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        _bottom(context),
      ],
    );
  }

  Widget _bottom(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        iconButton(
          context,
          icon: XImages.minusIcon,
          color: Colors.grey.shade300,
          onPressed: () {
            context.read<CartCubit>().updateProduct(item, item.count - 1);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            "${item.count}",
            style: const TextStyle(
                color: XColors.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        iconButton(
          context,
          icon: XImages.plusIcon,
          color: Colors.grey.shade300,
          onPressed: () {
            context.read<CartCubit>().updateProduct(item, item.count + 1);
          },
        ),
        const Spacer(),
        iconButton(context, icon: XImages.trashIcon, color: XColors.yellowColor,
            onPressed: () {
          context.read<CartCubit>().updateProduct(item, 0);
        })
      ],
    );
  }

  Widget _image(context) {
    const double size = 100;
    const double bonus = 32;
    return SizedBox(
      width: size + bonus,
      height: size + bonus,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: HexColor("${item.color}"),
                borderRadius: BorderRadius.circular(size),
              ),
            ),
          ),
          Positioned(
            top: -20,
            left: -18,
            child: SizedBox(
              width: size + bonus,
              height: size + bonus,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-28 / 360),
                child: Image.network(
                  item.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
