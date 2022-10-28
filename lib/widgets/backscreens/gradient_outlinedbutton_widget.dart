import 'package:flutter/material.dart';

class GradientOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Gradient? gradient;
  final double thickness;
  final BorderRadius? borderRadius;

  const GradientOutlinedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.gradient,
    this.thickness = 2,
    this.borderRadius = const BorderRadius.all(Radius.circular(20.0)),
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: gradient ??
            const LinearGradient(colors: [Colors.red, Colors.orange]),
        borderRadius: borderRadius,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        margin: EdgeInsets.all(thickness),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              width: 0.0,
              color: Colors.transparent,
            ),
          ),
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
