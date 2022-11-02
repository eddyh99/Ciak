import 'package:ciak_live/utils/extensions.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    this.headerImage,
    required this.avatar,
    this.body,
  });

  final Image? headerImage;
  final Widget avatar;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: 15.h,
              width: 100.w,
              child: headerImage,
            ),
            Positioned(
              bottom: -8.h,
              child: avatar,
            ),
          ],
        ),
        body ?? const SizedBox.shrink(),
      ],
    );
  }
}
