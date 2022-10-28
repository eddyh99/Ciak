import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.image,
    this.withBorder = false,
  });

  final Image? image;
  final bool withBorder;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: withBorder
          ? BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.red,
                  Colors.orange,
                ],
              ),
              borderRadius: BorderRadius.circular(13.0))
          : const BoxDecoration(),
      child: Card(
        elevation: 0.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: AspectRatio(
          aspectRatio: 3 / 4,
          child: Image(
            image: image!.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
