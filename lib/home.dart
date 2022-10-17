import 'package:ciak_live/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  DateTime pre_backpress = DateTime.now();

  Future<bool> onWillPop() async {
    final timegap = DateTime.now().difference(pre_backpress);
    final cantExit = timegap >= const Duration(seconds: 2);
    pre_backpress = DateTime.now();
    if (cantExit) {
      //show snackbar
      const snack = SnackBar(
        content: Text('Press Back button again to Exit'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
      return false;
    } else {
      SystemNavigator.pop();
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return WillPopScope(
        onWillPop: onWillPop,
        child: MaterialApp(
          title: 'Ciak Live',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LoginPage(title: 'Ciak'),
          // home: const HomeCiakPage(title: 'Ciak'),
        ));
  }
}
