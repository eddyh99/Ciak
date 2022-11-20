import 'package:ciak_live/utils/extensions.dart';
import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.onSubmit,
    this.fillColor,
    this.hintStyle,
    this.style,
  });

  final TextEditingController? controller;
  final String? hintText;
  final VoidCallback? onSubmit;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 1,
      style: style,
      decoration: InputDecoration(
        hintStyle: hintStyle,
        hintText: hintText,
        suffixIcon: GestureDetector(
          onTap: onSubmit,
          child: Container(
            margin: EdgeInsets.all(1.w),
            padding: EdgeInsets.all(2.w),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.orange,
                ],
              ),
            ),
            child: Image.asset("assets/images/send-chat.png", scale: 2.8),
          ),
        ),
        fillColor: fillColor ??
            (Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[600]
                : Colors.grey[200]),
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
