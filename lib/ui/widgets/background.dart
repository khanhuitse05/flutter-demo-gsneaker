import 'package:app/ui/widgets/appbar.dart';
import 'package:app/utils/colors.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      top: -150,
      left: -250,
      child: Container(
        height: size.width,
        width: size.width,
        decoration: BoxDecoration(
          color: XColors.yellowColor,
          borderRadius: BorderRadius.all(
            Radius.circular(size.width),
          ),
        ),
      ),
    );
  }
}

class XLayout extends StatelessWidget {
  const XLayout({
    required this.child,
    Key? key,
    this.action,
    this.supTitle,
    required this.title,
  }) : super(key: key);
  final Widget child;
  final Widget? action;
  final String title;
  final Widget? supTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const Background(),
        SafeArea(
          child: Column(
            children: [
              XAppbar(
                title: title,
                supTitle: supTitle,
                action: action,
              ),
              Expanded(child: child),
            ],
          ),
        )
      ]),
    );
  }
}
