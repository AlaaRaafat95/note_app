import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_icon_search.dart';
import 'package:note_app/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(title: title, fontSize: 30),
        ActionButton(
          onPressed: onPressed,
          icon: icon,
        ),
      ],
    );
  }
}
