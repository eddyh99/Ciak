import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ciak_app/utils/extensions.dart';
import 'package:ciak_app/utils/functions.dart';
import 'package:ciak_app/utils/globalvar.dart';
import 'package:ciak_app/widgets/frontscreens/background_widget.dart';
import 'package:ciak_app/widgets/backscreens/Asyctext_widget.dart';
import 'package:ciak_app/widgets/backscreens/loaderalert_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() {
    return _LoginViewState();
  }
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  bool _passwordVisible = false;

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
              child: Form(
                key: _loginFormKey,
                child: Center(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                "Login",
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
                                keyboardType: TextInputType.text,
                                maxLines: 1,
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
                                  "Password",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              TextFormField(
                                controller: _passwordTextController,
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
                          width: 80.w,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 1.h),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  //Not implemented yet
                                },
                                child: const Text("Forgot Password?"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          width: 50.w,
                          height: 6.h,
                          child: ElevatedButton(
                            onPressed: () async {
                              showLoaderDialog(context);
                              if (!_loginFormKey.currentState!.validate()) {
                                Navigator.pop(context);
                              }
                              if (_loginFormKey.currentState!.validate()) {
                                Map<String, dynamic> mdata;
                                mdata = {
                                  'email': _emailTextController.text,
                                  'password': sha1
                                      .convert(utf8
                                          .encode(_passwordTextController.text))
                                      .toString()
                                };
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                var url = Uri.parse("$urlapi/auth/signin");
                                await ciakAPI(url, jsonEncode(mdata))
                                    .then(
                                      (ress) => {
                                        printDebug("DISINI THEN"),
                                        printDebug(jsonDecode(ress)['code']),
                                        if (context.mounted)
                                          {
                                            Navigator.pop(context),
                                          },
                                        if (jsonDecode(ress)["code"] == '200')
                                          {
                                            prefs.setString(
                                                "logged",
                                                jsonEncode(jsonDecode(
                                                    ress)["message"])),
                                            Get.toNamed(
                                                "/front-screen/homepage"),
                                          }
                                        else
                                          {
                                            Navigator.pop(context),
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                  content: AsyctextWidget(
                                                datas:
                                                    jsonDecode(ress)['message'],
                                              )),
                                            ),
                                          },
                                        _loginFormKey.currentState?.reset(),
                                        _emailTextController.clear(),
                                        _passwordTextController.clear(),
                                      },
                                    )
                                    .catchError(
                                      (err) => {
                                        printDebug("DISINI CATCH"),
                                        log("100-$err"),
                                        if (context.mounted)
                                          {
                                            Navigator.pop(context),
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    "Wrong Email or Password!"),
                                              ),
                                            ),
                                            _loginFormKey.currentState?.reset(),
                                            _emailTextController.clear(),
                                            _passwordTextController.clear(),
                                          },
                                      },
                                    );
                              }
                            },
                            child: const Text("Login"),
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
                              const Text("Don't have an account? "),
                              GestureDetector(
                                onTap: () {
                                  Get.offNamed("/front-screen/signup");
                                },
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color: Color.fromRGBO(79, 243, 1, 1),
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
          ],
        ),
      ),
    );
  }
}
