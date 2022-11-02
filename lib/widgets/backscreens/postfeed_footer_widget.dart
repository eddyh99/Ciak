import 'package:ciak_live/utils/extensions.dart';
import 'package:flutter/material.dart';

class PostFeedFooter extends StatelessWidget {
  const PostFeedFooter(
      {super.key, this.leading, this.ratingBar, required this.trailing});

  final Widget? leading;
  final Widget? ratingBar;
  final List<Widget> trailing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading ??
              Text(
                "0",
                style: TextStyle(fontSize: 10.sp),
              ),
          ratingBar ??
              Wrap(
                children: [
                  Icon(
                    Icons.star,
                    size: 14.sp,
                    color: Colors.grey,
                  ),
                  Icon(
                    Icons.star,
                    size: 14.sp,
                    color: Colors.grey,
                  ),
                  Icon(
                    Icons.star,
                    size: 14.sp,
                    color: Colors.grey,
                  ),
                  Icon(
                    Icons.star,
                    size: 14.sp,
                    color: Colors.grey,
                  ),
                  Icon(
                    Icons.star,
                    size: 14.sp,
                    color: Colors.grey,
                  ),
                ],
              ),
          Wrap(
            spacing: 0,
            children: trailing,
          ),
        ],
      ),
    );
  }
}
