import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/utils/functions.dart';
import 'package:ciak_live/widgets/backscreens/notification_indicator_widget.dart';
import 'package:ciak_live/widgets/backscreens/postfeed_content_widget.dart';
import 'package:ciak_live/widgets/backscreens/postfeed_footer_widget.dart';
import 'package:ciak_live/widgets/backscreens/postfeed_header_widget.dart';
import 'package:ciak_live/widgets/backscreens/profile_avatar_widget.dart';
import 'package:ciak_live/widgets/backscreens/searchbar_widget.dart';
import 'package:ciak_live/widgets/backscreens/gradient_button_widget.dart';
import 'package:ciak_live/widgets/backscreens/storycard_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class FeedsView extends StatefulWidget {
  const FeedsView({super.key});

  @override
  State<FeedsView> createState() {
    return _FeedsViewState();
  }
}

class _FeedsViewState extends State<FeedsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10.h),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0.h),
          child: AppBar(
            title: SizedBox(
              height: 6.h,
              child: SearchBar(
                hintText: "Search for something here...",
                onSubmit: () {},
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.toNamed("/back-screen/alerts");
                },
                icon: const NotificationIndicator(
                  child: Icon(Icons.notifications_none_outlined),
                ),
                splashRadius: 15.sp,
              ),
              IconButton(
                onPressed: () {
                  Get.toNamed("/back-screen/messages");
                },
                icon: const NotificationIndicator(
                    child: Icon(Icons.mail_outlined)),
                splashRadius: 15.sp,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(const Duration(seconds: 2), () {
              setState(() {});
            });
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25.h,
                  child: FutureBuilder(
                    future: Future.delayed(const Duration(seconds: 3), () {}),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 4.w),
                          scrollDirection: Axis.horizontal,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed("/back-screen/users-profile",
                                    arguments: {"userId": "rebec123"});
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1.w),
                                child: Stack(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  children: [
                                    StoryCard(
                                      image: Image.asset(
                                          "assets/images/people-1.jpg"),
                                      withBorder: true,
                                    ),
                                    GradientButton(
                                      onPressed: () {},
                                      text: "Following",
                                      margin: EdgeInsets.only(bottom: 1.h),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed("/back-screen/users-profile",
                                    arguments: {"userId": "rebec123"});
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1.w),
                                child: Stack(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  children: [
                                    StoryCard(
                                      image: Image.asset(
                                          "assets/images/people-2.jpg"),
                                    ),
                                    GradientButton(
                                      onPressed: () {},
                                      text: "Follow",
                                      margin: EdgeInsets.only(bottom: 1.h),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed("/back-screen/users-profile",
                                    arguments: {"userId": "rebec123"});
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1.w),
                                child: Stack(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  children: [
                                    StoryCard(
                                      image: Image.asset(
                                          "assets/images/people-4.jpg"),
                                    ),
                                    GradientButton(
                                      onPressed: () {},
                                      text: "Follow",
                                      margin: EdgeInsets.only(bottom: 1.h),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed("/back-screen/users-profile",
                                    arguments: {"userId": "rebec123"});
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1.w),
                                child: Stack(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  children: [
                                    StoryCard(
                                      image: Image.asset(
                                          "assets/images/people-5.jpg"),
                                    ),
                                    ProfileAvatar(
                                      image: Image.asset(
                                          "assets/images/people-3.jpg"),
                                      radius: 16.sp,
                                      margin: EdgeInsets.only(bottom: 1.h),
                                      hasStory: true,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return ListView(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 4.w),
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (int x = 0; x < 4; x++) ...[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1.w),
                              child: Shimmer.fromColors(
                                baseColor: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.grey.shade300
                                    : Colors.grey.shade800,
                                highlightColor: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.grey.shade100
                                    : Colors.grey.shade600,
                                child: Container(
                                  height: 25.h,
                                  width: 37.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ]
                        ],
                      );
                    },
                  ),
                ),
                const Divider(),
                postShimmer(
                  SizedBox(
                    //Feeds post
                    child: Column(
                      children: [
                        PostFeedHeader(
                          leading: GestureDetector(
                            onTap: () {
                              Get.toNamed("/back-screen/users-profile",
                                  arguments: {"userId": "rebec123"});
                            },
                            child: ProfileAvatar(
                              image: Image.asset("assets/images/people-4.jpg"),
                              radius: 16.sp,
                            ),
                          ),
                          title: "Money Industrial Factory",
                          subtitle: "30m ago",
                          trailing: [
                            IconButton(
                              onPressed: () {
                                showContentBottomSheet(
                                  context: context,
                                  price: "\$ 2.00",
                                  text: "Are you sure to buy this content?",
                                  onConfirm: () => Navigator.pop(context),
                                );
                              },
                              icon: Image.asset(
                                "assets/images/cart.png",
                                scale: 1.0,
                              ),
                              splashRadius: 15.sp,
                            ),
                            IconButton(
                              onPressed: () {
                                final TextEditingController tipController =
                                    TextEditingController(text: "0.00");
                                showContentTipDialog(
                                  context: context,
                                  controller: tipController,
                                  prefixCurrency: "\$",
                                  onConfirm: () {
                                    Navigator.of(context).pop();
                                  },
                                );
                              },
                              icon: Image.asset(
                                "assets/images/tip.png",
                                scale: 1.0,
                              ),
                              splashRadius: 15.sp,
                            ),
                            IconButton(
                              onPressed: () {
                                showContentOptionDialog(
                                    context: context,
                                    onShowPost: () {},
                                    onReportPost: () {});
                              },
                              icon: const Icon(Icons.more_vert),
                              splashRadius: 15.sp,
                            )
                          ],
                        ),
                        PostFeedContent(
                          content: PostContent.text(
                              '“If you think you are too small to make a difference, try sleeping with a mosquito.”\n~ Dalai Lama'),
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
                                Text(
                                  "414",
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                              ],
                            ),
                            ratingBar: RatingBar(
                              itemSize: 14.sp,
                              initialRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              ratingWidget: RatingWidget(
                                full: const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                half: const Icon(
                                  Icons.star_half,
                                  color: Colors.yellow,
                                ),
                                empty: const Icon(Icons.star),
                              ),
                              onRatingUpdate: (rating) {
                                printDebug(rating);
                              },
                            ),
                            trailing: [
                              IconButton(
                                onPressed: () {
                                  showShareBottomSheet(context: context);
                                },
                                icon: Icon(
                                  Icons.share_outlined,
                                  size: 15.sp,
                                ),
                                splashRadius: 15.sp,
                                iconSize: 15.sp,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/images/vs.png",
                                  scale: 1.2,
                                  color: Colors.white.withOpacity(0.5),
                                  colorBlendMode: BlendMode.srcATop,
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
                            leading: GestureDetector(
                              onTap: () {
                                Get.toNamed("/back-screen/users-profile",
                                    arguments: {"userId": "rebec123"});
                              },
                              child: ProfileAvatar(
                                image:
                                    Image.asset("assets/images/people-2.jpg"),
                                radius: 16.sp,
                                isLive: true,
                              ),
                            ),
                            title: "Thomas Ukulele",
                            subtitle: "2h ago",
                            trailing: [
                              IconButton(
                                onPressed: () {
                                  showContentBottomSheet(
                                    context: context,
                                    price: "\$ 2.00",
                                    text:
                                        "Are you sure to download this content?",
                                    onConfirm: () => Navigator.pop(context),
                                  );
                                },
                                icon: Image.asset(
                                  "assets/images/download.png",
                                  scale: 1.0,
                                ),
                                splashRadius: 15.sp,
                              ),
                              IconButton(
                                onPressed: () {
                                  final TextEditingController tipController =
                                      TextEditingController(text: "0.00");
                                  showContentTipDialog(
                                    context: context,
                                    controller: tipController,
                                    prefixCurrency: "\$",
                                    onConfirm: () {
                                      Navigator.of(context).pop();
                                    },
                                  );
                                },
                                icon: Image.asset(
                                  "assets/images/tip.png",
                                  scale: 1.0,
                                ),
                                splashRadius: 15.sp,
                              ),
                              IconButton(
                                onPressed: () {
                                  showContentOptionDialog(
                                      context: context,
                                      onShowPost: () {},
                                      onReportPost: () {});
                                },
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
                                  Text(
                                    "1,672",
                                    style: TextStyle(fontSize: 10.sp),
                                  ),
                                ],
                              ),
                              ratingBar: RatingBar(
                                itemSize: 14.sp,
                                initialRating: 4,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                ratingWidget: RatingWidget(
                                  full: const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  half: const Icon(
                                    Icons.star_half,
                                    color: Colors.yellow,
                                  ),
                                  empty: const Icon(Icons.star),
                                ),
                                onRatingUpdate: (rating) {
                                  printDebug(rating);
                                },
                              ),
                              trailing: [
                                IconButton(
                                  onPressed: () {
                                    showShareDialog(context: context);
                                  },
                                  icon: Icon(
                                    Icons.share_outlined,
                                    size: 15.sp,
                                  ),
                                  splashRadius: 15.sp,
                                  iconSize: 15.sp,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/images/vs.png",
                                    scale: 1.2,
                                    color: Colors.white.withOpacity(0.5),
                                    colorBlendMode: BlendMode.srcATop,
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
                            leading: GestureDetector(
                              onTap: () {
                                Get.toNamed("/back-screen/users-profile",
                                    arguments: {"userId": "rebec123"});
                              },
                              child: ProfileAvatar(
                                image:
                                    Image.asset("assets/images/people-1.jpg"),
                                radius: 16.sp,
                              ),
                            ),
                            title: "Bob Harley",
                            subtitle: "3h ago",
                            trailing: [
                              IconButton(
                                onPressed: () {
                                  showContentBottomSheet(
                                    context: context,
                                    price: "\$ 2.00",
                                    text:
                                        "Are you sure to download this content?",
                                    onConfirm: () => Navigator.pop(context),
                                  );
                                },
                                icon: Image.asset(
                                  "assets/images/download.png",
                                  scale: 1.0,
                                ),
                                splashRadius: 15.sp,
                              ),
                              IconButton(
                                onPressed: () {
                                  final TextEditingController tipController =
                                      TextEditingController(text: "0.00");
                                  showContentTipDialog(
                                    context: context,
                                    controller: tipController,
                                    prefixCurrency: "\$",
                                    onConfirm: () {
                                      Navigator.of(context).pop();
                                    },
                                  );
                                },
                                icon: Image.asset(
                                  "assets/images/tip.png",
                                  scale: 1.0,
                                ),
                                splashRadius: 15.sp,
                              ),
                              IconButton(
                                onPressed: () {
                                  showContentOptionDialog(
                                      context: context,
                                      onShowPost: () {},
                                      onReportPost: () {});
                                },
                                icon: const Icon(Icons.more_vert),
                                splashRadius: 15.sp,
                              )
                            ],
                          ),
                          PostFeedContent(
                            content: PostContent.video(
                                "assets/videos/video-post-landscape.mp4",
                                useController: true),
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
                                  Text(
                                    "31,798",
                                    style: TextStyle(fontSize: 10.sp),
                                  ),
                                ],
                              ),
                              ratingBar: RatingBar(
                                itemSize: 14.sp,
                                initialRating: 5,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                ratingWidget: RatingWidget(
                                  full: const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  half: const Icon(
                                    Icons.star_half,
                                    color: Colors.yellow,
                                  ),
                                  empty: const Icon(Icons.star),
                                ),
                                onRatingUpdate: (rating) {
                                  printDebug(rating);
                                },
                              ),
                              trailing: [
                                IconButton(
                                  onPressed: () {
                                    showShareDialog(context: context);
                                  },
                                  icon: Icon(
                                    Icons.share_outlined,
                                    size: 15.sp,
                                  ),
                                  splashRadius: 15.sp,
                                  iconSize: 15.sp,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/images/vs.png",
                                    scale: 1.2,
                                    color: Colors.white.withOpacity(0.5),
                                    colorBlendMode: BlendMode.srcATop,
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
                            leading: GestureDetector(
                              onTap: () {
                                Get.toNamed("/back-screen/users-profile",
                                    arguments: {"userId": "rebec123"});
                              },
                              child: ProfileAvatar(
                                image:
                                    Image.asset("assets/images/people-3.jpg"),
                                radius: 16.sp,
                                hasStory: true,
                              ),
                            ),
                            title: "Rebecca Kajon",
                            subtitle: "4h ago",
                            trailing: [
                              IconButton(
                                onPressed: () {
                                  showContentBottomSheet(
                                    context: context,
                                    price: "\$ 2.00",
                                    text:
                                        "Are you sure to download this content?",
                                    onConfirm: () => Navigator.pop(context),
                                  );
                                },
                                icon: Image.asset(
                                  "assets/images/download.png",
                                  scale: 1.0,
                                ),
                                splashRadius: 15.sp,
                              ),
                              IconButton(
                                onPressed: () {
                                  final TextEditingController tipController =
                                      TextEditingController(text: "0.00");
                                  showContentTipDialog(
                                    context: context,
                                    controller: tipController,
                                    prefixCurrency: "\$",
                                    onConfirm: () {
                                      Navigator.of(context).pop();
                                    },
                                  );
                                },
                                icon: Image.asset(
                                  "assets/images/tip.png",
                                  scale: 1.0,
                                ),
                                splashRadius: 15.sp,
                              ),
                              IconButton(
                                onPressed: () {
                                  showContentOptionDialog(
                                      context: context,
                                      onShowPost: () {},
                                      onReportPost: () {});
                                },
                                icon: const Icon(Icons.more_vert),
                                splashRadius: 15.sp,
                              )
                            ],
                          ),
                          PostFeedContent(
                            content: PostContent.imageMulti(
                              [
                                Image.asset(
                                  "assets/images/image-post-1.jpg",
                                ),
                                Image.asset(
                                  "assets/images/image-post-2.jpg",
                                ),
                                Image.asset(
                                  "assets/images/image-post-3.jpg",
                                )
                              ],
                              aspectRatio: 16 / 9,
                              maxImageHeight: 30.h,
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 1.h),
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
                                  Text(
                                    "5,144",
                                    style: TextStyle(fontSize: 10.sp),
                                  ),
                                ],
                              ),
                              ratingBar: RatingBar(
                                itemSize: 14.sp,
                                initialRating: 2,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                ratingWidget: RatingWidget(
                                  full: const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  half: const Icon(
                                    Icons.star_half,
                                    color: Colors.yellow,
                                  ),
                                  empty: const Icon(Icons.star),
                                ),
                                onRatingUpdate: (rating) {
                                  printDebug(rating);
                                },
                              ),
                              trailing: [
                                IconButton(
                                  onPressed: () {
                                    showShareDialog(context: context);
                                  },
                                  icon: Icon(
                                    Icons.share_outlined,
                                    size: 15.sp,
                                  ),
                                  splashRadius: 15.sp,
                                  iconSize: 15.sp,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/images/vs.png",
                                    scale: 1.2,
                                    color: Colors.white.withOpacity(0.5),
                                    colorBlendMode: BlendMode.srcATop,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
