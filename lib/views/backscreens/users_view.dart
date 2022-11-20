import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/utils/functions.dart';
import 'package:ciak_live/views/backscreens/userstabs/users_publictab_view.dart';
import 'package:ciak_live/widgets/backscreens/gradient_button_widget.dart';
import 'package:ciak_live/widgets/backscreens/gradient_outlinedbutton_widget.dart';
import 'package:ciak_live/widgets/backscreens/keepalivepage_widget.dart';
import 'package:ciak_live/widgets/backscreens/profile_avatar_widget.dart';
import 'package:ciak_live/widgets/backscreens/profile_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() {
    return _UsersViewState();
  }
}

class _UsersViewState extends State<UsersView> {
  final Map<String, String> userData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      ProfileHeader(
                        headerImage: Image.asset(
                          "assets/images/image-post-2.jpg",
                          fit: BoxFit.cover,
                        ),
                        avatar: ProfileAvatar(
                          image: Image.asset("assets/images/people-3.jpg"),
                          radius: 44.sp,
                          hasStory: true,
                        ),
                        body: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 100.w,
                            minHeight: 30.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ListTile(
                                leading: Wrap(
                                  children: [
                                    IconButton(
                                      splashRadius: 25.0,
                                      onPressed: () {},
                                      icon: Image.asset(
                                        "assets/images/share.png",
                                        scale: 1.2,
                                        color: Colors.white.withOpacity(0.5),
                                        colorBlendMode: BlendMode.srcATop,
                                      ),
                                    ),
                                    IconButton(
                                      splashRadius: 25.0,
                                      onPressed: () {},
                                      icon: Image.asset(
                                        "assets/images/doc-add.png",
                                        scale: 1.2,
                                        color: Colors.white.withOpacity(0.5),
                                        colorBlendMode: BlendMode.srcATop,
                                      ),
                                    )
                                  ],
                                ),
                                trailing: Wrap(
                                  children: [
                                    IconButton(
                                      splashRadius: 25.0,
                                      onPressed: () {
                                        Get.toNamed("/back-screen/send-note");
                                      },
                                      icon: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          radius: 30,
                                          child: Image.asset(
                                            "assets/images/message.png",
                                            scale: 1.2,
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            colorBlendMode: BlendMode.srcATop,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      splashRadius: 25.0,
                                      onPressed: () {
                                        showBlockUserBottomSheet(
                                            context: context,
                                            username: "Rebecca Kajon",
                                            onConfirm: () {});
                                      },
                                      icon: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          radius: 30,
                                          child: Image.asset(
                                            "assets/images/block-user.png",
                                            scale: 1.2,
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            colorBlendMode: BlendMode.srcATop,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 1.h),
                                child: RatingBar(
                                  itemSize: 14.sp,
                                  initialRating: 5,
                                  direction: Axis.horizontal,
                                  allowHalfRating: false,
                                  ignoreGestures: true,
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
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 1.h),
                                child: Wrap(
                                  direction: Axis.vertical,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text(
                                      "Rebecca Kajon",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    Text("Boston, MA",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            ?.copyWith(color: Colors.grey))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.h, horizontal: 2.w),
                                child: Text.rich(
                                  TextSpan(
                                    style: TextStyle(height: 0.2.h),
                                    text:
                                        "I design experiences mostly. I also sometimes travel. But, actually I love Pizza, and fried noodle.",
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                child: GradientButton(
                                  onPressed: () {},
                                  text: "Follow",
                                  width: 30.w,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 2.w,
                                  runSpacing: 1.h,
                                  children: [
                                    SizedBox(
                                      height: 4.h,
                                      child: GradientOutlinedButton(
                                        onPressed: () {
                                          showUserSubscriptionBottomSheet(
                                              context: context,
                                              subscriptionText: "1 Week \$20",
                                              onConfirm: () {});
                                        },
                                        child: Text(
                                          "1 Week \$20",
                                          style: TextStyle(fontSize: 10.sp),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                      child: GradientOutlinedButton(
                                        onPressed: () {
                                          showUserSubscriptionBottomSheet(
                                              context: context,
                                              subscriptionText: "2 Weeks \$50",
                                              onConfirm: () {});
                                        },
                                        child: Text(
                                          "2 Weeks \$50",
                                          style: TextStyle(fontSize: 10.sp),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                      child: GradientOutlinedButton(
                                        onPressed: () {
                                          showUserSubscriptionBottomSheet(
                                              context: context,
                                              subscriptionText: "1 Month \$200",
                                              onConfirm: () {});
                                        },
                                        child: Text(
                                          "1 Month \$200",
                                          style: TextStyle(fontSize: 10.sp),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 1.h),
                        child: IconButton(
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
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              radius: 30,
                              child: const Icon(Icons.arrow_back),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverAppBar(
                  pinned: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  toolbarHeight: 8.h,
                  flexibleSpace: TabBar(
                    isScrollable: true,
                    padding: EdgeInsets.only(top: 2.5.h),
                    labelPadding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                    unselectedLabelStyle:
                        const TextStyle(fontWeight: FontWeight.w400),
                    indicator: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.orange],
                      ),
                    ),
                    indicatorWeight: 0.8.h,
                    indicatorPadding: EdgeInsets.only(top: 4.8.h),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Text("Public"),
                      Text("Private"),
                      Text("Special"),
                      Text("Download"),
                      Text("VS"),
                    ],
                  ),
                ),
              ];
            },
            body: const TabBarView(
              children: [
                KeepAlivePage(child: UsersPublicTabView()),
                KeepAlivePage(child: Center(child: Text("No design yet"))),
                KeepAlivePage(child: Center(child: Text("No design yet"))),
                KeepAlivePage(child: Center(child: Text("No design yet"))),
                KeepAlivePage(child: Center(child: Text("No design yet"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
