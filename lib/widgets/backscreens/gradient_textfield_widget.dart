import 'package:flutter/material.dart';

class GradientTextField extends StatelessWidget {
  const GradientTextField({
    super.key,
    this.controller,
    this.hintText,
    this.suffixText,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? suffixText;

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
          controller: controller,
          decoration: InputDecoration(
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
