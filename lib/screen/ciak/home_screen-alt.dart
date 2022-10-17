import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ciak_live/controller/data_home_post.dart';
import 'package:ciak_live/controller/home_ciak.dart';
import 'package:ciak_live/screen/ciak/list_screen.dart';
import 'package:ciak_live/screen/ciak/notif_screen.dart';
import 'package:ciak_live/screen/ciak/post_screen.dart';
import 'package:ciak_live/screen/ciak/profile_other_screen.dart';
import 'package:ciak_live/screen/ciak/profile_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_html/flutter_html.dart';

class HomeCiakPage extends StatefulWidget {
  const HomeCiakPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeCiakPage> createState() => _HomeCiakPageState();
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class JosKeys {
  static final josKeys1 = GlobalKey();
  static final josKeys2 = GlobalKey();
}

class _HomeCiakPageState extends State<HomeCiakPage> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  final _formKey = GlobalKey<FormState>();
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  TextEditingController _fcTips = TextEditingController();

  static final riKey2 = const Key('__RIKEY2__');

  var rememberValue = false;
  int _selectedIndex = 0;
  String _selectedMenu = '';

  List<Postfeed> dataHome = [];
  var dataRandoms;
  var dataFeeds;
  var dataNotif;
  var dataUnread;

  bool isLoaded = false;

  static const IconData add_shopping_cart_rounded =
      IconData(0xf538, fontFamily: 'MaterialIcons');

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 0) {
    } else if (_selectedIndex == 1) {
      Navigator.of(context).push(
        PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) => ListCiakPage(
                  title: 'Notification',
                )),
      );
    } else if (_selectedIndex == 2) {
      Navigator.of(context).push(
        PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) => PostCiakPage(
                  title: 'New Post',
                )),
      );
    } else if (_selectedIndex == 3) {
    } else if (_selectedIndex == 4) {
      Navigator.of(context).push(
        PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) => ProfileCiakPage(
                  title: 'Profile',
                )),
      );
    }
  }

  Future<void> _displayTipDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Send tip?'),
          content: TextField(
            controller: _fcTips,
            decoration: InputDecoration(hintText: "\$2.00"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                print(_fcTips.text);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget homewithdata(var random, var feed, var notif, var unread) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10, left: 10),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 2 / 3 * MediaQuery.of(context).size.width,
              child: TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: const Icon(Icons.search),
              )),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (BuildContext context, _, __) =>
                            const NotifCiakPage(
                              title: 'Notification',
                            )),
                  );
                },
                icon: const Icon(Icons.notifications)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotifCiakPage(
                              title: 'Notification',
                            )),
                  );
                },
                icon: const Icon(Icons.mail)),
          ],
        ),
        Container(
            padding: const EdgeInsets.only(top: 10),
            height: 140,
            child: random.length > 0
                ? ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 3);
                    },
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: random.length,
                    itemBuilder: (context, index) {
                      String profile_image = random[index]['profile'];
                      return Container(
                        height: 140.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(214, 0, 249, 1),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://ciak.live/$profile_image"),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                        child: Stack(alignment: Alignment.center, children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                    opaque: false,
                                    pageBuilder:
                                        (BuildContext context, _, __) =>
                                            OtherProfileCiakPage(
                                              title: 'Check Profile',
                                              ucode: random[index]['ucode'],
                                            )),
                              );
                            },
                          ),
                          Positioned(
                              bottom: 10,
                              child: SizedBox(
                                  height: 30.0,
                                  width: 80.0,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        gradient: const LinearGradient(colors: [
                                          Color.fromRGBO(248, 59, 0, 1),
                                          Color.fromRGBO(248, 153, 106, 1)
                                        ])),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Follow',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )))
                        ]),
                      );
                    })
                : Container()),
        Container(
            padding: const EdgeInsets.only(top: 10),
            child: feed.isNotEmpty
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: feed.isNotEmpty ? feed.length : 0,
                    itemBuilder: (context, index) {
                      var ucode = feed[index]["ucode"];
                      var profile_image = feed[index]['profile'];
                      var user_nickname = feed[index]['nickname'];
                      var post_price = feed[index]['post_price'];
                      var post_currency = feed[index]['post_currency'];
                      var media = feed[index]['media'];
                      var mediaTotal = media.isNotEmpty ? media.length : 0;
                      var isBuyed;
                      var desc = feed[index]['description'];
                      List<String> videoList = [];
                      List<String> imageList = [];

                      for (var i = 0; i < mediaTotal; i++) {
                        if (media[i]['type'] == "video/mp4") {
                          videoList.add(media[i]['media']);
                        } else if (media[i]['type'] == "image/jpeg") {
                          imageList.add(media[i]['media']);
                        }
                      }
                      return Card(
                        child: Column(
                          children: [
                            Text("data"),
                            Text("data2"),
                            Text("data3")
                          ],
                        ),
                      );
                    })
                : Container())
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: isLoaded == true
              ? homewithdata(dataRandoms, dataFeeds, dataNotif, dataUnread)
              : const Center(child: CircularProgressIndicator()),
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

  // API CALL
  Future<void> _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? id = prefs.getString('id');
    String? ucode = prefs.getString('ucode');
    String? rcode = prefs.getString('rcode');
    String? header = prefs.getString('header');
    String? profile = prefs.getString('profile');
    String? nickname = prefs.getString('nickname');
    String? timezone = prefs.getString('timezone');
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    // String? id = await prefs.getString('id');
    // String? ucode = await prefs.getString('ucode');
    // String? rcode = await prefs.getString('rcode');
    // String? header = await prefs.getString('header');
    // String? profile = await prefs.getString('profile');
    // String? nickname = await prefs.getString('nickname');
    // String? timezone = await prefs.getString('timezone');

    getHomeData(id!, ucode!, rcode!, header!, profile!, nickname!, timezone!)
        .then((value) async {
      // print('value is--> ' + json.encode(value['error']));
      // var reponse = json.encode(value['error']);
      setState(() {
        dataFeeds = value['error']['data'];
        dataRandoms = value['error']['random'];
        dataNotif = value['error']['newnotif'];
        dataUnread = value['error']['unread'];
        isLoaded = true;
      });

      // print(dataFeeds);
    }, onError: (error) {
      print(error);
    });
  }
}
