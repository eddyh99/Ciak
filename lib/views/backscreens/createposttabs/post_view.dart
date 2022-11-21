import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/widgets/backscreens/gradient_dropdown_widget.dart';
import 'package:ciak_live/widgets/backscreens/gradient_textfield_widget.dart';
import 'package:ciak_live/widgets/backscreens/profile_avatar_widget.dart';
import 'package:flutter/material.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() {
    return _PostViewState();
  }
}

class _PostViewState extends State<PostView> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _tipTextController = TextEditingController();

  final List<String> _postList = ["Public", "Private", "Special", "On Request"];
  String _selectedPost = "Public";

  @override
  void initState() {
    super.initState();
    _tipTextController.text = "0.00";
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 100.h),
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      width: 100.w,
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(2.w, 1.h, 0.0, 0.0),
                            child: ProfileAvatar(
                              image: Image.asset("assets/images/people-2.jpg"),
                              radius: 16.sp,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(2.w, 2.5.h, 4.w, 0.0),
                            child: TextField(
                              focusNode: _focusNode,
                              autofocus: true,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 0.0),
                                hintText: "What's on your mind?",
                                fillColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              maxLines: 5,
                              minLines: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          iconSize: 30.sp,
                          splashRadius: 25.0,
                          onPressed: () {},
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
                              radius: 16.sp,
                              child: Icon(
                                Icons.add,
                                size: 24.sp,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 75.w),
                          margin: EdgeInsets.only(top: 0.5.h),
                          height: 24.h,
                          child: Stack(
                            children: [
                              const SizedBox.shrink(),
                              /*Image post for test
                              PostContent.image(
                                  Image.asset("assets/images/image-post-2.jpg"),
                                  aspectRatio: 16 / 9),*/

                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      splashRadius: 0.1,
                                      splashColor: Colors.transparent,
                                      onPressed: () {},
                                      icon: Image.asset(
                                        "assets/images/posting-image.png",
                                        scale: 1.4,
                                      ),
                                    ),
                                    IconButton(
                                      splashRadius: 0.1,
                                      splashColor: Colors.transparent,
                                      onPressed: () {},
                                      icon: Image.asset(
                                        "assets/images/posting-gif.png",
                                        scale: 1.4,
                                      ),
                                    ),
                                    IconButton(
                                      splashRadius: 0.1,
                                      splashColor: Colors.transparent,
                                      onPressed: () {},
                                      icon: Image.asset(
                                        "assets/images/posting-camera.png",
                                        scale: 1.4,
                                      ),
                                    ),
                                    IconButton(
                                      splashRadius: 0.1,
                                      splashColor: Colors.transparent,
                                      onPressed: () {},
                                      icon: Image.asset(
                                        "assets/images/posting-file.png",
                                        scale: 1.4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 30.w,
                        child: GradientDropdownButton(
                          items: _postList,
                          currentValue: _selectedPost,
                          onSelected: (value) {
                            setState(() {
                              _selectedPost = value.toString();
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 30.w,
                        child: GradientTextField(
                          controller: _tipTextController,
                          suffixText: "USD",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
