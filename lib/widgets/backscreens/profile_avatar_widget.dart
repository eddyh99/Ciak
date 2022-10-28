import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar(
      {super.key,
      required this.image,
      required this.radius,
      this.hasStory = false,
      this.isLive = false,
      this.margin});

  final Image image;
  final double radius;
  final bool hasStory;
  final bool isLive;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.all(radius * 0.04),
      decoration: hasStory || isLive
          ? const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.orange,
                ],
              ),
              shape: BoxShape.circle,
            )
          : const BoxDecoration(),
      child: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: radius,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
              padding: EdgeInsets.all(radius * 0.04),
              child: CircleAvatar(
                radius: radius,
                backgroundImage: image.image,
              ),
            ),
          ),
          isLive
              ? Positioned(
                  top: 0 - (radius * 0.1),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: (radius * 0.2), vertical: (radius * 0.03)),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      gradient: LinearGradient(
                        colors: [
                          Colors.red,
                          Colors.orange,
                        ],
                      ),
                    ),
                    child: Text(
                      "LIVE",
                      style: TextStyle(
                          fontSize: (radius * 0.2), color: Colors.white),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
