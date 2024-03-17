import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color? color;
  const CustomText(
      {super.key, required this.title, required this.fontSize, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: fontSize, color: color),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
