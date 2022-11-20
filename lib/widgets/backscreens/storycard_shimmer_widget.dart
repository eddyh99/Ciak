import 'package:ciak_live/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StoryCardShimmer extends StatelessWidget {
  const StoryCardShimmer({super.key});

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
        height: 25.h,
        width: 37.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: Colors.grey,
        ),
      ),
    );
  }
}
