import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/views/backscreens/createposttabs/cam2cam_view.dart';
import 'package:ciak_live/views/backscreens/createposttabs/live_view.dart';
import 'package:ciak_live/views/backscreens/createposttabs/meetingroom_view.dart';
import 'package:ciak_live/views/backscreens/createposttabs/post_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});

  @override
  State<CreatePostView> createState() {
    return _CreatePostViewState();
  }
}

class _CreatePostViewState extends State<CreatePostView>
    with TickerProviderStateMixin {
  late TabController _postTabController;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _postTabController = TabController(
      initialIndex: _tabIndex,
      length: 4,
      vsync: this,
    );
    _postTabController.addListener(() {
      if (_postTabController.indexIsChanging) {
        setState(() {
          _tabIndex = _postTabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _postTabController.removeListener(() {});
    _postTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
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
            title: Text(
              "CREATE",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            actions: [
              _tabIndex == 0
                  ? Container(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Publish"),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          body: SafeArea(
            child: FractionallySizedBox(
              heightFactor: 1.0,
              widthFactor: 1.0,
              child: TabBarView(
                controller: _postTabController,
                children: const [
                  PostView(),
                  LiveView(),
                  CamToCamView(),
                  MeetingRoomView(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 4.h,
            padding: EdgeInsets.symmetric(vertical: 0.5.h),
            margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            child: TabBar(
              controller: _postTabController,
              labelPadding: EdgeInsets.symmetric(horizontal: 2.w),
              isScrollable: true,
              splashFactory: NoSplash.splashFactory,
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.focused)
                    ? null
                    : Colors.transparent;
              }),
              indicatorColor: Colors.transparent,
              unselectedLabelColor:
                  Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
              labelColor: Theme.of(context).scaffoldBackgroundColor,
              indicator: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.red,
                    Colors.orange,
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: const Text("POST"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: const Text("LIVE"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: const Text("CAM2CAM"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: const Text("MEETING ROOM"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
