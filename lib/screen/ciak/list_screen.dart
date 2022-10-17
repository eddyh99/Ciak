import 'dart:developer';

import 'package:ciak_live/controller/data_list.dart';
import 'package:ciak_live/screen/ciak/blocked_screen.dart';
import 'package:ciak_live/screen/ciak/fans_screen.dart';
import 'package:ciak_live/screen/ciak/followed_screen.dart';
import 'package:ciak_live/screen/ciak/following_screen.dart';
import 'package:ciak_live/screen/ciak/home_screen-alt.dart';
import 'package:ciak_live/screen/ciak/post_screen.dart';
import 'package:ciak_live/screen/ciak/profile_screen.dart';
import 'package:ciak_live/screen/ciak/subscribe_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListCiakPage extends StatefulWidget {
  const ListCiakPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ListCiakPage> createState() => _ListCiakPageState();
}

class _ListCiakPageState extends State<ListCiakPage> {
  int _selectedIndex = 0;
  var datafollowing;
  var datafollowers;
  var datafans;
  var datasubscription;
  var databookmarks;
  var datablocked;

  @override
  void initState() {
    super.initState();
    print('checking pref profile');
    _getData();
    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 0) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  const HomeCiakPage(title: 'Ciak')));
    } else if (_selectedIndex == 1) {
    } else if (_selectedIndex == 2) {
      Navigator.of(context).push(
        PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) => const PostCiakPage(
                  title: 'New Post',
                )),
      );
    } else if (_selectedIndex == 3) {
    } else if (_selectedIndex == 4) {
      Navigator.of(context).push(
        PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) => const ProfileCiakPage(
                  title: 'Profile',
                )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
              child: Column(children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) =>
                              const ListfollowingPage(
                                title: 'List Following',
                              )),
                    );
                  },
                  child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Following",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    textAlign: TextAlign.start),
                                const SizedBox(height: 5),
                                Text('$datafollowing',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    textAlign: TextAlign.start)
                              ]))),
                ),
                const Divider(color: Colors.grey),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) =>
                              const ListfollowedPage(
                                title: 'List Following',
                              )),
                    );
                  },
                  child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Followers",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    textAlign: TextAlign.start),
                                const SizedBox(height: 5),
                                Text('$datafollowers',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    textAlign: TextAlign.start)
                              ]))),
                ),
                const Divider(color: Colors.grey),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) =>
                              const ListfansPage(
                                title: 'List Fans',
                              )),
                    );
                  },
                  child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Fans",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    textAlign: TextAlign.start),
                                const SizedBox(height: 5),
                                Text('$datafans',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    textAlign: TextAlign.start)
                              ]))),
                ),
                const Divider(color: Colors.grey),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) =>
                              const ListSubscribePage(
                                title: 'Subscription',
                              )),
                    );
                  },
                  child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Subscriptions",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    textAlign: TextAlign.start),
                                const SizedBox(height: 5),
                                Text('$datasubscription',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    textAlign: TextAlign.start)
                              ]))),
                ),
                const Divider(color: Colors.grey),
                TextButton(
                  onPressed: () {},
                  child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Bookmarks",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    textAlign: TextAlign.start),
                                const SizedBox(height: 5),
                                Text('$databookmarks',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    textAlign: TextAlign.start)
                              ]))),
                ),
                const Divider(color: Colors.grey),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) =>
                              const ListblockedPage(
                                title: 'List Blocked',
                              )),
                    );
                  },
                  child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Blocked Users",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    textAlign: TextAlign.start),
                                const SizedBox(height: 5),
                                Text('$datablocked',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    textAlign: TextAlign.start)
                              ]))),
                ),
                const Divider(color: Colors.grey)
              ]),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted_sharp, color: Colors.black),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add, color: Colors.black),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.wallet_rounded,
                color: Colors.black,
              ),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined, color: Colors.black),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }

  Future<void> _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? id = prefs.getString('id');
    String? ucode = prefs.getString('ucode');
    String? rcode = prefs.getString('rcode');
    String? header = prefs.getString('header');
    String? profile = prefs.getString('profile');
    String? nickname = prefs.getString('nickname');
    String? timezone = prefs.getString('timezone');

    // print(id);
    // print(ucode);
    // print(rcode);
    // print(header);
    // print(profile);
    // print(nickname);
    // print(timezone);

    // SharedPreferences prefs = await SharedPreferences.getInstance();

    // String? id = await prefs.getString('id');
    // String? ucode = await prefs.getString('ucode');
    // String? rcode = await prefs.getString('rcode');
    // String? header = await prefs.getString('header');
    // String? profile = await prefs.getString('profile');
    // String? nickname = await prefs.getString('nickname');
    // String? timezone = await prefs.getString('timezone');

    getListData(id!, ucode!, rcode!, header!, profile!, nickname!, timezone!)
        .then((value) async {
      log(value.toString());
      // print('value is--> ' + json.encode(value['error']));
      // var reponse = json.encode(value['error']);
      setState(() {
        datafollowing = value['error']['following'];
        datafollowers = value['error']['follower'];
        datafans = value['error']['fans'];
        datasubscription = value['error']['subscription'];
        databookmarks = value['error']['bookmark'];
        datablocked = value['error']['blocked'];
      });
    }, onError: (error) {
      print(error);
    });
  }
}
