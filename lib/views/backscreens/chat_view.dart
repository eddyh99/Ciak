import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/backscreens/chat_textfield_widget.dart';
import 'package:ciak_live/widgets/backscreens/chatbubble_widget.dart';
import 'package:ciak_live/widgets/backscreens/profile_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() {
    return _ChatViewState();
  }
}

class _ChatViewState extends State<ChatView> {
  final Map<String, String> _chatUser = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(10.h),
          child: AppBar(
            shape: Border(
              bottom: BorderSide(color: Colors.grey, width: 0.5.w),
            ),
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
            toolbarHeight: 10.h,
            title: Column(
              children: [
                ProfileAvatar(
                  image: Image.asset("assets/images/people-2.jpg"),
                  radius: 14.sp,
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Text(
                  "Thomas Ukulele",
                  style: Theme.of(context).textTheme.labelLarge,
                )
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: FractionallySizedBox(
            heightFactor: 1.0,
            widthFactor: 1.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              child: ListView(
                children: [
                  const Text(
                    "Sep, 14 2022",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  UsersChatBubble(
                    avatar: ProfileAvatar(
                      image: Image.asset("assets/images/people-2.jpg"),
                      radius: 12.sp,
                    ),
                    chat:
                        "AAAAAAAAAAAAAAAAAAAAAAAAAA AAAAAAAAAAAAAAAAAAAAA AAAAA HELP!!",
                    time: "10:10 PM",
                  ),
                  const OwnChatBubble(
                    chat: "What wrong with you",
                    time: "10:10 PM",
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 13.h,
          color: Colors.grey,
          child: Container(
            height: 10.h,
            margin: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
            child: ChatTextField(
                hintText: "Send a message",
                fillColor: Colors.black,
                hintStyle: const TextStyle(color: Colors.white60),
                style: const TextStyle(color: Colors.white),
                onSubmit: () {}),
          ),
        ),
      ),
    );
  }
}
