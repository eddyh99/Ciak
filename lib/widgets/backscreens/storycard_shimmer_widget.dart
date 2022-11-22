import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StoryCardShimmer extends StatelessWidget {
  const StoryCardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).brightness == Brightness.light
          ? Colors.grey.shade300
          : Colors.grey.shade800,
      highlightColor: Theme.of(context).brightness == Brightness.light
          ? Colors.grey.shade100
          : Colors.grey.shade600,
      child: const Card(
        child: AspectRatio(aspectRatio: 3 / 4),
      ),
    );
  }
}
