import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ciak_live/controller/profile_ciak.dart';
import 'package:ciak_live/screen/ciak/list_screen.dart';
import 'package:ciak_live/screen/ciak/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import 'home_screen-alt.dart';

class ProfileCiakPage extends StatefulWidget {
  const ProfileCiakPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ProfileCiakPage> createState() => _ProfileCiakPage();
}

class _ProfileCiakPage extends State<ProfileCiakPage> {
  var _myProfileData;

  @override
  void initState() {
    super.initState();
    print('checking pref profile');
    _getData();
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

  Widget _mediaTabs() {
    return DefaultTabController(
      length: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                const Tab(icon: Icon(Icons.grid_4x4)),
                const Tab(icon: Icon(Icons.card_membership)),
                const Tab(icon: Icon(Icons.lock)),
                const Tab(icon: Icon(Icons.download)),
                Tab(icon: Image.asset("assets/vs.png")),
              ]),
          SizedBox(
            //Add this to give height
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
              _mediaTabPublic(),
              _mediaTabPrivate(),
              _mediaTabSpecial(),
              _mediaTabDownload(),
              _mediaTabVS(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _mediaTabPublic() {
    List<dynamic> datapublic = [];
    for (var i = 0; i < dataFeeds.length; i++) {
      if ((dataFeeds[i]["type"] == "public") &&
          (dataFeeds[i]["status"] != "deleted")) {
        datapublic.add(dataFeeds[i]);
      }
    }

    return Container(
      color: Colors.transparent,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: datapublic.isNotEmpty ? datapublic.length : 0,
          itemBuilder: (context, index) {
            var ucode = datapublic[index]["ucode"];
            var profile_image = datapublic[index]['profile'];
            var user_nickname = datapublic[index]['nickname'];
            var post_price = datapublic[index]['post_price'];
            var post_currency = datapublic[index]['post_currency'];
            var media = datapublic[index]['media'];
            var mediaTotal = media.isNotEmpty ? media.length : 0;
            var isBuyed;
            var desc = datapublic[index]['description'];
            List<String> videoList = [];
            List<String> imageList = [];

            for (var i = 0; i < mediaTotal; i++) {
              if ((media[i]['type'] == "video/mp4") ||
                  (media[i]['type'] == "video/quicktime")) {
                videoList.add(media[i]['media']);
              } else if (media[i]['type'] == "image/jpeg") {
                imageList.add(media[i]['media']);
              }
            }
            return Card(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Row(children: [
                        CircleAvatar(
                          radius: 20.0,
                          backgroundImage:
                              NetworkImage('https://ciak.live/$profile_image'),
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('$user_nickname',
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              const Text(
                                '10m ago',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(flex: 2),
                        isBuyed == false
                            ? IconButton(
                                icon: Image.asset("assets/cart.png"),
                                tooltip: 'Buy Content',
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Center(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 40),
                                                child: const Text("\$2.00",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.blue)),
                                              ),
                                            ),
                                            Center(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: const Text(
                                                    "Are you sure to buy this post?",
                                                    style: TextStyle(
                                                        fontSize: 20)),
                                              ),
                                            ),
                                            Center(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 5, bottom: 30),
                                                child: SizedBox(
                                                    height: 30.0,
                                                    width: 140.0,
                                                    child: DecoratedBox(
                                                      decoration: const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20)),
                                                          color: Colors.orange),
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                          'Confirmed',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            )
                                          ],
                                        );
                                      });
                                },
                              )
                            : IconButton(
                                icon: Image.asset("assets/download.png"),
                                tooltip: 'Buy Post',
                                onPressed: () {},
                              ),
                        IconButton(
                          icon: Image.asset("assets/tip.png"),
                          tooltip: 'Tip',
                          onPressed: () {},
                        ),
                        PopupMenuButton(
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry>[
                                  const PopupMenuItem(
                                    child: Text('Show post'),
                                  ),
                                  const PopupMenuItem(
                                    child: Text('Report this post'),
                                  ),
                                ]),
                      ]),
                      Html(data: "$desc"),
                      imageList.isNotEmpty
                          ? CarouselSlider(
                              options: CarouselOptions(),
                              items: imageList
                                  .map(
                                    (item) => Center(
                                        child: Image.network(
                                            'https://api.ciak.live/display/showimage/${item}',
                                            fit: BoxFit.cover,
                                            width: 1000)),
                                  )
                                  .toList(),
                            )
                          : Container(),
                      videoList.isNotEmpty
                          ? CarouselSlider(
                              options: CarouselOptions(),
                              items: videoList
                                  .map(
                                    (item) => Center(
                                      child: VideoPlayer(
                                          VideoPlayerController.network(
                                              "https://api.ciak.live/display/showvideo/${item}")),
                                    ),
                                  )
                                  .toList(),
                            )
                          : Container(),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_outline),
                            tooltip: 'Like',
                            onPressed: () {},
                          ),
                          const Text('100'),
                          RatingBar.builder(
                            itemSize: 20,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset("assets/vs.png"),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.bookmark_border_outlined),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ])));
          }),
    );
  }

  Widget _mediaTabPrivate() {
    List<dynamic> dataprivate = [];
    for (var i = 0; i < dataFeeds.length; i++) {
      if ((dataFeeds[i]["type"] == "private") &&
          (dataFeeds[i]["status"] != "deleted")) {
        dataprivate.add(dataFeeds[i]);
      }
    }

    return Container(
      color: Colors.transparent,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: dataprivate.isNotEmpty ? dataprivate.length : 0,
          itemBuilder: (context, index) {
            var ucode = dataprivate[index]["ucode"];
            var profile_image = dataprivate[index]['profile'];
            var user_nickname = dataprivate[index]['nickname'];
            var post_price = dataprivate[index]['post_price'];
            var post_currency = dataprivate[index]['post_currency'];
            var media = dataprivate[index]['media'];
            var mediaTotal = media.isNotEmpty ? media.length : 0;
            var isBuyed;
            var desc = dataprivate[index]['description'];
            List<String> videoList = [];
            List<String> imageList = [];

            for (var i = 0; i < mediaTotal; i++) {
              if ((media[i]['type'] == "video/mp4") ||
                  (media[i]['type'] == "video/quicktime")) {
                videoList.add(media[i]['media']);
              } else if (media[i]['type'] == "image/jpeg") {
                imageList.add(media[i]['media']);
              }
            }
            return Card(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Row(children: [
                        CircleAvatar(
                          radius: 20.0,
                          backgroundImage:
                              NetworkImage('https://ciak.live/$profile_image'),
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('$user_nickname',
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              const Text(
                                '10m ago',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(flex: 2),
                        isBuyed == false
                            ? IconButton(
                                icon: Image.asset("assets/cart.png"),
                                tooltip: 'Buy Content',
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Center(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 40),
                                                child: const Text("\$2.00",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.blue)),
                                              ),
                                            ),
                                            Center(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: const Text(
                                                    "Are you sure to buy this post?",
                                                    style: TextStyle(
                                                        fontSize: 20)),
                                              ),
                                            ),
                                            Center(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 5, bottom: 30),
                                                child: SizedBox(
                                                    height: 30.0,
                                                    width: 140.0,
                                                    child: DecoratedBox(
                                                      decoration: const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20)),
                                                          color: Colors.orange),
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                          'Confirmed',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            )
                                          ],
                                        );
                                      });
                                },
                              )
                            : IconButton(
                                icon: Image.asset("assets/download.png"),
                                tooltip: 'Buy Post',
                                onPressed: () {},
                              ),
                        IconButton(
                          icon: Image.asset("assets/tip.png"),
                          tooltip: 'Tip',
                          onPressed: () {},
                        ),
                        PopupMenuButton(
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry>[
                                  const PopupMenuItem(
                                    child: Text('Show post'),
                                  ),
                                  const PopupMenuItem(
                                    child: Text('Report this post'),
                                  ),
                                ]),
                      ]),
                      Html(data: "$desc"),
                      imageList.isNotEmpty
                          ? CarouselSlider(
                              options: CarouselOptions(),
                              items: imageList
                                  .map(
                                    (item) => Center(
                                        child: Image.network(
                                            'https://api.ciak.live/display/showimage/${item}',
                                            fit: BoxFit.cover,
                                            width: 1000)),
                                  )
                                  .toList(),
                            )
                          : Container(),
                      videoList.isNotEmpty
                          ? CarouselSlider(
                              options: CarouselOptions(),
                              items: videoList
                                  .map(
                                    (item) => Center(
                                      child: VideoPlayer(
                                          VideoPlayerController.network(
                                              "https://api.ciak.live/display/showvideo/${item}")),
                                    ),
                                  )
                                  .toList(),
                            )
                          : Container(),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_outline),
                            tooltip: 'Like',
                            onPressed: () {},
                          ),
                          const Text('100'),
                          RatingBar.builder(
                            itemSize: 20,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset("assets/vs.png"),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.bookmark_border_outlined),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ])));
          }),
    );
  }

  Widget _mediaTabSpecial() {
    List<dynamic> dataspecial = [];
    for (var i = 0; i < dataFeeds.length; i++) {
      if ((dataFeeds[i]["type"] == "special") &&
          (dataFeeds[i]["status"] != "deleted")) {
        dataspecial.add(dataFeeds[i]);
      }
    }

    return Container(
      color: Colors.transparent,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: dataspecial.isNotEmpty ? dataspecial.length : 0,
          itemBuilder: (context, index) {
            var ucode = dataspecial[index]["ucode"];
            var profile_image = dataspecial[index]['profile'];
            var user_nickname = dataspecial[index]['nickname'];
            var post_price = dataspecial[index]['post_price'];
            var post_currency = dataspecial[index]['post_currency'];
            var media = dataspecial[index]['media'];
            var mediaTotal = media.isNotEmpty ? media.length : 0;
            var isBuyed;
            var desc = dataspecial[index]['description'];
            List<String> videoList = [];
            List<String> imageList = [];

            for (var i = 0; i < mediaTotal; i++) {
              if ((media[i]['type'] == "video/mp4") ||
                  (media[i]['type'] == "video/quicktime")) {
                videoList.add(media[i]['media']);
              } else if (media[i]['type'] == "image/jpeg") {
                imageList.add(media[i]['media']);
              }
            }
            return Card(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Row(children: [
                        CircleAvatar(
                          radius: 20.0,
                          backgroundImage:
                              NetworkImage('https://ciak.live/$profile_image'),
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('$user_nickname',
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              const Text(
                                '10m ago',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(flex: 2),
                        isBuyed == false
                            ? IconButton(
                                icon: Image.asset("assets/cart.png"),
                                tooltip: 'Buy Content',
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Center(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 40),
                                                child: const Text("\$2.00",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.blue)),
                                              ),
                                            ),
                                            Center(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: const Text(
                                                    "Are you sure to buy this post?",
                                                    style: TextStyle(
                                                        fontSize: 20)),
                                              ),
                                            ),
                                            Center(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 5, bottom: 30),
                                                child: SizedBox(
                                                    height: 30.0,
                                                    width: 140.0,
                                                    child: DecoratedBox(
                                                      decoration: const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20)),
                                                          color: Colors.orange),
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                          'Confirmed',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            )
                                          ],
                                        );
                                      });
                                },
                              )
                            : IconButton(
                                icon: Image.asset("assets/download.png"),
                                tooltip: 'Buy Post',
                                onPressed: () {},
                              ),
                        IconButton(
                          icon: Image.asset("assets/tip.png"),
                          tooltip: 'Tip',
                          onPressed: () {},
                        ),
                        PopupMenuButton(
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry>[
                                  const PopupMenuItem(
                                    child: Text('Show post'),
                                  ),
                                  const PopupMenuItem(
                                    child: Text('Report this post'),
                                  ),
                                ]),
                      ]),
                      Html(data: "$desc"),
                      imageList.isNotEmpty
                          ? CarouselSlider(
                              options: CarouselOptions(),
                              items: imageList
                                  .map(
                                    (item) => Center(
                                        child: Image.network(
                                            'https://api.ciak.live/display/showimage/${item}',
                                            fit: BoxFit.cover,
                                            width: 1000)),
                                  )
                                  .toList(),
                            )
                          : Container(),
                      videoList.isNotEmpty
                          ? CarouselSlider(
                              options: CarouselOptions(),
                              items: videoList
                                  .map(
                                    (item) => Center(
                                      child: VideoPlayer(
                                          VideoPlayerController.network(
                                              "https://api.ciak.live/display/showvideo/${item}")),
                                    ),
                                  )
                                  .toList(),
                            )
                          : Container(),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_outline),
                            tooltip: 'Like',
                            onPressed: () {},
                          ),
                          const Text('100'),
                          RatingBar.builder(
                            itemSize: 20,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset("assets/vs.png"),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.bookmark_border_outlined),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ])));
          }),
    );
  }

  Widget _mediaTabDownload() {
    List<dynamic> datadownload = [];
    for (var i = 0; i < dataFeeds.length; i++) {
      if ((dataFeeds[i]["type"] == "download") &&
          (dataFeeds[i]["status"] != "deleted")) {
        datadownload.add(dataFeeds[i]);
      }
    }

    return Container(
      color: Colors.transparent,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: datadownload.isNotEmpty ? datadownload.length : 0,
          itemBuilder: (context, index) {
            var ucode = datadownload[index]["ucode"];
            var profile_image = datadownload[index]['profile'];
            var user_nickname = datadownload[index]['nickname'];
            var post_price = datadownload[index]['post_price'];
            var post_currency = datadownload[index]['post_currency'];
            var media = datadownload[index]['media'];
            var mediaTotal = media.isNotEmpty ? media.length : 0;
            var isBuyed;
            var desc = datadownload[index]['description'];
            List<String> videoList = [];
            List<String> imageList = [];

            for (var i = 0; i < mediaTotal; i++) {
              if ((media[i]['type'] == "video/mp4") ||
                  (media[i]['type'] == "video/quicktime")) {
                videoList.add(media[i]['media']);
              } else if (media[i]['type'] == "image/jpeg") {
                imageList.add(media[i]['media']);
              }
            }
            return Card(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Row(children: [
                        CircleAvatar(
                          radius: 20.0,
                          backgroundImage:
                              NetworkImage('https://ciak.live/$profile_image'),
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('$user_nickname',
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              const Text(
                                '10m ago',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(flex: 2),
                        isBuyed == false
                            ? IconButton(
                                icon: Image.asset("assets/cart.png"),
                                tooltip: 'Buy Content',
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Center(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 40),
                                                child: const Text("\$2.00",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.blue)),
                                              ),
                                            ),
                                            Center(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: const Text(
                                                    "Are you sure to buy this post?",
                                                    style: TextStyle(
                                                        fontSize: 20)),
                                              ),
                                            ),
                                            Center(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 5, bottom: 30),
                                                child: SizedBox(
                                                    height: 30.0,
                                                    width: 140.0,
                                                    child: DecoratedBox(
                                                      decoration: const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20)),
                                                          color: Colors.orange),
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                          'Confirmed',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            )
                                          ],
                                        );
                                      });
                                },
                              )
                            : IconButton(
                                icon: Image.asset("assets/download.png"),
                                tooltip: 'Buy Post',
                                onPressed: () {},
                              ),
                        IconButton(
                          icon: Image.asset("assets/tip.png"),
                          tooltip: 'Tip',
                          onPressed: () {},
                        ),
                        PopupMenuButton(
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry>[
                                  const PopupMenuItem(
                                    child: Text('Show post'),
                                  ),
                                  const PopupMenuItem(
                                    child: Text('Report this post'),
                                  ),
                                ]),
                      ]),
                      Html(data: "$desc"),
                      imageList.isNotEmpty
                          ? CarouselSlider(
                              options: CarouselOptions(),
                              items: imageList
                                  .map(
                                    (item) => Center(
                                        child: Image.network(
                                            'https://api.ciak.live/display/showimage/${item}',
                                            fit: BoxFit.cover,
                                            width: 1000)),
                                  )
                                  .toList(),
                            )
                          : Container(),
                      videoList.isNotEmpty
                          ? CarouselSlider(
                              options: CarouselOptions(),
                              items: videoList
                                  .map(
                                    (item) => Center(
                                      child: VideoPlayer(
                                          VideoPlayerController.network(
                                              "https://api.ciak.live/display/showvideo/${item}")),
                                    ),
                                  )
                                  .toList(),
                            )
                          : Container(),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_outline),
                            tooltip: 'Like',
                            onPressed: () {},
                          ),
                          const Text('100'),
                          RatingBar.builder(
                            itemSize: 20,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset("assets/vs.png"),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.bookmark_border_outlined),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ])));
          }),
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
    log(dataFeeds.toString());
    return Column(
      children: [
        Stack(
          children: [
            Image.network('https://ciak.live/' + dataProfile['header'],
                height: 150, fit: BoxFit.cover),
            Container(
              margin: const EdgeInsets.only(top: 75),
              width: double.infinity,
              height: 150,
              child: Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://ciak.live/' + dataProfile['profile']),
                  radius: 60.0,
                ),
              ),
            ),
          ],
        ),
        Text(
          dataProfile['nickname'],
          style: const TextStyle(
              fontSize: 18.0,
              color: Colors.blueGrey,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w400),
        ),
        Text(
          dataProfile['job'],
          style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black45,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w300),
        ),
        Html(data: dataProfile['bio']),
        Text(
          dataProfile['interest'] ?? "",
          style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black45,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w300),
        ),
        Text(
          dataProfile['web'] ?? "",
          style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black45,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w300),
        ),
        Text(
          dataProfile['kontak'] ?? "",
          style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black45,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w300),
        ),
        Text(
          dataProfile['email'] ?? "",
          style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black45,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w300),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                  ),
                  child: const Text("Edit Subsription"),
                )),
            SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                  ),
                  child: const Text("Edit Profile"),
                ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        _mediaTabs(),
        // AppBar(
        //   bottom: TabBar(
        //     tabs: [
        //       Tab(
        //         text: 'State',
        //       ),
        //       Tab(
        //         text: 'Mission',
        //       ),
        //       Tab(
        //         text: 'Rocket',
        //       )
        //     ],
        //   ),
        // ),
        // Expanded(
        //   child: TabBarView(
        //     children: [
        //       Text(
        //         'Tab 1',
        //       ),
        //       Text('Tab 2'),
        //       Text('Tab 3')
        //     ],
        //   ),
        // )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoaded == true
            ? SingleChildScrollView(
                child: _showProfile(
                    dataFeeds,
                    dataPublic,
                    dataPrivate,
                    dataSpecial,
                    dataDownload,
                    dataRandom,
                    dataProfile,
                    dataStatus,
                    dataUnread,
                    dataNotif))
            : const SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Center(child: CircularProgressIndicator())),
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

  Future<void> _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? id = prefs.getString('id');
    String? ucode = "";
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

    getMyProfileData(
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
