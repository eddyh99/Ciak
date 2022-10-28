import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/backscreens/gradient_button_widget.dart';
import 'package:ciak_live/widgets/backscreens/profile_avatar_widget.dart';
import 'package:ciak_live/widgets/backscreens/profile_header_widget.dart';
import 'package:ciak_live/widgets/backscreens/rectangle_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditSubscriptionView extends StatefulWidget {
  const EditSubscriptionView({super.key});

  @override
  State<EditSubscriptionView> createState() {
    return _EditSubscriptionViewState();
  }
}

class _EditSubscriptionViewState extends State<EditSubscriptionView> {
  final GlobalKey<FormState> _subscriptionFormKey = GlobalKey<FormState>();
  final TextEditingController _oneMonthTextController = TextEditingController();
  final TextEditingController _threeMonthsTextController =
      TextEditingController();
  final TextEditingController _oneYearTextController = TextEditingController();

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
                  height: 15.h,
                ),
                SizedBox(
                  width: 80.w,
                  child: Form(
                    key: _subscriptionFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Text(
                            "1 Week",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        RectangleTextFormField(
                          controller: _oneMonthTextController,
                          maxLines: 1,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          hintText: '0.00',
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Text(
                            "2 Weeks",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        RectangleTextFormField(
                          controller: _threeMonthsTextController,
                          maxLines: 1,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          hintText: '0.00',
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Text(
                            "1 Month",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        RectangleTextFormField(
                          controller: _oneYearTextController,
                          maxLines: 1,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          hintText: '0.00',
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
