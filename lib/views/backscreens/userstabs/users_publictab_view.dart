import 'package:ciak_live/utils/extensions.dart';
import 'package:ciak_live/utils/functions.dart';
import 'package:ciak_live/widgets/backscreens/postfeed_content_widget.dart';
import 'package:ciak_live/widgets/backscreens/postfeed_footer_widget.dart';
import 'package:ciak_live/widgets/backscreens/postfeed_header_widget.dart';
import 'package:ciak_live/widgets/backscreens/profile_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UsersPublicTabView extends StatefulWidget {
  const UsersPublicTabView({super.key});

  @override
  State<UsersPublicTabView> createState() {
    return _UsersPublicTabViewState();
  }
}

class _UsersPublicTabViewState extends State<UsersPublicTabView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          //Feeds post
          child: Column(
            children: [
              PostFeedHeader(
                leading: ProfileAvatar(
                  image: Image.asset("assets/images/people-3.jpg"),
                  radius: 16.sp,
                  hasStory: true,
                ),
                title: "Rebecca Kajon",
                subtitle: "4h ago",
                trailing: [
                  IconButton(
                    onPressed: () {
                      final TextEditingController tipController =
                          TextEditingController(text: "0.00");
                      showContentTipDialog(
                          context: context,
                          controller: tipController,
                          prefixCurrency: "\$ ",
                          onConfirm: () {});
                    },
                    icon: Image.asset(
                      "assets/images/tip.png",
                      scale: 1.0,
                    ),
                    splashRadius: 15.sp,
                  ),
                  IconButton(
                    onPressed: () {
                      showContentOptionDialog(context: context);
                    },
                    icon: const Icon(Icons.more_vert),
                    splashRadius: 15.sp,
                  )
                ],
              ),
              PostFeedContent(
                content: PostContent.image(
                    Image.asset("assets/images/image-post-1.jpg"),
                    aspectRatio: 16 / 9),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: PostFeedFooter(
                  leading: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_outline,
                          size: 15.sp,
                        ),
                        splashRadius: 15.sp,
                        iconSize: 15.sp,
                      ),
                      Text(
                        "7,189",
                        style: TextStyle(fontSize: 10.sp),
                      ),
                    ],
                  ),
                  ratingBar: RatingBar(
                    itemSize: 14.sp,
                    initialRating: 3,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
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
                  trailing: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share_outlined,
                        size: 15.sp,
                      ),
                      splashRadius: 15.sp,
                      iconSize: 15.sp,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/images/vs.png",
                        scale: 1.2,
                        color: Colors.white.withOpacity(0.5),
                        colorBlendMode: BlendMode.srcATop,
                      ),
                      splashRadius: 15.sp,
                      iconSize: 15.sp,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.bookmark_border_outlined,
                        size: 15.sp,
                      ),
                      splashRadius: 15.sp,
                      iconSize: 15.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
