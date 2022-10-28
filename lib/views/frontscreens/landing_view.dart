import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/frontscreens/background_widget.dart';
import 'package:ciak_live/widgets/frontscreens/themeswitch_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
              image: const AssetImage("assets/images/background-login.png"),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                    child: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.fitHeight,
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
                        Get.toNamed("/front-screen/referral");
                      },
                      child: const Text("Sign up"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: IconButton(
                      onPressed: () {
                        launchUrl(
                            Uri(scheme: "https", host: "softwarebali.com"));
                      },
                      icon: SizedBox(
                        height: 7.h,
                        child: Image.asset(
                          "assets/images/home-icon.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                    child: const ThemeSwitch(),
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
