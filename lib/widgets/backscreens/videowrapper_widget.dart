import 'package:ciak_live/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoWrapper extends StatefulWidget {
  const VideoWrapper(
      {super.key,
      required this.videoPath,
      this.aspectRatio,
      this.useController = false});

  final String videoPath;
  final double? aspectRatio;
  final bool useController;

  @override
  State<VideoWrapper> createState() {
    return _VideoWrapperState();
  }
}

class _VideoWrapperState extends State<VideoWrapper> {
  late VideoPlayerController _controller;

  bool _showController = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        widget.videoPath) //.assets diganti dengan .network saat produksi
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.videoPath}.key"),
      child: GestureDetector(
        onTap: widget.useController
            ? () {
                if (mounted) {
                  setState(() {
                    if (_showController == false) {
                      _showController = true;
                    }
                  });
                }
              }
            : () {},
        child: ConstrainedBox(
          constraints: const BoxConstraints(),
          child: _controller.value.isInitialized
              ? Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    AspectRatio(
                      aspectRatio:
                          widget.aspectRatio ?? _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                    widget.useController
                        ? IconButton(
                            padding: EdgeInsets.zero,
                            splashRadius: 25.0,
                            onPressed: () {
                              if (mounted) {
                                setState(() {
                                  _controller.value.isPlaying
                                      ? _controller.pause()
                                      : _controller.play();
                                });
                              }
                            },
                            icon: _showController
                                ? Icon(
                                    _controller.value.isPlaying
                                        ? Icons.pause_circle_outline
                                        : Icons.play_circle_outline,
                                    size: 50.sp,
                                    color: Colors.white.withOpacity(0.7),
                                  )
                                : const SizedBox.shrink(),
                          )
                        : const SizedBox.shrink(),
                  ],
                )
              : AspectRatio(
                  aspectRatio: widget.aspectRatio ?? (1 / 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        size: 18.sp,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const Text("Can't load video"),
                    ],
                  ),
                ),
        ),
      ),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 90) {
          if (mounted) {
            setState(() {
              _controller.play();
            });
          }
        } else {
          if (mounted) {
            setState(() {
              _controller.pause();
              if (_showController == true) {
                _showController = false;
              }
            });
          }
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
