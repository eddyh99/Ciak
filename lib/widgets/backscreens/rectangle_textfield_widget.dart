import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RectangleTextFormField extends StatelessWidget {
  const RectangleTextFormField({
    super.key,
    this.controller,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.validator,
    this.inputFormatters,
    this.readOnly = false,
    this.maxLength,
  });
  final TextEditingController? controller;
  final int maxLines;
  final TextInputType keyboardType;
  final String? hintText;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      validator: validator,
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: readOnly
            ? Theme.of(context).brightness == Brightness.light
                ? Colors.grey[350]
                : Colors.grey[800]
            : Theme.of(context).scaffoldBackgroundColor,
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            width: 1.5,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            width: 1.5,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            width: 1.5,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            width: 1.5,
            color: Colors.red,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            width: 1.5,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
