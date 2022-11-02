import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/frontscreens/background_widget.dart';
import 'package:ciak_live/widgets/frontscreens/themeswitch_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() {
    return _SignupViewState();
  }
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _confirmTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  bool _termIsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundWithImage(
              image: const AssetImage("assets/images/background-login.png"),
              child: Form(
                key: _signupFormKey,
                child: Center(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 80.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 0.5.h),
                                child: Text(
                                  "Email",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              TextFormField(
                                controller: _emailTextController,
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your email',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your email address";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 80.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 0.5.h),
                                child: Text(
                                  "Username",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              TextFormField(
                                controller: _usernameTextController,
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your username',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your username";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 80.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 0.5.h),
                                child: Text(
                                  "Password",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              TextFormField(
                                controller: _passwordTextController,
                                maxLines: 1,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your password',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your password";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 80.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 0.5.h),
                                child: Text(
                                  "Confirm Password",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              TextFormField(
                                controller: _confirmTextController,
                                maxLines: 1,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: 'Confirm your password',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please confirm your password";
                                  }
                                  if (_emailTextController.text.isNotEmpty &&
                                      _usernameTextController.text.isNotEmpty &&
                                      _passwordTextController.text.isNotEmpty &&
                                      _passwordTextController.text != value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Confirm password by entering the password you created above")));
                                    return "Please confirm your password";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 80.w,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.w, vertical: 0.h),
                            child: Row(
                              children: [
                                Checkbox(
                                    value: _termIsChecked,
                                    activeColor: Colors.red,
                                    onChanged: ((value) {
                                      setState(() {
                                        _termIsChecked =
                                            value == true ? true : false;
                                      });
                                    })),
                                const Text("I agree with Terms and Privacy"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 50.w,
                          child: OutlinedButton(
                            onPressed: () {
                              if (_signupFormKey.currentState!.validate()) {
                                if (_termIsChecked) {
                                  Get.offAllNamed(
                                      "/front-screen/registered-wall");
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "You must agree with the Terms and Privacy")));
                                }
                              }
                            },
                            child: const Text("Sign up"),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          width: 100.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account? "),
                              GestureDetector(
                                onTap: () {
                                  Get.offAllNamed("/front-screen/login");
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
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
            ),
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: SizedBox(
                width: 10.h,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.fitHeight,
                    ),
                    Text(
                      "Sign up",
                      style: Theme.of(context).textTheme.button,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                    child: const ThemeSwitch(),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
