import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/backscreens/chat_textfield_widget.dart';
import 'package:ciak_live/widgets/backscreens/livecamera_widget.dart';
import 'package:ciak_live/widgets/backscreens/profile_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupMeetingView extends StatefulWidget {
  const GroupMeetingView({super.key});

  @override
  State<GroupMeetingView> createState() {
    return _GroupMeetingViewState();
  }
}

class _GroupMeetingViewState extends State<GroupMeetingView> {
  final TextEditingController _chatTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Text(
            "GROUP MEETING",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: SafeArea(
          child: FractionallySizedBox(
            heightFactor: 1.0,
            widthFactor: 1.0,
            child: ConstrainedBox(
              constraints: const BoxConstraints(),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: GridView.count(
                      primary: false,
                      padding: EdgeInsets.all(2.w),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      children: const [
                        LiveCamera(),
                        LiveCamera(),
                        LiveCamera(),
                        LiveCamera(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 30.h,
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.3.w,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(vertical: 0.5.h),
                        children: [
                          ListTile(
                            dense: true,
                            minLeadingWidth: 1.w,
                            leading: ProfileAvatar(
                              image: Image.asset("assets/images/people-2.jpg"),
                              radius: 8.sp,
                            ),
                            title: const Text("Hai"),
                          ),
                          ListTile(
                            dense: true,
                            minLeadingWidth: 1.w,
                            leading: ProfileAvatar(
                              image: Image.asset("assets/images/people-1.jpg"),
                              radius: 8.sp,
                            ),
                            title: const Text("Welcome dude!"),
                          ),
                          ListTile(
                            dense: true,
                            minLeadingWidth: 1.w,
                            leading: ProfileAvatar(
                              image: Image.asset("assets/images/people-3.jpg"),
                              radius: 8.sp,
                            ),
                            title: const Text("Holaaa"),
                          )
                        ],
                      ),
                    ),
                    ChatTextField(
                      controller: _chatTextController,
                      hintText: "Send a message",
                      onSubmit: () {},
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 5.w,
                ),
                child: Wrap(
                  spacing: 2.w,
                  children: [
                    SizedBox(
                      height: 6.h,
                      width: 30.w,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Enter"),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                      width: 30.w,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.offAllNamed("/back-screen/");
                        },
                        child: const Text("Leave"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
