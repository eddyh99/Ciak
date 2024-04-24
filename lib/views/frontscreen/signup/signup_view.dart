import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ciak_app/widgets/frontscreens/background_widget.dart';
import 'package:ciak_app/utils/extensions.dart';
import 'package:ciak_app/utils/functions.dart';
import 'package:ciak_app/widgets/backscreens/loaderalert_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _password2TextController =
      TextEditingController();
  final TextEditingController _ucodeTextController = TextEditingController();

  bool _passwordVisible = false;
  bool _passwordVisible2 = false;

  bool _termIsChecked = false;
  bool _agencyIsChecked = false;
  late String _password;
  double _strength = 0;

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");
  RegExp charReg = RegExp(r".*[!@#$%^&*()].*");

  void _checkPassword(String value) {
    _password = value.trim();

    if (_password.isEmpty) {
      setState(() {
        _strength = 0;
      });
    } else if (_password.length < 8) {
      setState(() {
        _strength = 1 / 4;
      });
    } else if (!charReg.hasMatch(_password)) {
      setState(() {
        _strength = 2 / 4;
      });
    } else {
      if (!letterReg.hasMatch(_password) || !numReg.hasMatch(_password)) {
        setState(() {
          // Password length >= 8
          // But doesn't contain both letter and digit characters
          _strength = 3 / 4;
        });
      } else {
        // Password length >= 8
        // Password contains both letter and digit characters
        setState(() {
          _strength = 1;
        });
      }
    }
  }

  showLoaderDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => const LoaderAlert(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundWithImage(
              image: const AssetImage("assets/images/new-ciak/bg-login.png"),
              child: Center(
                child: Form(
                  key: _signupFormKey,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: SizedBox(
                              child: Column(
                            children: [
                              SizedBox(
                                height: 15.h,
                                child: Image.asset(
                                    "assets/images/new-ciak/logo.png"),
                              ),
                              const Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Color.fromRGBO(79, 243, 1, 1),
                                ),
                              )
                            ],
                          )),
                        ),
                        SizedBox(
                          width: 80.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 0.5.h),
                                child: Text(
                                  "Email",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              TextFormField(
                                controller: _emailTextController,
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(25, 12, 12, 12),
                                  hintText: 'Input your email',
                                ),
                                validator: validateEmail,
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
                                    horizontal: 3.w, vertical: 0.5.h),
                                child: Text(
                                  "Username",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              TextFormField(
                                controller: _usernameTextController,
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(25, 12, 12, 12),
                                  hintText: 'Input your username',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please input your username";
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
                                    horizontal: 3.w, vertical: 0.5.h),
                                child: Text(
                                  "Password",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              TextFormField(
                                controller: _passwordTextController,
                                onChanged: (value) => _checkPassword(value),
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(25, 12, 12, 12),
                                  hintText: 'Input your password',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please input your password";
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
                          child: LinearProgressIndicator(
                            value: _strength,
                            backgroundColor: Colors.grey[300],
                            borderRadius: BorderRadius.circular(100.0),
                            color: _strength <= 1 / 4
                                ? Colors.red
                                : _strength == 2 / 4
                                    ? Colors.yellow
                                    : _strength == 3 / 4
                                        ? Colors.blue
                                        : Colors.green,
                            minHeight: 5,
                          ),
                        ),
                        SizedBox(
                          height: 0.9.h,
                        ),
                        SizedBox(
                          width: 80.w,
                          child: const Text(
                            "Use 8 or more characters with a mix of letters, numbers & symbols.",
                            style: TextStyle(fontSize: 10, color: Colors.white),
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
                                    horizontal: 3.w, vertical: 0.5.h),
                                child: Text(
                                  "Confirm Password",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              TextFormField(
                                controller: _password2TextController,
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                obscureText: !_passwordVisible2,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _passwordVisible2
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible2 = !_passwordVisible2;
                                      });
                                    },
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(25, 12, 12, 12),
                                  hintText: 'Input your confirm password',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please input your confirm password";
                                  }
                                  if (value != _passwordTextController.text) {
                                    return "Password not match";
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
                                    horizontal: 3.w, vertical: 0.5.h),
                                child: Text(
                                  "Referral code (optional)",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              TextFormField(
                                controller: _ucodeTextController
                                  ..text = '4q8342r',
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(25, 12, 12, 12),
                                  hintText: 'Input referral code',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please input referral code";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          width: 80.w,
                          child: Row(
                            children: [
                              Transform.scale(
                                scale: 0.7,
                                child: Checkbox(
                                  side: const BorderSide(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  value: _termIsChecked,
                                  checkColor:
                                      const Color.fromARGB(255, 0, 0, 0),
                                  activeColor: Color.fromARGB(255, 0, 255, 21),
                                  onChanged: ((value) {
                                    setState(() {
                                      _termIsChecked =
                                          value == true ? true : false;
                                    });
                                  }),
                                ),
                              ),
                              SizedBox(
                                width: 50.w,
                                child: InkWell(
                                  child: const Text(
                                    "I agree with Terms and Privacy",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.white),
                                  ),
                                  onTap: () => launchUrl(Uri.parse(
                                      'https://ciak.live/link/term_condition')),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 80.w,
                          child: Row(
                            children: [
                              Transform.scale(
                                scale: 0.7,
                                child: Checkbox(
                                  side: const BorderSide(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  value: _agencyIsChecked,
                                  checkColor:
                                      const Color.fromARGB(255, 0, 0, 0),
                                  activeColor: Color.fromARGB(255, 0, 255, 21),
                                  onChanged: ((value) {
                                    setState(() {
                                      _agencyIsChecked =
                                          value == true ? true : false;
                                    });
                                  }),
                                ),
                              ),
                              SizedBox(
                                width: 50.w,
                                child: const Text(
                                  "Apply for Agency",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 50.w,
                          height: 6.h,
                          child: ElevatedButton(
                            onPressed: () {
                              showLoaderDialog(context);
                              if (!_signupFormKey.currentState!.validate()) {
                                Navigator.pop(context);
                              }
                            },
                            child: const Text("Sign Up"),
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
                                  Get.offNamed("/front-screen/login");
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Color.fromRGBO(79, 243, 1, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                      ],
                    ),
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
