import 'dart:developer';
import 'package:ciak_live/controller/list_fans.dart';
import 'package:ciak_live/screen/ciak/profile_other_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListfansPage extends StatefulWidget {
  const ListfansPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ListfansPage> createState() => _ListfansPageState();
}

class _ListfansPageState extends State<ListfansPage> {
  List<dynamic> datalist = [];

  @override
  void initState() {
    super.initState();
    print('checking pref profile');
    _getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent, // 1
          elevation: 0,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(5),
                primary: Colors.transparent,
              ),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            const Padding(
                padding: EdgeInsets.only(right: 10),
                child:
                    Text("Fans List", style: TextStyle(color: Colors.black))),
          ])),
      body: SafeArea(
        child: SingleChildScrollView(
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: datalist.length,
                itemBuilder: (context, index) {
                  var ucode = datalist[index]["ucode"];
                  var profile_image = datalist[index]['profile'];
                  var user_nickname = datalist[index]['nickname'];
                  return Card(
                      child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundImage:
                            NetworkImage('https://ciak.live/$profile_image'),
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) =>
                                    OtherProfileCiakPage(
                                      title: 'Check Profile',
                                      ucode: '$ucode',
                                    )),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('$user_nickname',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                    ]),
                  ));
                })),
      ),
    );
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

    getFans(id!, ucode!, rcode!, header!, profile!, nickname!, timezone!).then(
        (value) async {
      // print('value is--> ' + json.encode(value['error']));
      // var reponse = json.encode(value['error']);
      setState(() {
        datalist = value;
      });
      log(datalist.toString());
    }, onError: (error) {
      print(error);
    });
  }
}
