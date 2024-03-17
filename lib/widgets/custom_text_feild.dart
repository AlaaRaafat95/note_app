import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String? initialValue;
  final String labelText;
  final int? maxLines;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomField(
      {super.key,
      this.controller,
      this.initialValue,
      required this.labelText,
      this.maxLines,
      this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      initialValue: initialValue,
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.4),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.4),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).primaryColorLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(10),
        ),
        floatingLabelStyle:
            const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        labelText: labelText,
        labelStyle:
            const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
      ),
      validator: (val) {
        if (val?.isEmpty ?? true) {
          return "Sorry you should enter your note here";
        }
        return null;
      },
    );
  }
}
