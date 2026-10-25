import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color boxShadowColor;
  final double containerRadius;
  final Widget child;

  const CustomContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.boxShadowColor,
      required this.containerRadius,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: boxShadowColor,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(containerRadius)),
        ),
        child: child);
  }
}
