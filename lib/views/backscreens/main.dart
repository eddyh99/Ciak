import 'package:ciak_live/views/backscreens/activity_view.dart';
import 'package:ciak_live/views/backscreens/feeds_view.dart';
import 'package:ciak_live/views/backscreens/profile_view.dart';
import 'package:ciak_live/views/backscreens/wallet_view.dart';
import 'package:ciak_live/widgets/backscreens/footermenu_widget.dart';
import 'package:ciak_live/widgets/backscreens/keepalivepage_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackScreenMain extends StatefulWidget {
  const BackScreenMain({super.key});

  @override
  State<BackScreenMain> createState() {
    return _BackScreenMainState();
  }
}

class _BackScreenMainState extends State<BackScreenMain> {
  final PageController _pageController = PageController();

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              pageIndex = value;
            });
          },
          children: const [
            KeepAlivePage(child: FeedsView()),
            KeepAlivePage(child: ActivityView()),
            KeepAlivePage(child: WalletView()),
            KeepAlivePage(child: ProfileView()),
          ],
        ),
      ),
      bottomNavigationBar: FooterMenu(
        controller: _pageController,
        currentIndex: pageIndex,
        onMainButtonPressed: () =>
            Get.toNamed("/back-screen/create-post"), //create-post
      ),
    );
  }
}
