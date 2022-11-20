import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/backscreens/profile_avatar_widget.dart';
import 'package:ciak_live/widgets/backscreens/tile_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityDetailView extends StatefulWidget {
  const ActivityDetailView({super.key});

  @override
  State<ActivityDetailView> createState() {
    return _ActivityDetailView();
  }
}

class _ActivityDetailView extends State<ActivityDetailView> {
  final Activity _activity = Get.arguments["activity"];
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
        title: Text(_activity.title ?? ""),
      ),
      body: SafeArea(
        child: FractionallySizedBox(
          heightFactor: 1.0,
          widthFactor: 1.0,
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: Future.delayed(const Duration(seconds: 3), () {}),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (int x = 0; x < 10; x++) ...[
                        ListTile(
                          leading: GestureDetector(
                            onTap: () {
                              Get.toNamed("/back-screen/users-profile",
                                  arguments: {"userId": "rebec123"});
                            },
                            child: ProfileAvatar(
                              image: Image.asset("assets/images/people-2.jpg"),
                              radius: 18.sp,
                            ),
                          ),
                          title: const Text("Thomas Ukulele"),
                          trailing: IconButton(
                              onPressed: () {},
                              splashRadius: 15.sp,
                              icon: Icon(
                                Icons.close,
                                size: 12.sp,
                              )),
                        ),
                        Divider(
                          indent: 2.w,
                          endIndent: 2.w,
                          thickness: 0.3.h,
                        ),
                      ]
                    ],
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int x = 0; x < 3; x++) ...[
                      const TileShimmer(),
                      Divider(
                        indent: 2.w,
                        endIndent: 2.w,
                        thickness: 0.3.h,
                      ),
                    ]
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
