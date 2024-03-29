import 'package:flutter/material.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/images.dart';

class XAppbar extends StatelessWidget {
  const XAppbar({
    Key? key,
    this.action,
    required this.title,
    this.supTitle,
  }) : super(key: key);
  final Widget? action;
  final String title;
  final Widget? supTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                },
                child: Image.asset(
                  XImages.nikeIcon,
                  height: 48,
                  width: 50,
                ),
              ),
              if (action != null) action!,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: XColors.blackColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (supTitle != null) supTitle!,
            ],
          ),
        ],
      ),
    );
  }
}
