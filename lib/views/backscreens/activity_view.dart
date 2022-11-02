import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/backscreens/activitytile_widget.dart';
import 'package:flutter/material.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FractionallySizedBox(
          heightFactor: 1.0,
          widthFactor: 1.0,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ActivityTile(
                    titleText: "Subscription",
                    subtitleText: "0 Subscriptions",
                    width: 80.w,
                    margin: EdgeInsets.symmetric(vertical: 2.h),
                  ),
                  ActivityTile(
                    titleText: "Following",
                    subtitleText: "0 Followings",
                    width: 80.w,
                    margin: EdgeInsets.symmetric(vertical: 2.h),
                  ),
                  ActivityTile(
                    titleText: "Bookmark",
                    subtitleText: "0 Bookmarks",
                    width: 80.w,
                    margin: EdgeInsets.symmetric(vertical: 2.h),
                  ),
                  ActivityTile(
                    titleText: "Block User",
                    subtitleText: "0 Users blocked",
                    width: 80.w,
                    margin: EdgeInsets.symmetric(vertical: 2.h),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
