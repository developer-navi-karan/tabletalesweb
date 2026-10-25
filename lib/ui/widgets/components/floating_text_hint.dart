import 'package:flutter/material.dart';
import 'package:tabletalesweb/ui/common/app_colors.dart';

class FloatingTextHint extends StatelessWidget {
  final String text;

  const FloatingTextHint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Poppins',
          letterSpacing: 0,
          color: kcDarkGreyColor,
          fontWeight: FontWeight.w500,
          fontSize: 14),
    );
  }
}
