import 'package:ciak_live/home.dart';
import 'package:ciak_live/screen/referal_screen.dart';
import 'package:ciak_live/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandingApp extends StatefulWidget {
  const LandingApp({Key? key}) : super(key: key);

  @override
  State<LandingApp> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingApp> {
  Widget _button(String txtbutton, double opacity) {
    return ButtonWidget(
        textbutton: txtbutton,
        opacity: opacity,
        onClick: () {
          if (txtbutton == 'Login') {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const HomeApp()));
          } else if (txtbutton == "Sign Up") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignupApp()),
            );
          }
        });
  }

  DateTime pre_backpress = DateTime.now();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background-login.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/logo.png",
                    height: 250,
                  ),
                  _button("Login", 1),
                  const SizedBox(
                    height: 10,
                  ),
                  _button("Sign Up", 0)
                ])));
  }
}
