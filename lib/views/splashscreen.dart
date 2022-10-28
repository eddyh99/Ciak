import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/frontscreens/background_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackgroundWithImage(
        image: const AssetImage("assets/images/background.png"),
        child: Center(
          child: SizedBox(
            height: 20.h,
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
