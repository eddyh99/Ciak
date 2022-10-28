import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisteredWallView extends StatelessWidget {
  const RegisteredWallView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.offAllNamed("/front-screen/landing");
        return Future.value(true);
      },
      child: Scaffold(
        body: SafeArea(
          child: FractionallySizedBox(
            heightFactor: 1.0,
            widthFactor: 1.0,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Divider(
                        indent: 5.w,
                        endIndent: 5.w,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20.h,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                                255, 233, 122, 122)
                                            .withAlpha(60),
                                        blurRadius: 16.0,
                                        spreadRadius: 10.0,
                                        offset: const Offset(
                                          0.0,
                                          3.0,
                                        ),
                                      ),
                                    ]),
                                child: Image.asset(
                                  "assets/images/success-registered.png",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.h),
                              child: Text(
                                "Succesfully Registered",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp),
                              ),
                            ),
                            Divider(
                              indent: 15.w,
                              endIndent: 15.w,
                              thickness: 2.0,
                              color: Colors.red[100],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 2.w),
                        child: Card(
                          color: Colors.red[100],
                          child: Padding(
                            padding: EdgeInsets.all(2.w),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                  text:
                                      "Now activate your account by clicking on the link received in your email.",
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 2.w),
                        child: const Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            text:
                                "ATTENTION: if you do not see the email, check into the spam folder.",
                          ),
                        ),
                      ),
                      Divider(
                        indent: 5.w,
                        endIndent: 5.w,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 3.h),
                        child: GestureDetector(
                          onTap: () {
                            openMailApp().then(
                              (mailOpened) {
                                if (!mailOpened) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("Failed to open mail app")));
                                }
                              },
                            );
                          },
                          child: Text(
                            "Open mail app",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
