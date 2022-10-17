import 'package:ciak_live/home.dart';
import 'package:ciak_live/screen/signup_screen.dart';
import 'package:ciak_live/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupApp extends StatefulWidget {
  const SignupApp({Key? key}) : super(key: key);

  @override
  State<SignupApp> createState() => _SignupAppState();
}

class _SignupAppState extends State<SignupApp> {
  Widget _button(String txtbutton, double opacity) {
    return ButtonWidget(
        textbutton: txtbutton,
        opacity: opacity,
        onClick: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const RegisterApp()));
        });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background-login.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent, // 1
              elevation: 0, // 2
              title: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(5),
                  ),
                  child: const Icon(Icons.arrow_back)),
              automaticallyImplyLeading: false,
            ),
            body: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/logo.png",
                        height: 150,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                          text: const TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                            TextSpan(
                                text: 'ATTENTION : ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'it is necessary to have a REFERRAL CODE for the subscription on the platform, if you do not have it follow us on our Instagram page and request it.'),
                          ])),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color.fromRGBO(171, 171, 171, 0.44),
                                Color.fromRGBO(108, 108, 108, 0),
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Referral Code"),
                            TextFormField(
                                decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.person),
                              hintText: 'Referral Code',
                            )),
                            const SizedBox(
                              height: 20,
                            ),
                            _button("Submit", 1)
                          ],
                        ),
                      )
                    ])),
          ),
        ],
      ),
    );
  }
}
