import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({super.key, this.icon, this.color, this.onPressed});
  final String? icon;
  final Color? color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    const double buttonSize = 32;
    const double iconSize = 16;
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: Image.asset(
            icon!,
            width: iconSize,
          ),
        ),
      ),
    );
  }
}
