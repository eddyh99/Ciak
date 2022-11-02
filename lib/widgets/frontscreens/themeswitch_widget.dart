import 'package:ciak_live/controllers/settings_controller.dart';
import 'package:ciak_live/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.darkMode = controller.darkMode ? false : true;
            controller.update();
          },
          child: SizedBox(
            height: 4.h,
            child: Stack(
              alignment: controller.darkMode
                  ? AlignmentDirectional.centerStart
                  : AlignmentDirectional.centerEnd,
              children: [
                controller.darkMode
                    ? Image.asset(
                        "assets/images/theme-switch-body-dark.png",
                        fit: BoxFit.fitHeight,
                      )
                    : Image.asset(
                        "assets/images/theme-switch-body.png",
                        fit: BoxFit.fitHeight,
                      ),
                controller.darkMode
                    ? Image.asset(
                        "assets/images/theme-switch-btn-dark.png",
                        fit: BoxFit.fitHeight,
                        scale: 1.6,
                      )
                    : Image.asset(
                        "assets/images/theme-switch-btn.png",
                        fit: BoxFit.fitHeight,
                        scale: 1.6,
                      ),
                /* Gunakan ini jika tanpa 2 gambar
                Image.asset(
                  "assets/images/theme-switch-body.png",
                  fit: BoxFit.fitWidth,
                  color: Colors.blueGrey
                      .withOpacity(controller.darkMode ? 0.7 : 0.0),
                  colorBlendMode: BlendMode.srcATop,
                ),
                Image.asset(
                  "assets/images/theme-switch-btn.png",
                  scale: 1.6,
                  color:
                      Colors.white.withOpacity(controller.darkMode ? 0.9 : 0.0),
                  colorBlendMode: BlendMode.srcATop,
                ),
                */
              ],
            ),
          ),
        );
      },
    );
  }
}
