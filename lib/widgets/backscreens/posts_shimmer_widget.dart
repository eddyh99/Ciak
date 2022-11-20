import 'package:ciak_live/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PostShimmer extends StatelessWidget {
  const PostShimmer({super.key, this.contentHeight, this.isMedia = false});

  final double? contentHeight;
  final bool isMedia;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).brightness == Brightness.light
          ? Colors.grey.shade300
          : Colors.grey.shade800,
      highlightColor: Theme.of(context).brightness == Brightness.light
          ? Colors.grey.shade100
          : Colors.grey.shade600,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1.h),
        constraints: BoxConstraints(
          minHeight: 22.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(5.w, 0.0, 3.w, 0.0),
              leading: CircleAvatar(
                radius: 16.sp,
                backgroundColor: Colors.grey,
              ),
              title: Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 35.w,
                      height: 2.h,
                      color: Colors.grey,
                    ),
                    Container(
                      width: 35.w,
                      height: 2.h,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: isMedia
                  ? Container(
                      constraints: BoxConstraints(
                        minHeight: 25.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: Colors.grey,
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 2.h,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          height: 2.h,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          height: 2.h,
                          color: Colors.grey,
                        ),
                      ],
                    ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 15.w,
                    height: 2.h,
                    color: Colors.grey,
                  ),
                  Container(
                    width: 25.w,
                    height: 2.h,
                    color: Colors.grey,
                  ),
                  Container(
                    width: 35.w,
                    height: 2.h,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
