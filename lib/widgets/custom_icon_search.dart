import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_icon_button.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const ActionButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: CustomIconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 30.0,
        ),
      ),
    );
  }
}
