import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/backscreens/alerttile_widget.dart';
import 'package:ciak_live/widgets/backscreens/profile_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertView extends StatefulWidget {
  const AlertView({super.key});

  @override
  State<AlertView> createState() {
    return _AlertViewState();
  }
}

class _AlertViewState extends State<AlertView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          padding: const EdgeInsets.all(10.0),
          splashRadius: 25.0,
          onPressed: () {
            Get.back(closeOverlays: true);
          },
          icon: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              radius: 12.sp,
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        title: const Text("Alerts"),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Delete all",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
      body: FractionallySizedBox(
        heightFactor: 1.0,
        widthFactor: 1.0,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: const Text("Today"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AlertTile(
                        leading: ProfileAvatar(
                          image: Image.asset("assets/images/people-4.jpg"),
                          radius: 16.sp,
                        ),
                        leadingTitle: "Money Industrial Factory",
                        trailingTitle: "liked your post.",
                        subtitle: "15m ago",
                      ),
                      const Divider(),
                      AlertTile(
                        leading: ProfileAvatar(
                          image: Image.asset("assets/images/people-2.jpg"),
                          radius: 16.sp,
                        ),
                        leadingTitle: "Thomas, Bob and +5 others",
                        trailingTitle: "liked your post.",
                        subtitle: "30m ago",
                      ),
                      const Divider(),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: const Text("Yesterday"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AlertTile(
                        leading: ProfileAvatar(
                          image: Image.asset("assets/images/people-1.jpg"),
                          radius: 16.sp,
                        ),
                        leadingTitle: "Bob Harley",
                        trailingTitle: "mentioned you in a post.",
                        subtitle: "1d ago",
                      ),
                      const Divider(),
                      AlertTile(
                        leading: ProfileAvatar(
                          image: Image.asset("assets/images/people-3.jpg"),
                          radius: 16.sp,
                        ),
                        leadingTitle: "Rebecca, Thomas and +11 others",
                        trailingTitle: "rated your post.",
                        subtitle: "1d ago",
                      ),
                      const Divider(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
