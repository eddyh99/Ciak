import 'package:flutter/material.dart';
import 'package:ciak_app/utils/extensions.dart';
import 'package:get/get.dart';

import 'package:ciak_app/widgets/frontscreens/background_widget.dart';

class NotifSignup extends StatefulWidget {
  const NotifSignup({super.key});

  @override
  State<NotifSignup> createState() {
    return _NotifSignupState();
  }
}

class _NotifSignupState extends State<NotifSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundWithImage(
              image: AssetImage("assets/images/new-ciak/bg-login.png"),
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(1.sp),
                        child: SizedBox(
                            child: Column(
                          children: [
                            SizedBox(
                              height: 24.h,
                              child: Image.asset(
                                  "assets/images/new-ciak/success-register.png"),
                            ),
                            const Text(
                              "Succesfully registered",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(79, 243, 1, 1),
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                              width: 70.w,
                              child: Divider(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 90.w,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(129, 255, 108, 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      "ATTENTION",
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    const Text(
                                      "To activate your account click the link received into your registration email.",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    const Text(
                                      "To activate your account click the link received into your registration email.",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            SizedBox(
                              width: 90.w,
                              child: InkWell(
                                child: const Text(
                                  "Back to Login",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                onTap: () =>
                                    Get.offNamed("/front-screen/login"),
                              ),
                            ),
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
