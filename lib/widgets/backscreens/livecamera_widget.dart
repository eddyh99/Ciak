import 'package:blur/blur.dart';
import 'package:ciak_live/utils/extensions.dart';
import 'package:flutter/material.dart';

class LiveCamera extends StatelessWidget {
  const LiveCamera({super.key, this.liveCamera, this.hideCamera = false});

  final Widget? liveCamera;
  final bool? hideCamera;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.red,
            Colors.orange,
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(0.3.w),
        child: Blur(
          blur: hideCamera! ? 15.0 : 0.0,
          colorOpacity: hideCamera! ? 0.8 : 0.0,
          blurColor: hideCamera! ? Colors.grey : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          overlay: Center(
            child: hideCamera!
                ? Icon(
                    Icons.videocam_off_outlined,
                    size: 40.sp,
                    color: Colors.white,
                  )
                : null,
          ),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: liveCamera ??
                Center(
                  child: Icon(
                    Icons.video_camera_front_outlined,
                    size: 40.sp,
                    color: Colors.grey,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
