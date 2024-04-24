import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ciak_app/widgets/frontscreens/background_widget.dart';
import 'package:ciak_app/utils/extensions.dart';
// import 'package:expatroasters/utils/functions.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() {
    return _IntroScreenState();
  }
}

class _IntroScreenState extends State<IntroScreen> {
  var items = [
    BackgroundWithImage(
      image: const AssetImage("assets/images/new-ciak/bg-login.png"),
      child: SizedBox(
        width: 100.h,
        height: 100.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: SizedBox(
                height: 25.h,
                child: Image.asset("assets/images/new-ciak/intro-1.png"),
              ),
            ),
            SizedBox(
              width: 60.w,
              child: Text(
                "INTRO NUMBER ONE",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    ),
    BackgroundWithImage(
      image: const AssetImage("assets/images/new-ciak/bg-login.png"),
      child: SizedBox(
        width: 100.h,
        height: 100.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: SizedBox(
                height: 25.h,
                child: Image.asset("assets/images/new-ciak/intro-1.png"),
              ),
            ),
            SizedBox(
              width: 60.w,
              child: Text(
                "INTRO NUMBER TWO",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    ),
    BackgroundWithImage(
      image: const AssetImage("assets/images/new-ciak/bg-login.png"),
      child: SizedBox(
        width: 100.h,
        height: 100.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: SizedBox(
                height: 25.h,
                child: Image.asset("assets/images/new-ciak/intro-1.png"),
              ),
            ),
            SizedBox(
              width: 60.w,
              child: Text(
                "INTRO NUMBER THREE",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    ),
  ];

  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            CarouselSlider(
              items: items,
              options: CarouselOptions(
                height: 100.h,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 80.w,
                    child: SizedBox(
                      width: 60.w,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed("/front-screen/landing");
                        },
                        child: const Text("Get Started"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DotsIndicator(
                    dotsCount: items.length,
                    position: currentIndex,
                    decorator: DotsDecorator(
                      activeColor: Color.fromRGBO(1, 164, 39, 1),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
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
