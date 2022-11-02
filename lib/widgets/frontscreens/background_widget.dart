import 'package:ciak_live/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackgroundWithImage extends StatelessWidget {
  const BackgroundWithImage(
      {super.key, required this.image, required this.child});

  final Widget child;
  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (controller) {
        return FractionallySizedBox(
          heightFactor: 1.0,
          widthFactor: 1.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(controller.darkMode ? 0.3 : 1.0),
                    BlendMode.dstATop),
                image: image,
                fit: BoxFit.cover,
              ),
            ),
            child: child,
          ),
        );
      },
    );
  }
}
