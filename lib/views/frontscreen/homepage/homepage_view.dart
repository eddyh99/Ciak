import 'package:flutter/material.dart';

import 'package:ciak_app/utils/functions.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() {
    return _HomepageState();
  }
}

class _HomepageState extends State<Homepage> {
  Future<void> getUser() async {
    var data = await readPrefStr("logged");
    printDebug(data);
    // setState(() {
    //   memberid = name["memberid"];
    // });
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "HOMEPAGE",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
