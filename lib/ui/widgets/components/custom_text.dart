import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle textStyle1;
  final int maxLines;

  const CustomText({
    super.key,
    required this.text,
    required this.textStyle1,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      textAlign: TextAlign.start,
      softWrap: true,
      style: textStyle1,
      maxLines: maxLines,
    );
  }
}
