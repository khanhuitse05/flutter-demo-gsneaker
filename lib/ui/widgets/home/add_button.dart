import 'package:flutter/material.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/images.dart';

class AddButton extends StatefulWidget {
  const AddButton({this.onPressed, required this.isOn, Key? key})
      : super(key: key);
  final VoidCallback? onPressed;
  final bool isOn;

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  bool isOn = true;
  final double height = 32;
  final color = XColors.yellowColor;
  @override
  void initState() {
    super.initState();
    isOn = widget.isOn;
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (isOn != widget.isOn) {
      setState(() {
        isOn = widget.isOn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: checkMarkIcon(context),
      secondChild: buttonAdd(context),
      crossFadeState:
          widget.isOn ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 300),
    );
  }

  Widget buttonAdd(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(height),
        ),
        child: const Text(
          "ADD TO CARD",
          maxLines: 1,
          style: TextStyle(
              color: XColors.blackColor,
              fontSize: 14,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget checkMarkIcon(context) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(height),
      ),
      child: Center(
        child: Image.asset(
          XImages.checkIcon,
          alignment: Alignment.center,
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}
