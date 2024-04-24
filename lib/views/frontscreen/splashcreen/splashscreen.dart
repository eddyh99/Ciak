import 'package:ciak_app/widgets/frontscreens/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:ciak_app/utils/extensions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackgroundWithImage(
        image: const AssetImage("assets/images/new-ciak/bg-login.png"),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(30.sp),
              child: SizedBox(
                height: 15.h,
                child: Image.asset("assets/images/new-ciak/logo.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
