import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/backscreens/gradient_button_widget.dart';
import 'package:ciak_live/widgets/backscreens/profile_avatar_widget.dart';
import 'package:ciak_live/widgets/backscreens/profile_header_widget.dart';
import 'package:ciak_live/widgets/backscreens/rectangle_textfield_widget.dart';
import 'package:ciak_live/widgets/frontscreens/themeswitch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() {
    return _EditProfileViewState();
  }
}

class _EditProfileViewState extends State<EditProfileView> {
  final GlobalKey<FormState> _profileFormKey = GlobalKey<FormState>();
  final TextEditingController _codeTextController = TextEditingController();
  final TextEditingController _userTextController = TextEditingController();
  final TextEditingController _bioTextController = TextEditingController();
  final TextEditingController _webTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _codeTextController.text = "1234567";
    _userTextController.text = "ukuuulele";
    _webTextController.text = "www.ukulele.com";
    _emailTextController.text = "lele_uku@gmail.com";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: FractionallySizedBox(
          heightFactor: 1.0,
          widthFactor: 1.0,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ProfileHeader(
                      headerImage: Image.asset(
                        "assets/images/image-post-4.jpg",
                        fit: BoxFit.cover,
                      ),
                      avatar: ProfileAvatar(
                        image: Image.asset("assets/images/people-2.jpg"),
                        radius: 44.sp,
                        isLive: true,
                      ),
                      body: const ListTile(
                        trailing: ThemeSwitch(),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
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
                SizedBox(
                  height: 1.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Change Picture",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      SizedBox(
                        width: 0.5.w,
                      ),
                      Icon(
                        Icons.camera_alt_outlined,
                        size: 14.sp,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: 80.w,
                  child: Form(
                    key: _profileFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Text(
                            "Unique code",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        RectangleTextFormField(
                          controller: _codeTextController,
                          readOnly: true,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Text(
                            "Username",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        RectangleTextFormField(
                          controller: _userTextController,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Text(
                            "Bio",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        RectangleTextFormField(
                          controller: _bioTextController,
                          maxLength: 100,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Text(
                            "Web",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        RectangleTextFormField(
                          controller: _webTextController,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Text(
                            "Email",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        RectangleTextFormField(
                          controller: _emailTextController,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Text(
                            "Phone number",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        RectangleTextFormField(
                          controller: _phoneTextController,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Enable comment",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              FlutterSwitch(
                                activeColor: Colors.green,
                                width: 15.w,
                                height: 4.h,
                                valueFontSize: 0.0,
                                toggleSize: 16.sp,
                                value: true,
                                borderRadius: 30.0,
                                padding: 0.2.h,
                                showOnOff: true,
                                onToggle: (val) {},
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child: GradientButton(
                            onPressed: () {},
                            text: "Save",
                            backgroundColor: Colors.red,
                            width: 80.w,
                            height: 5.h,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
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
