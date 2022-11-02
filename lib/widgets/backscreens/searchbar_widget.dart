import 'package:ciak_live/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key, required this.hintText, required this.onSubmit});

  final String? hintText;
  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (controller) {
        return TextField(
          maxLines: 1,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: onSubmit,
              child: const Icon(Icons.search),
            ),
            fillColor:
                controller.darkMode ? Colors.grey[600] : Colors.grey[200],
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                width: 1.5,
                color: Colors.transparent,
              ),
            ),
          ),
        );
      },
    );
  }
}
