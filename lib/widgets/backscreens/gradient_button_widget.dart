import 'package:ciak_live/utils/extensions.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor = Colors.white,
    this.margin,
    this.height,
    this.width,
    this.textStyle,
    this.backgroundColor = Colors.transparent,
    this.gradientColor =
        const LinearGradient(colors: [Colors.red, Colors.orange]),
    this.borderRadius = const BorderRadius.all(Radius.circular(5.0)),
  });

  final String text;
  final Color textColor;
  final VoidCallback? onPressed;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final LinearGradient? gradientColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 4.h,
      width: width,
      constraints: BoxConstraints(
        minHeight: 4.h,
        minWidth: 25.w,
      ),
      margin: margin,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradientColor,
          borderRadius: borderRadius,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            textStyle: textStyle ?? TextStyle(fontSize: 10.sp),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius!,
            ),
            backgroundColor: backgroundColor,
            foregroundColor: textColor,
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
