import 'package:ciak_live/controller/profile_ciak.dart';
import 'package:ciak_live/screen/ciak/list_screen.dart';
import 'package:ciak_live/screen/ciak/post_screen.dart';
import 'package:ciak_live/widget/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen-alt.dart';

class OtherProfileCiakPage extends StatefulWidget {
  const OtherProfileCiakPage(
      {Key? key, required this.title, required this.ucode})
      : super(key: key);
  final String title;
  final String ucode;

  @override
  State<OtherProfileCiakPage> createState() => _OtherProfileCiakPage();
}

class _OtherProfileCiakPage extends State<OtherProfileCiakPage> {
  var _myProfileData;

  @override
  void initState() {
    super.initState();
    print('checking ${widget.ucode}');
    _getData(widget.ucode);
    setState(() {});
  }

  bool isLoaded = false;
  var dataFeeds;
  var dataPublic;
  var dataPrivate;
  var dataSpecial;
  var dataDownload;
  var dataRandom;
  var dataProfile;
  var dataStatus;
  var dataUnread;
  var dataNotif;

  int _selectedIndex = 0;
  String _selectedMenu = '';

  Widget _buttonSubs(String txtbutton, double opacity) {
    return ButtonWidget(
        textbutton: txtbutton, opacity: opacity, onClick: () {});
  }

  Widget _buttonProfile(String txtbutton, double opacity) {
    return ButtonWidget(
        textbutton: txtbutton, opacity: opacity, onClick: () {});
  }

  Widget _mediaTabs() {
    return Expanded(
      child: DefaultTabController(
        length: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              color: Colors.blue,
              constraints: BoxConstraints.expand(height: 50),
              child: TabBar(tabs: [
                Tab(text: "Public"),
                Tab(text: "Private"),
                Tab(text: "Special"),
                Tab(text: "Download"),
                Tab(text: "VS"),
              ]),
            ),
            Expanded(
              child: TabBarView(children: [
                _mediaTabPublic(),
                _mediaTabPrivate(),
                _mediaTabSpecial(),
                _mediaTabDownload(),
                _mediaTabVS(),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _mediaTabPublic() {
    return AlignedGridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 3,
      crossAxisSpacing: 3,
      itemCount: 50,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.amber,
          child: Text('$index'),
        );
      },
    );
  }

  Widget _mediaTabPrivate() {
    return AlignedGridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 3,
      crossAxisSpacing: 3,
      itemCount: 50,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.red,
          child: Text('$index'),
        );
      },
    );
  }

  Widget _mediaTabSpecial() {
    return AlignedGridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 3,
      crossAxisSpacing: 3,
      itemCount: 50,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue,
          child: Text('$index'),
        );
      },
    );
  }

  Widget _mediaTabDownload() {
    return AlignedGridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 3,
      crossAxisSpacing: 3,
      itemCount: 50,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.green,
          child: Text('$index'),
        );
      },
    );
  }

  Widget _mediaTabVS() {
    return AlignedGridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 3,
      crossAxisSpacing: 3,
      itemCount: 50,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.purple,
          child: Text('$index'),
        );
      },
    );
  }

  Widget _showProfile(
      var dataFeeds,
      var dataPublic,
      var dataPrivate,
      var dataSpecial,
      var dataDownload,
      var dataRandom,
      var dataProfile,
      var dataStatus,
      var dataUnread,
      var dataNotif) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(dataProfile['header']),
                  fit: BoxFit.cover)),
          child: Container(
            width: double.infinity,
            height: 150,
            child: Container(
              alignment: Alignment(0.0, 2.5),
              child: CircleAvatar(
                backgroundImage: NetworkImage(dataProfile['profile']),
                radius: 60.0,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 60,
        ),
        Text(
          dataProfile['nickname'],
          style: TextStyle(
              fontSize: 25.0,
              color: Colors.blueGrey,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          dataProfile['job'],
          style: TextStyle(
              fontSize: 18.0,
              color: Colors.black45,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          dataProfile['bio'],
          style: TextStyle(
              fontSize: 15.0,
              color: Colors.black45,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.pink, Colors.redAccent]),
                  borderRadius: BorderRadius.circular(80.0),
                ),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 100.0,
                    maxHeight: 40.0,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Follow",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.pink, Colors.redAccent]),
                  borderRadius: BorderRadius.circular(80.0),
                ),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 100.0,
                    maxHeight: 40.0,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Sub 1",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.pink, Colors.redAccent]),
                  borderRadius: BorderRadius.circular(80.0),
                ),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 100.0,
                    maxHeight: 40.0,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Sub 2",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.pink, Colors.redAccent]),
                  borderRadius: BorderRadius.circular(80.0),
                ),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 100.0,
                    maxHeight: 40.0,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Sub 3",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        _mediaTabs(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            child: isLoaded == true
                ? _showProfile(
                    dataFeeds,
                    dataPublic,
                    dataPrivate,
                    dataSpecial,
                    dataDownload,
                    dataRandom,
                    dataProfile,
                    dataStatus,
                    dataUnread,
                    dataNotif)
                : const Center(child: CircularProgressIndicator()),
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
    } else if (_selectedIndex == 4) {}
  }

  Future<void> _getData(var p_ucode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? id = prefs.getString('id');
    String? ucode = p_ucode;
    String? rcode = prefs.getString('rcode');
    String? header = prefs.getString('header');
    String? profile = prefs.getString('profile');
    String? nickname = prefs.getString('nickname');
    String? timezone = prefs.getString('timezone');

    print(id);
    print(ucode);
    print(rcode);
    print(header);
    print(profile);
    print(nickname);
    print(timezone);

    // SharedPreferences prefs = await SharedPreferences.getInstance();

    // String? id = await prefs.getString('id');
    // String? ucode = await prefs.getString('ucode');
    // String? rcode = await prefs.getString('rcode');
    // String? header = await prefs.getString('header');
    // String? profile = await prefs.getString('profile');
    // String? nickname = await prefs.getString('nickname');
    // String? timezone = await prefs.getString('timezone');

    getOtherProfileData(
            id!, ucode!, rcode!, header!, profile!, nickname!, timezone!)
        .then((value) async {
      // print('value is--> ' + json.encode(value['error']));
      // var reponse = json.encode(value['error']);
      setState(() {
        dataFeeds = value['error']['post'];
        dataPublic = value['error']['media_public'];
        dataPrivate = value['error']['media_private'];
        dataSpecial = value['error']['media_special'];
        dataDownload = value['error']['media_download'];
        dataRandom = value['error']['random'];
        dataProfile = value['error']['profile'];
        dataStatus = value['error']['status'];
        dataUnread = value['error']['unread'];
        dataNotif = value['error']['newnotif'];
        isLoaded = true;
      });

      print(dataFeeds);
      print(isLoaded);
    }, onError: (error) {
      print(error);
    });
  }
}
