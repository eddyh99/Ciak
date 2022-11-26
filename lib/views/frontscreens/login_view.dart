import 'package:ciak_live/controllers/app_prefs_controller.dart';
import 'package:ciak_live/controllers/user_controller.dart';
import 'package:ciak_live/models/user/user_model.dart';
import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/utils/functions.dart';
import 'package:ciak_live/widgets/frontscreens/background_widget.dart';
import 'package:ciak_live/widgets/frontscreens/themeswitch_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.offNamed("/front-screen/landing");
        return Future.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              BackgroundWithImage(
                image: const AssetImage("assets/images/background-login.png"),
                child: Form(
                  key: _loginFormKey,
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
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
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
                                    "Password",
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
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
                            child: ElevatedButton(
                              onPressed: () {
                                if (_loginFormKey.currentState!.validate()) {
                                  userController
                                      .logIn(
                                          email: _emailTextController.text,
                                          password:
                                              _passwordTextController.text)
                                      .then((value) async {
                                    bool isLogged = value["login"];
                                    if (isLogged) {
                                      userController.signedUser =
                                          UserModel.fromJson(value["message"]);
                                      await AppPrefs.prefsStorage.put("user",
                                          userController.signedUser!.toJson());
                                      Get.offAllNamed("/back-screen/");
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(value["message"])));
                                    }
                                  });
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
                                    Get.offNamed("/front-screen/referral");
                                  },
                                  child: const Text(
                                    "Sign up",
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
                        "Login",
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
