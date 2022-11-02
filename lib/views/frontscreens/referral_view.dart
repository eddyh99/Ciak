import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/frontscreens/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReferralView extends StatefulWidget {
  const ReferralView({super.key});

  @override
  State<ReferralView> createState() {
    return _ReferralViewState();
  }
}

class _ReferralViewState extends State<ReferralView> {
  final GlobalKey<FormState> _referralFormKey = GlobalKey<FormState>();
  final TextEditingController _referralTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BackgroundWithImage(
          image: const AssetImage("assets/images/background.png"),
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: SizedBox(
                      height: 30.h,
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 80.w,
                    child: const Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: "ATTENTION : ",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                            text:
                                "it is necessary to have a REFERRAL CODE for the subscription on the platform, if you do not have it follow us on our Instagram page and request it.")
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 80.w,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(5.w),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Referral Code",
                                style: TextStyle(fontSize: 20.sp),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Form(
                              key: _referralFormKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _referralTextController,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.account_circle_outlined,
                                        size: 20.sp,
                                      ),
                                      hintText: 'Referral Code',
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter the referral code";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                        minWidth: 100.w, minHeight: 7.h),
                                    child: ElevatedButton(
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                      onPressed: () {
                                        if (_referralFormKey.currentState!
                                            .validate()) {
                                          Get.toNamed("/front-screen/signup");
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    width: 100.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text("Power by "),
                        Image.asset(
                          "assets/images/mif.png",
                        ),
                        const Text(
                          " Money Industrial Factory",
                          style: TextStyle(color: Colors.yellow),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
