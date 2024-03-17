import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  const CustomButton(
      {super.key, required this.onPressed, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        minimumSize: const Size.fromHeight(10),
      ),
      onPressed: onPressed,
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.black,
            )
          : const CustomText(
              title: "Add",
              fontSize: 20,
              color: Colors.white,
            ),
    );
  }
}
