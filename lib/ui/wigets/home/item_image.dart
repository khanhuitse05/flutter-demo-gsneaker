import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ItemImageWidget extends StatelessWidget {
  const ItemImageWidget(
      {Key? key, required this.url, required this.color, this.size})
      : super(key: key);
  final String url;
  final String? color;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size?.width,
      height: size != null ? size!.height * .7 : null,
      decoration: BoxDecoration(
        color: HexColor('$color'),
        borderRadius: BorderRadius.circular(10),
      ),
      child: RotationTransition(
        turns: const AlwaysStoppedAnimation(-33 / 360),
        child: Image.network(
          url,
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
