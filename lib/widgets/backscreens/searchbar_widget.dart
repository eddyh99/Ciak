import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key, required this.hintText, required this.onSubmit});

  final String? hintText;
  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: GestureDetector(
          onTap: onSubmit,
          child: const Icon(Icons.search),
        ),
        fillColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[600]
            : Colors.grey[200],
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            width: 1.5,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
