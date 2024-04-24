import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';

import 'package:ciak_app/widgets/frontscreens/background_widget.dart';
import 'package:ciak_app/utils/extensions.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() {
    return _LandingViewState();
  }
}

class _LandingViewState extends State<LandingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundWithImage(
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
                  ),
                  SizedBox(
                    width: 60.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed("/front-screen/login");
                      },
                      child: const Text("Login"),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    width: 60.w,
                    child: OutlinedButton(
                      onPressed: () {
                        Get.toNamed("/front-screen/signup");
                      },
                      child: const Text("Sign up"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
