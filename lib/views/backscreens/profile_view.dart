import 'package:ciak_live/controllers/app_prefs_controller.dart';
import 'package:ciak_live/controllers/user_controller.dart';
import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/utils/functions.dart';
import 'package:ciak_live/views/backscreens/profiletabs/profile_publictab_view.dart';
import 'package:ciak_live/widgets/backscreens/keepalivepage_widget.dart';
import 'package:ciak_live/widgets/backscreens/profile_avatar_widget.dart';
import 'package:ciak_live/widgets/backscreens/profile_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() {
    return _ProfileViewState();
  }
}

class _ProfileViewState extends State<ProfileView> {
  final UserController userController = Get.find<UserController>();
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
                  child: ProfileHeader(
                    headerImage: Image.asset(
                      "assets/images/image-post-4.jpg",
                      fit: BoxFit.cover,
                    ),
                    avatar: ProfileAvatar(
                      image: Image.asset("assets/images/people-2.jpg"),
                      radius: 44.sp,
                      isLive: true,
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
                            leading: IconButton(
                              splashRadius: 25.0,
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/images/share.png",
                                scale: 1.2,
                                color: Colors.white.withOpacity(0.5),
                                colorBlendMode: BlendMode.srcATop,
                              ),
                            ),
                            trailing: Wrap(
                              children: [
                                IconButton(
                                  splashRadius: 25.0,
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/images/promote.png",
                                    scale: 1.2,
                                    color: Colors.white.withOpacity(0.5),
                                    colorBlendMode: BlendMode.srcATop,
                                  ),
                                ),
                                IconButton(
                                  splashRadius: 25.0,
                                  onPressed: () async {
                                    userController.signedUser = null;
                                    await AppPrefs.prefsStorage.delete("user");
                                    Get.offAllNamed("/front-screen/landing");
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
                                        "assets/images/exit.png",
                                        scale: 1.2,
                                        color: Colors.white.withOpacity(0.5),
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
                              initialRating: 4,
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
                                  "Thomas Ukulele",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text("Brooklyn, NY",
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
                                    "Writer is Profession, Artist by Passion!\n\u{1F920}\u{1F920}\u{1F920}",
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            child: Wrap(
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    Get.toNamed(
                                        "/back-screen/profile/edit-subscriptipn");
                                  },
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                        width: 1.5,
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.grey
                                            : Colors.white,
                                      ),
                                      foregroundColor:
                                          Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Colors.black
                                              : Colors.white,
                                      backgroundColor:
                                          Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Colors.grey[300]
                                              : Theme.of(context)
                                                  .scaffoldBackgroundColor),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(minWidth: 35.w),
                                    child: const Text(
                                      "Edit Subscription",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    Get.toNamed(
                                        "/back-screen/profile/edit-profile");
                                  },
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                        width: 1.5,
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.grey
                                            : Colors.white,
                                      ),
                                      foregroundColor:
                                          Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Colors.black
                                              : Colors.white,
                                      backgroundColor:
                                          Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Colors.grey[300]
                                              : Theme.of(context)
                                                  .scaffoldBackgroundColor),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(minWidth: 35.w),
                                    child: const Text(
                                      "Edit Profile",
                                      textAlign: TextAlign.center,
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
                KeepAlivePage(child: ProfilePublicTabView()),
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
