import 'package:flutter/material.dart';

class BackgroundWithImage extends StatelessWidget {
  final AssetImage image;
  final Widget child;

  const BackgroundWithImage(
      {super.key, required this.image, required this.child});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 1.0,
      widthFactor: 1.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 48, 48, 48),
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
