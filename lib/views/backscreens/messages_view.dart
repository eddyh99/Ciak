import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/backscreens/messagetile_widget.dart';
import 'package:ciak_live/widgets/backscreens/profile_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({super.key});

  @override
  State<MessagesView> createState() {
    return _MessagesViewState();
  }
}

class _MessagesViewState extends State<MessagesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
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
        title: const Text("Messages"),
        actions: [
          Center(
            child: IconButton(
              splashRadius: 25.0,
              onPressed: () {
                Get.toNamed("/back-screen/recipient",
                    arguments: {"type": "chat"});
              },
              icon: Image.asset(
                "assets/images/chat-plus.png",
                scale: 1.0,
                color: Colors.white.withOpacity(0.5),
                colorBlendMode: BlendMode.srcATop,
              ),
            ),
          ),
        ],
      ),
      body: FractionallySizedBox(
        heightFactor: 1.0,
        widthFactor: 1.0,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                child: Text(
                  "PINNED",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              SizedBox(
                height: 15.h,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 2.0,
                      children: [
                        ProfileAvatar(
                          image: Image.asset("assets/images/people-2.jpg"),
                          radius: 16.sp,
                        ),
                        Text(
                          "Thomas",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 2.0,
                      children: [
                        ProfileAvatar(
                          image: Image.asset("assets/images/people-3.jpg"),
                          radius: 16.sp,
                        ),
                        Text(
                          "Rebecca",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      MessageTile(
                        leading: ProfileAvatar(
                          image: Image.asset("assets/images/people-4.jpg"),
                          radius: 16.sp,
                        ),
                        leadingTitle: "Money Industrial Factory",
                        trailingTitle: "15m ago",
                        messagePreview: const Text(
                          "Welcome to CIAK LIVE",
                          overflow: TextOverflow.ellipsis,
                        ),
                        onPinned: (_) {},
                        onDeleted: (_) {},
                      ),
                      const Divider(),
                      MessageTile(
                        leading: ProfileAvatar(
                          image: Image.asset("assets/images/people-1.jpg"),
                          radius: 16.sp,
                        ),
                        leadingTitle: "Bob Harley",
                        trailingTitle: "15m ago",
                        messagePreview: const Text(
                          "Hello i'm a message preview, this is very looooooooong message",
                          overflow: TextOverflow.ellipsis,
                        ),
                        onPinned: (_) {},
                        onDeleted: (_) {},
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
