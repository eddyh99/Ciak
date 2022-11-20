import 'package:ciak_live/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TileShimmer extends StatelessWidget {
  const TileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).brightness == Brightness.light
          ? Colors.grey.shade300
          : Colors.grey.shade800,
      highlightColor: Theme.of(context).brightness == Brightness.light
          ? Colors.grey.shade100
          : Colors.grey.shade600,
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(5.w, 0.0, 3.w, 0.0),
        leading: CircleAvatar(
          radius: 16.sp,
          backgroundColor: Colors.grey,
        ),
        title: Padding(
          padding: EdgeInsets.only(right: 2.w),
          child: Container(
            height: 2.h,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
