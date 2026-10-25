import 'package:flutter/material.dart';
import 'package:tabletalesweb/ui/common/app_constants.dart';

class MobileNavigationRailIconWidget extends StatelessWidget {
  final String itemName;
  final String itemIcon;
  final Color color;

  const MobileNavigationRailIconWidget(
      {super.key,
      required this.itemName,
      required this.itemIcon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kdTabletNavigationItemHeight,
      width: kdTabletNavigationItemWidth,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image(image: AssetImage(itemIcon), width: 20, height: 20, color: color),
        const SizedBox(
          height: 4,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          itemName,
          style: TextStyle(
              fontFamily: 'Poppins',
              color: color,
              letterSpacing: 0,
              fontSize: 12,
              fontWeight: FontWeight.w400),
        )
      ]),
    );
  }
}
