import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/backscreens/profile_avatar_widget.dart';
import 'package:ciak_live/widgets/backscreens/searchbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecipientsView extends StatefulWidget {
  const RecipientsView({super.key});

  @override
  State<RecipientsView> createState() {
    return _RecipientsViewState();
  }
}

class _RecipientsViewState extends State<RecipientsView> {
  final Map<String, String> _recipientType = Get.arguments;

  String _selectedUser = "Thomas Ukulele";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(
          "Choose recipient",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.back(closeOverlays: true);
            },
            icon: const Icon(
              Icons.close,
            ),
            splashRadius: 15.sp,
          ),
        ],
      ),
      body: SafeArea(
        child: FractionallySizedBox(
          heightFactor: 1.0,
          widthFactor: 1.0,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 2.h),
                    height: 6.h,
                    child: SearchBar(
                        hintText:
                            "Who do you want to ${_recipientType["type"]! == "cam" ? "cam" : "chat"} with?",
                        onSubmit: () {}),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 70.h,
                    ),
                    child: ListView(
                      children: [
                        ListTile(
                          leading: ProfileAvatar(
                            image: Image.asset("assets/images/people-2.jpg"),
                            radius: 18.sp,
                          ),
                          title: const Text("Thomas Ukulele"),
                          trailing: Radio<String>(
                            value: "Thomas Ukulele",
                            groupValue: _selectedUser,
                            activeColor: Colors.red,
                            onChanged: (value) {
                              if (mounted) {
                                setState(() {
                                  _selectedUser = value.toString();
                                });
                              }
                            },
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          leading: ProfileAvatar(
                            image: Image.asset("assets/images/people-1.jpg"),
                            radius: 18.sp,
                          ),
                          title: const Text("Bob Harley"),
                          trailing: Radio<String>(
                            value: "Bob Harley",
                            groupValue: _selectedUser,
                            activeColor: Colors.red,
                            onChanged: (value) {
                              if (mounted) {
                                setState(() {
                                  _selectedUser = value.toString();
                                });
                              }
                            },
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          leading: ProfileAvatar(
                            image: Image.asset("assets/images/people-3.jpg"),
                            radius: 18.sp,
                          ),
                          title: const Text("Rebecca Kajon"),
                          trailing: Radio<String>(
                            value: "Rebecca Cajon",
                            groupValue: _selectedUser,
                            activeColor: Colors.red,
                            onChanged: (value) {
                              if (mounted) {
                                setState(() {
                                  _selectedUser = value!;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 2.h),
                    height: 6.h,
                    width: 50.w,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_recipientType["type"] == "cam") {
                          Get.offAllNamed("/back-screen/live-cam",
                              arguments: {"type": "cam 2 cam"});
                        } else {
                          Get.toNamed(
                            "/back-screen/chat",
                            arguments: {"id": "0001"},
                          );
                        }
                      },
                      child: const Text("Submit"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
