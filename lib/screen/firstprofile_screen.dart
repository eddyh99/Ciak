import 'dart:io';

import 'package:ciak_live/screen/ciak/home_screen-alt.dart';
import 'package:ciak_live/screen/referal_screen.dart';
import 'package:ciak_live/widget/button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:ciak_live/controller/ciak.dart';
import 'package:ciak_live/controller/data_user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class FirstProfilePage extends StatefulWidget {
  const FirstProfilePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<FirstProfilePage> createState() => _FirstProfileState();
}

class _FirstProfileState extends State<FirstProfilePage> {
  @override
  void initState() {
    super.initState();
    print('checking pref');
    doLogged();
    setState(() {});
  }

  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;

  List<XFile>? _imageFileList;
  var imgBG;
  var imgProfile;

  void _setImageFileListFromFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
  }

  final _ctrNicname = TextEditingController();
  final _ctrBio = TextEditingController();
  final _ctrWeb = TextEditingController();
  final _ctrEmail = TextEditingController();
  final _ctrContact = TextEditingController();
  final _ctrJob = TextEditingController();
  final _ctrInterest = TextEditingController();
  String _dropdownSexValue = 'Male';
  final _ctrBackground = TextEditingController();
  final _ctrProfile = TextEditingController();

  final ImagePicker _pickerBG = ImagePicker();
  dynamic _pickImageError;

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
          if (txtbutton == "Update Profile") {}
        });
  }

  Widget _putSexDropdown() {
    return DropdownButton<String>(
      value: _dropdownSexValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      onChanged: (String? newValue) {
        setState(() {
          _dropdownSexValue = newValue!;
        });
      },
      items: <String>['Male', 'Female']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _putFormFieldHeader(String text) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text("$text",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))));
  }

  Widget _putFormTextField(TextEditingController ctr, TextInputType type,
      int maxline, String hint, Icon icon) {
    return TextFormField(
      controller: ctr,
      maxLines: maxline,
      keyboardType: type,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        prefixIcon: icon,
      ),
    );
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
                  alignment: Alignment.center,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _putFormFieldHeader('Nickname'),
                        _putFormTextField(
                            _ctrNicname,
                            TextInputType.text,
                            1,
                            "Enter your nickname.",
                            Icon(Icons.person_outlined)),
                        const SizedBox(
                          height: 10,
                        ),
                        _putFormFieldHeader('Bio'),
                        _putFormTextField(_ctrNicname, TextInputType.text, 1,
                            "Enter your bio.", Icon(Icons.lightbulb_sharp)),
                        const SizedBox(
                          height: 10,
                        ),
                        _putFormFieldHeader('Web'),
                        _putFormTextField(_ctrNicname, TextInputType.text, 1,
                            "Enter your web.", Icon(Icons.web)),
                        const SizedBox(
                          height: 10,
                        ),
                        _putFormFieldHeader('Email'),
                        _putFormTextField(_ctrNicname, TextInputType.text, 1,
                            "Enter your email.", Icon(Icons.email)),
                        const SizedBox(
                          height: 10,
                        ),
                        _putFormFieldHeader('Contact'),
                        _putFormTextField(_ctrNicname, TextInputType.text, 1,
                            "Enter your contact.", Icon(Icons.contact_mail)),
                        const SizedBox(
                          height: 10,
                        ),
                        _putFormFieldHeader('Job'),
                        _putFormTextField(_ctrNicname, TextInputType.text, 1,
                            "Enter your job.", Icon(Icons.person_pin_sharp)),
                        const SizedBox(
                          height: 10,
                        ),
                        _putFormFieldHeader('Interest'),
                        _putFormTextField(_ctrNicname, TextInputType.text, 1,
                            "Enter your interest.", Icon(Icons.interests)),
                        const SizedBox(
                          height: 10,
                        ),
                        _putFormFieldHeader('Sex'),
                        _putSexDropdown(),
                        const SizedBox(
                          height: 10,
                        ),
                        _putFormFieldHeader('Choose Background Photo'),
                        imgBG == null
                            ? ElevatedButton(
                                onPressed: () {
                                  _onImageButtonPressed('bg');
                                },
                                child: Text("PICK FROM GALLERY"),
                              )
                            : Container(
                                child: Image.file(
                                imgProfile,
                                fit: BoxFit.cover,
                              )),
                        const SizedBox(
                          height: 10,
                        ),
                        _putFormFieldHeader('Choose Profile Photo'),
                        imgProfile == null
                            ? ElevatedButton(
                                onPressed: () {
                                  _onImageButtonPressed('profile');
                                },
                                child: Text("PICK FROM GALLERY"),
                              )
                            : Container(
                                child: Image.file(
                                imgProfile,
                                fit: BoxFit.cover,
                              )),
                        const SizedBox(
                          height: 10,
                        ),
                        _button("Update Profile", 1),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      );
    }
  }

  Future<void> _goLoggin(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? logged = prefs.getBool('logged');
    String? loggedname = prefs.getString('nickname');

    if (logged != null && logged == true) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  const HomeCiakPage(title: 'Ciak')));
    } else {}
    // do nothing
  }

  void doLogged() async {
    print('checking pref');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firstprofile = prefs.getBool('firstprofile');
    String? loggedname = prefs.getString('nickname');

    if (firstprofile == false) {
      setState(() {
        _pushlogged = true;
        _pushname = loggedname ?? "User";
      });
    } else {}
    // do nothing
  }

  Future<void> _onImageButtonPressed(String type) async {
    if (type == "bg") {
      PickedFile? pickedFile =
          await ImagePicker().getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          imgBG = File(pickedFile.path);
        });
      }
    } else if (type == "profile") {
      PickedFile? pickedFile =
          await ImagePicker().getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          imgProfile = File(pickedFile.path);
        });
      }
    }
  }
}
