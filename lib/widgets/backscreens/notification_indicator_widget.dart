import 'package:ciak_live/utils/extensions.dart';
import 'package:flutter/material.dart';

class NotificationIndicator extends StatelessWidget {
  const NotificationIndicator(
      {super.key, required this.child, this.indicatorColor = Colors.red});

  final Widget child;
  final Color indicatorColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        child,
        Icon(
          Icons.circle,
          color: indicatorColor,
          size: 1.3.h,
        ),
      ],
    );
  }
}
