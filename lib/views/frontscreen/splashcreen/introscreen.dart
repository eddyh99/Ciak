// import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'package:ciak_app/widgets/frontscreens/background_widget.dart';
import 'package:ciak_app/utils/extensions.dart';
// import 'package:expatroasters/utils/functions.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  // IntroScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  // var items = [
  //   BackgroundWithImage(
  //     image: const AssetImage("assets/images/new-ciak/bg-login.png"),
  //     child: SizedBox(
  //       width: 100.h,
  //       height: 100.h,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Padding(
  //             padding: EdgeInsets.all(10.sp),
  //             child: SizedBox(
  //               height: 25.h,
  //               child: Image.asset("assets/images/new-ciak/intro-1.png"),
  //             ),
  //           ),
  //           SizedBox(
  //             width: 60.w,
  //             child: Text(
  //               "INTRO NUMBER ONE",
  //               style: TextStyle(fontSize: 24),
  //               textAlign: TextAlign.center,
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   ),
  //   BackgroundWithImage(
  //     image: const AssetImage("assets/images/new-ciak/bg-login.png"),
  //     child: SizedBox(
  //       width: 100.h,
  //       height: 100.h,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Padding(
  //             padding: EdgeInsets.all(10.sp),
  //             child: SizedBox(
  //               height: 25.h,
  //               child: Image.asset("assets/images/new-ciak/intro-1.png"),
  //             ),
  //           ),
  //           SizedBox(
  //             width: 60.w,
  //             child: Text(
  //               "INTRO NUMBER TWO",
  //               style: TextStyle(fontSize: 24),
  //               textAlign: TextAlign.center,
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   ),
  //   BackgroundWithImage(
  //     image: const AssetImage("assets/images/new-ciak/bg-login.png"),
  //     child: SizedBox(
  //       width: 100.h,
  //       height: 100.h,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Padding(
  //             padding: EdgeInsets.all(10.sp),
  //             child: SizedBox(
  //               height: 25.h,
  //               child: Image.asset("assets/images/new-ciak/intro-1.png"),
  //             ),
  //           ),
  //           SizedBox(
  //             width: 60.w,
  //             child: Text(
  //               "INTRO NUMBER THREE",
  //               style: TextStyle(fontSize: 24),
  //               textAlign: TextAlign.center,
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   ),
  // ];
  late final VideoPlayerController videocontroller;
  bool _visible = false;

  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    videocontroller =
        VideoPlayerController.asset("assets/images/new-ciak/introvideo.mp4")
          ..initialize().then(
            (_) {
              videocontroller.play();
              videocontroller.setLooping(true);
            },
          );
  }

  _getVideoBackground() {
    return AnimatedOpacity(
      opacity: 0.7,
      duration: const Duration(milliseconds: 1000),
      child: VideoPlayer(videocontroller),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            // CarouselSlider(
            //   items: items,
            //   options: CarouselOptions(
            //     height: 100.h,
            //     viewportFraction: 1.0,
            //     enlargeCenterPage: false,
            //     onPageChanged: (index, reason) {
            //       setState(() {
            //         currentIndex = index;
            //       });
            //     },
            //   ),
            // ),
            // _getVideoBackground(),
            // SizedBox.expand(
            //   child: FittedBox(
            //     fit: BoxFit.cover,
            //     child: SizedBox(
            //       // width: _controller.value.size?.width ?? 0,
            //       height: 100.h,
            //       child: VideoPlayer(_controller),
            //     ),
            //   ),
            // ),
            _getVideoBackground(),
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
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            side: BorderSide(
                              color: Colors
                                  .black, // Set the border color to match the shadow color
                              width: 1.0, // Set the border width
                            ),
                          ),
                        ),
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
                  // DotsIndicator(
                  //   dotsCount: items.length,
                  //   position: currentIndex,
                  //   decorator: DotsDecorator(
                  //     activeColor: Color.fromRGBO(1, 164, 39, 1),
                  //   ),
                  // ),
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
