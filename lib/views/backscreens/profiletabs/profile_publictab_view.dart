import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/utils/functions.dart';
import 'package:ciak_live/widgets/backscreens/gradient_button_widget.dart';
import 'package:ciak_live/widgets/backscreens/postfeed_content_widget.dart';
import 'package:ciak_live/widgets/backscreens/postfeed_footer_widget.dart';
import 'package:ciak_live/widgets/backscreens/postfeed_header_widget.dart';
import 'package:ciak_live/widgets/backscreens/profile_avatar_widget.dart';
import 'package:flutter/material.dart';

class ProfilePublicTabView extends StatefulWidget {
  const ProfilePublicTabView({super.key});

  @override
  State<ProfilePublicTabView> createState() {
    return _ProfilePublicTabViewState();
  }
}

class _ProfilePublicTabViewState extends State<ProfilePublicTabView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        postShimmer(
          SizedBox(
            //Feeds post
            child: Column(
              children: [
                PostFeedHeader(
                  leading: ProfileAvatar(
                    image: Image.asset("assets/images/people-2.jpg"),
                    radius: 16.sp,
                    isLive: true,
                  ),
                  title: "Thomas Ukulele",
                  subtitle: "2h ago",
                  trailing: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                      splashRadius: 15.sp,
                    )
                  ],
                ),
                PostFeedContent(
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Watch my performance now!"),
                      SizedBox(
                        height: 1.h,
                      ),
                      GradientButton(
                        onPressed: () {},
                        text: "Watch now",
                        backgroundColor: Colors.red,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: PostFeedFooter(
                    leading: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_outline,
                            size: 15.sp,
                          ),
                          splashRadius: 15.sp,
                          iconSize: 15.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "27,467",
                          style: TextStyle(fontSize: 10.sp),
                        ),
                      ],
                    ),
                    ratingBar: const SizedBox.shrink(),
                    trailing: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share_outlined,
                          size: 15.sp,
                        ),
                        splashRadius: 15.sp,
                        iconSize: 15.sp,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark_border_outlined,
                          size: 15.sp,
                        ),
                        splashRadius: 15.sp,
                        iconSize: 15.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        postShimmer(
            SizedBox(
              //Feeds post
              child: Column(
                children: [
                  PostFeedHeader(
                    leading: ProfileAvatar(
                      image: Image.asset("assets/images/people-2.jpg"),
                      radius: 16.sp,
                      isLive: true,
                    ),
                    title: "Thomas Ukulele",
                    subtitle: "1d ago",
                    trailing: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert),
                        splashRadius: 15.sp,
                      )
                    ],
                  ),
                  PostFeedContent(
                    content: PostContent.image(
                        Image.asset("assets/images/image-post-4.jpg"),
                        aspectRatio: 16 / 9),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: PostFeedFooter(
                      leading: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_outline,
                              size: 15.sp,
                            ),
                            splashRadius: 15.sp,
                            iconSize: 15.sp,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "7,189",
                            style: TextStyle(fontSize: 10.sp),
                          ),
                        ],
                      ),
                      ratingBar: const SizedBox.shrink(),
                      trailing: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share_outlined,
                            size: 15.sp,
                          ),
                          splashRadius: 15.sp,
                          iconSize: 15.sp,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.bookmark_border_outlined,
                            size: 15.sp,
                          ),
                          splashRadius: 15.sp,
                          iconSize: 15.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            isMedia: true),
        const Divider(),
        postShimmer(
          SizedBox(
            //Feeds post
            child: Column(
              children: [
                PostFeedHeader(
                  leading: ProfileAvatar(
                    image: Image.asset("assets/images/people-2.jpg"),
                    radius: 16.sp,
                    isLive: true,
                  ),
                  title: "Thomas Ukulele",
                  subtitle: "2d ago",
                  trailing: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                      splashRadius: 15.sp,
                    )
                  ],
                ),
                PostFeedContent(
                  content: PostContent.text("Today, we will make some changes"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: PostFeedFooter(
                    leading: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_outline,
                            size: 15.sp,
                          ),
                          splashRadius: 15.sp,
                          iconSize: 15.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "212",
                          style: TextStyle(fontSize: 10.sp),
                        ),
                      ],
                    ),
                    ratingBar: const SizedBox.shrink(),
                    trailing: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share_outlined,
                          size: 15.sp,
                        ),
                        splashRadius: 15.sp,
                        iconSize: 15.sp,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark_border_outlined,
                          size: 15.sp,
                        ),
                        splashRadius: 15.sp,
                        iconSize: 15.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
