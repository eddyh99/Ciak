import 'package:flutter/material.dart';

class GradientTextField extends StatelessWidget {
  const GradientTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.prefixText,
      this.suffixText,
      this.maxLength,
      this.maxLines,
      this.keyboardType,
      this.focusNode});

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? prefixText;
  final String? suffixText;
  final int? maxLength;
  final int? maxLines;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Container(
        margin: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: TextField(
          focusNode: focusNode,
          controller: controller,
          maxLength: maxLength,
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixText: prefixText,
            suffixText: suffixText,
            hintText: hintText,
            fillColor: Colors.transparent,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ),
    );
  }
}
