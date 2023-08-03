import 'package:flutter/material.dart';
import 'package:app/utils/images.dart';

Widget iconButton(context,
    {String? icon, Color? color, Function()? onPressed}) {
  Size size = MediaQuery.of(context!).size;
  return SizedBox(
    width: size.width / 11,
    height: size.width / 11,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 0,
        padding: const EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width),
        ),
      ),
      child: Image.asset(
        icon!,
        width: icon == XImages.trashIcon ? size.width / 18 : size.width / 26,
      ),
    ),
  );
}
