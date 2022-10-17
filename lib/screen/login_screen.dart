import 'package:ciak_live/screen/ciak/home_screen-alt.dart';
import 'package:ciak_live/screen/firstprofile_screen.dart';
import 'package:ciak_live/screen/referal_screen.dart';
import 'package:ciak_live/widget/button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:ciak_live/controller/ciak.dart';
import 'package:ciak_live/controller/data_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    print('checking pref');
    doLogged();
    setState(() {});
  }

  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;

  final _ctrUser = TextEditingController();
  final _ctrPass = TextEditingController();

  Future<User>? _futureUser;
  bool _pushlogged = false;
  String _pushname = "";
  late bool enableObsecureText;
  bool passwordVisible = false;

  Widget _button(String txtbutton, double opacity) {
    return ButtonWidget(
        textbutton: txtbutton,
        opacity: opacity,
        onClick: () {
          if (txtbutton == "Login") {
            _postLogin(context);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    if (_pushlogged) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  _goLoggin(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                ),
                child: const Text(
                  'Sign in',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  'as $_pushname',
                ))
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background-login.png"),
                fit: BoxFit.cover),
          ),
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Column(children: [
                    Image.asset(
                      "assets/logo.png",
                      height: 100,
                    ),
                    const Text('Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "roboto",
                          fontSize: 18,
                        )),
                  ])),
              const SizedBox(
                height: 60,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text("Email",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)))),
                        TextFormField(
                          controller: _ctrUser,
                          validator: (value) => EmailValidator.validate(value!)
                              ? null
                              : "Please enter a valid email",
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter your email',
                            prefixIcon: const Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text("Password",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)))),
                        TextFormField(
                          controller: _ctrPass,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          maxLines: 1,
                          obscureText: !passwordVisible,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.lock),
                            hintText: 'Enter your password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text('Forgot Password?'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _button("Login", 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignupApp()),
                                );
                              },
                              child: const Text('Sign up'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      );
    }
  }

  void _postLogin(BuildContext conntext) {
    String user = _ctrUser.text;
    String pass = _ctrPass.text;

    postLogin(user, pass).then((value) async {
      print('value is--> ' + json.encode(value));
      // Obtain shared preferences.

      final prefs = await SharedPreferences.getInstance();

      // Save an String value to 'action' key.
      await prefs.setString('id', value.id);
      await prefs.setString('ucode', value.ucode);
      await prefs.setString('rcode', value.rcode);
      await prefs.setString('header', value.header);
      await prefs.setString('profile', value.profile);
      await prefs.setString('timezone', value.timezone ?? 'Asia/Makassar');
      await prefs.setString('nickname', value.nickname);
      await prefs.setBool('firstprofile', value.firstprofile ?? false);
      await prefs.setBool('logged', true);

      _goLoggin(context);
    }, onError: (error) {
      print(error);
    });
  }

  Future<void> _goLoggin(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? logged = prefs.getBool('logged');
    String? loggedname = prefs.getString('nickname');
    bool? firstprofile = prefs.getBool('firstprofile');

    if (logged != null && logged == true && firstprofile == false) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  const HomeCiakPage(title: 'Ciak')));
    } else if (firstprofile != false) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  const FirstProfilePage(title: 'Ciak')));
    }
    // do nothing
  }

  void doLogged() async {
    print('checking pref');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? logged = prefs.getBool('logged');
    String? loggedname = prefs.getString('nickname');

    if (logged != null && logged == true) {
      setState(() {
        _pushlogged = true;
        _pushname = loggedname ?? "User";
      });
    } else {}
    // do nothing
  }
}
